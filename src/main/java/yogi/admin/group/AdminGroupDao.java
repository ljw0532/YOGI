package yogi.admin.group;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("adminGroupDao")
public class AdminGroupDao extends AbstractDAO{

	//그룹 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGroupList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdminGroupList", map);
	}
	
	//그룹 비활성화
	public void inactivateGroup(Map<String, Object> map) {
		update("admin.inactivateGroup", map);
	}
	
	//그룹 활성화
	public void activateGroup(Map<String, Object> map) {
		update("admin.activateGroup", map);
	}
}
