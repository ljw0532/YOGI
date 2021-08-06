package yogi.members;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import yogi.common.util.FileUtils;

@Service("membersService")
public class MembersServiceImpl implements MembersService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="membersDAO")
	private MembersDAO membersDAO;
	
	private static final String filePath = "C:\\java\\git\\YOGI\\YOGI\\src\\main\\webapp\\resources\\upload\\";
	
	@Override
	public void insertMember(MembersModel model, HttpServletRequest request) throws Exception{
		Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		if(fileMap != null) {
			model.setM_profile(fileMap.toString().valueOf(fileMap.get("STORED_FILE_NAME")));
			System.out.println(model.getM_profile());
		}
		model.setM_date(Calendar.getInstance().getTime());
		membersDAO.insertMember(model);
	}
	
	@Override
	public void insertSnsMember(MembersModel model, HttpServletRequest request) throws Exception {
		Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		if(fileMap != null) {
			model.setM_profile(fileMap.toString().valueOf(fileMap.get("STORED_FILE_NAME")));
			System.out.println(model.getM_profile());
		}
		model.setM_date(Calendar.getInstance().getTime());
		membersDAO.insertSnsMember(model);
	}

	
	@Override
	public int checkId(String id) {
		return membersDAO.idCheck(id);
	}
	
	@Override
	public int checkPhone(String phone) {
		return membersDAO.phoneCheck(phone);
	}
	
	@Override
	public int checksnsId(String password) {
		return membersDAO.snsIdCheck(password);
	}

	@Override
	public MembersModel snsLoginCheck(String password) {
		return (MembersModel)membersDAO.snsLoginCheck(password);
	}
	
	@Override
	public MembersModel loginCheck(MembersModel model, HttpServletRequest request) {
		membersDAO.loginCheck(model);
		return (MembersModel)membersDAO.loginCheck(model);
	}

	@Override
	public MembersModel findId(MembersModel model, HttpServletRequest request) {
		return (MembersModel)membersDAO.findId(model);
	}
	
	@Override
	public MembersModel findPW(MembersModel model, HttpServletRequest request) {
		return (MembersModel)membersDAO.findPW(model);
	}

	@Override
	public void resetPW(MembersModel model) {
		membersDAO.resetPW(model);
	}

	//회원 정보 수정
	@Override
	public MembersModel mInfo(int no) {
		return (MembersModel)membersDAO.mInfo(no);
	}

	@Override
	public void updateMember(MembersModel model, HttpServletRequest request) throws Exception {
		
		Map<String, Object> fileMap = fileUtils.parseInsertFileInfo(request);
		
		if(fileMap!=null) {
			
			//기존 파일 가져오기
			String deleteFileName = membersDAO.deleteFileName(model.getM_no());
			//기존 파일이 존재하면 삭제
			if(deleteFileName!=null) {
				File deleteFile = new File(filePath+deleteFileName);
				deleteFile.delete();
			}
			model.setM_profile(fileMap.get("STORED_FILE_NAME").toString());
			System.out.println("이미지 변경 : "+model.getM_profile());
			membersDAO.updateMember(model);
		}
		else {
			membersDAO.updateMemberExceptFile(model);
		}
		
	}

	//회원 탈퇴
	@Override
	public void deleteMember(String name) {
		membersDAO.deleteMember(name);
	}

	
}
