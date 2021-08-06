package yogi.group;

import java.util.Date;
import java.util.Enumeration;
import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import yogi.alram.AlramService;
import yogi.common.common.YogiConstants;
import yogi.common.util.FileUtils;
import yogi.common.util.YogiUtils;
import yogi.group.GroupDAO;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

@Service("groupService")
public class GroupServiceImpl implements GroupService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="groupDAO")
	private GroupDAO groupDAO;
	
	@Resource(name="alramService")
	private AlramService alramService;
	private static final String filePath = "C:\\java\\git\\YOGI\\YOGI\\src\\main\\webapp\\resources\\upload\\";

	@Override
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) throws Exception {
		if(map.get("searchCategory") == null || StringUtils.isBlank(map.get("searchCategory").toString())){
			map.remove("searchCategory");
		}
		if(map.get("searchAddr") == null || StringUtils.isBlank(map.get("searchAddr").toString())){
			map.remove("searchAddr");
		}
		if(map.get("searchMStart") == null || StringUtils.isBlank(map.get("searchMStart").toString())){
			map.remove("searchMStart");
		}
		if(map.get("searchPay") == null || StringUtils.isBlank(map.get("searchPay").toString())){
			map.remove("searchPay");
		}
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
		}
		
		List<Map<String, Object>> resultList = groupDAO.selectGroupList(map);

		return resultList;
	}

	@Override
	public Map<String, Object> selectGroupDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println(map);
		Map<String, Object> detail = groupDAO.selectGroupDetail(map);
		Map<String, Object> sWriter = groupDAO.sessionWriter(map);
		List<Map<String,Object>> geList = groupDAO.groupEnrollList(map);
		List<Map<String,Object>> cmtList = groupDAO.selectCmtList(map);
		if (detail.get("GG_DETAIL").toString().contains("\r\n")) {
			String detail2 = detail.get("GG_DETAIL").toString().replace("\r\n", "<br>");
			detail.put("GG_DETAIL", detail2);
		}
		Map<String, Object> enrollM = groupDAO.enrollMno(map);
		detail.put("GG_DATE", YogiUtils.dateFormat((Date)detail.get("GG_DATE")));
		if(map.get("m_no") != null && !StringUtils.isEmpty(map.get("m_no").toString())) {
			Map<String, Object> likeit = groupDAO.selectLikeitExist(map);
			Map<String, Object> enroll = groupDAO.selectGroupEnrollExist(map);		
			if(likeit != null) {
				detail.put("GG_LIKEIT", likeit.get("LI_NO"));
			} else { 
				detail.put("GG_LIKEIT", null); 
			}
		
			if(enroll != null) {
				detail.put("GG_ENROLL", enroll.get("GE_NO"));
			} else {
				detail.put("GG_ENROLL", null);
			}
			
		} else {
			detail.put("GG_LIKEIT", null);
			detail.put("GG_ENROLL", null);
		}
		resultMap.put("enrollM", enrollM);
		resultMap.put("detail", detail);
		resultMap.put("cmtList", cmtList);
		resultMap.put("geList", geList);
		resultMap.put("sWriter", sWriter);
		return resultMap;
	}

	@Override
	public int insertLikeit(Map<String, Object> map, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = groupDAO.selectLikeitExist(map);
		if(resultMap == null){
			groupDAO.insertLikeit(map);
			return 1;
		} else {
			groupDAO.deleteLikeit(map);		
			groupDAO.deleteLikeit(map);
			return 0;
		}
	}
	
	@Override
	public void insertGroupEnroll(Map<String, Object> map, HttpServletRequest request) throws Exception {
		map.put("m_no", request.getSession().getAttribute(YogiConstants.M_NO));
		Map<String, Object> resultMap = groupDAO.selectGroupEnrollExist(map);
		if(resultMap == null){
			groupDAO.insertGroupEnroll(map);
			groupDAO.plusGrade(map);
			groupDAO.plusCrp(map);
		} else {
			groupDAO.deleteGroupEnroll(map);
			groupDAO.minusGrade(map);
			groupDAO.minusCrp(map);
		}
	}
	
	@Override
	public void insertGroup(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		
		//넘어오는 파일객체가 있으면
		if(fileMap!=null) {
			map.put("gg_ofn", fileMap.get("ORIGINAL_FILE_NAME"));
			map.put("gg_rfn", fileMap.get("STORED_FILE_NAME"));
			
			groupDAO.insertGroup(map);
		}
		else {
			groupDAO.insertGroupExceptFile(map);
		}
		
	}

	@Override
	public Map<String, Object> modifyGroup(Map<String, Object> map, HttpServletRequest request) throws Exception {
		System.out.println("groupModify:Sevice 실행");
/*
		//주소 재등록
		if(map.get("gg_addr")==null) {
			map.put("gg_addr", groupDAO.selectGroupAddr(map.get("gg_no").toString()));
		}
		if(map.get("gg_place")==null) {
			map.put("gg_place", groupDAO.selectGroupPlace(map.get("gg_no").toString()));
		}
		*/
		//새로 넘어온 파일 처리
		Enumeration<String> params = request.getParameterNames();
		while(params.hasMoreElements()) {
			String paramName = params.nextElement();
			System.out.println("parameter Name -" + paramName + ", value -" +request.getParameter(paramName));
		}
		
		
		Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		if(fileMap!=null) {
			
			//기존 파일 가져오기
			String deleteFileName = groupDAO.deleteFileName(map.get("gg_no").toString());
			//기존 파일이 존재하면 삭제
			if(deleteFileName!=null) {
				File deleteFile = new File(filePath+deleteFileName);
				deleteFile.delete();
			}
			map.put("gg_ofn", fileMap.get("ORIGINAL_FILE_NAME"));
			map.put("gg_rfn", fileMap.get("STORED_FILE_NAME"));
			System.out.println("그룹 이미지 변경 : "+map.get("gg_ofn")+" & "+map.get("gg_rfn"));
			List<Map<String,Object>> geList = groupDAO.groupEnrollList(map);
			if(geList.size()!=0) { 
			
				for(int i=0; i<geList.size(); i++) {
					alramService.regAlram(Integer.parseInt(geList.get(i).get("M_NO").toString()),(String)map.get("wt_name"), 2, Integer.parseInt(map.get("gg_no").toString()));
				}
			}
			System.out.println("groupDAO modifyGroup Map : "+map);
			groupDAO.modifyGroup(map);
		}
		else {
			List<Map<String,Object>> geList = groupDAO.groupEnrollList(map);
			if(geList.size()!=0) { 
			
				for(int i=0; i<geList.size(); i++) {
					alramService.regAlram(Integer.parseInt(geList.get(i).get("M_NO").toString()),(String)map.get("wt_name"), 2, Integer.parseInt(map.get("gg_no").toString()));
				}
			}
			groupDAO.modifyGroupExceptFile(map);
		}
		
		System.out.println("그룹 수정 내용 : "+map);
		return map;
		
	}
	
	@Override
	public void insertComments(Map<String, Object> map) throws Exception {
		
		groupDAO.insertCmt(map);
	}
	
	@Override
	public void deleteComments(Map<String, Object> map) throws Exception {
		groupDAO.cmtDelete(map);
	}

	@Override
	public void inactivateGroup(Map<String, Object> map){
		groupDAO.inactivateGroup(map);
	}

	@Override
	public Map<String, Object> selectCmtChild(Map<String, Object> map) throws Exception {	
		return groupDAO.selectCmtChild(map);
	}

	@Override
	public Map<String, Object> selectDeletedParent(Map<String, Object> map) throws Exception {
		return groupDAO.selectDeletedParent(map);
	}

	@Override
	public Map<String, Object> selectParent(Map<String, Object> map) throws Exception {
		return groupDAO.selectParent(map);
	}

	@Override
	public void updateDeleteFlag(Map<String, Object> map) throws Exception {
		groupDAO.updateDeleteFlag(map);
		
	}

	@Override
	public void cmtGroupDelete(Map<String, Object> map) throws Exception {
		groupDAO.cmtGroupDelete(map);
		
	}
	
	@Override
	public void updateReplyStep(Map<String, Object> map) throws Exception{
		groupDAO.updateReplyStep(map);
	}
}
