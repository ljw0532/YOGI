package yogi.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("adminMemberDao")
public class AdminMemberDao extends AbstractDAO{

	//멤버 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMemberList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdminMemberList", map);
	}
	
	//멤버 비활성화
	public void inactivateMember(Map<String, Object> map) {
		update("admin.inactivateMember", map);
	}
	
	//멤버 활성화
		public void activateMember(Map<String, Object> map) {
			update("admin.activateMember", map);
		}
		
	public List<Map<String, Object>> selectMemberOne(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("admin.selectAdminMemberOne", map);
	}
}
