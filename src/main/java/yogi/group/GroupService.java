package yogi.group;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import yogi.group.GroupModel;

public interface GroupService {
	
	List<Map<String, Object>> selectGroupList(Map<String, Object> map) throws Exception;	
	
	Map<String, Object> selectGroupDetail(Map<String, Object> map) throws Exception;
	
	int insertLikeit(Map<String, Object> map, HttpServletRequest request) throws Exception;

	void insertGroupEnroll(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	public void insertGroup(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	public Map<String, Object> modifyGroup(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void insertComments(Map<String, Object> map) throws Exception;

	void inactivateGroup(Map<String, Object> map);
	
	void deleteComments(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectCmtChild(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectDeletedParent(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectParent(Map<String, Object> map) throws Exception;
	
	void updateDeleteFlag(Map<String, Object> map) throws Exception;
	
	void cmtGroupDelete(Map<String, Object> map) throws Exception;
	
	void updateReplyStep(Map<String, Object> map) throws Exception;
}
