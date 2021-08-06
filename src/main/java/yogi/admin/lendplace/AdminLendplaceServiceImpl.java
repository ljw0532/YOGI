package yogi.admin.lendplace;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.admin.lendplace.AdminLendplaceDAO;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;
import yogi.lendplace.LendplaceModel;

@Service("adminLendplaceService")
public class AdminLendplaceServiceImpl implements AdminLendplaceService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminLendplaceDAO")
	private AdminLendplaceDAO lendplaceDAO;
	
	@Override
	public void insertPlace (Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.insertPlace(map);
		
	/*	MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = multipartHttpServletRequest.getFile("L_REP_IMG");

		Map<String, Object> listMap = new HashMap<String, Object>();

		String IMAGE = null;
		String IMAGEExtension = null;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
		}

		if (multipartFile.getSize() > 0) {

			String L_NO = map.get("L_NO").toString();
			IMAGEExtension = multipartFile.getOriginalFilename()
					.substring(multipartFile.getOriginalFilename().lastIndexOf("."));
			IMAGE = "LEND_" + L_NO + IMAGEExtension;

			file = new File(filePath + IMAGE);
			multipartFile.transferTo(file);

			listMap.put("L_REP_IMG", IMAGE);
			listMap.put("L_NO", map.get("L_NO"));

			lendplaceDAO.ImgInsert(listMap);
		}*/
		}


	@Override
	public void deletePlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.deletePlace(map);
		
	}

	@Override
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception {
		System.out.println("adminlendplaceService if절 remove 전 :"+map);
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
			map.remove("searchCategory");
		}
		System.out.println("adminlendplaceService if절 remove 후 :"+map);
		return lendplaceDAO.selectLendplaceList(map);
	}

	@Override
	public List<Map<String, Object>> selectPlaceBookList(Map<String, Object> map) throws Exception {
		System.out.println("adminlendplaceService if절 remove 전 :"+map);
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
			map.remove("searchCategory");
		}
		System.out.println("adminlendplaceService if절 remove 후 :"+map);
		
		return lendplaceDAO.selectPlaceBookList(map);
	}
	
    @Override
	public void applyPlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.applyPlace(map);
		
	}

	@Override
	public void cancelPlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.cancelPlace(map);
	}

	@Override
	public void dwCountUdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		lendplaceDAO.dwCountUdate(map);
	}


	@Override
	public Map<String, Object> selectOneLend(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return lendplaceDAO.selectOneLend(map);
	}
	
	
}
	
	
