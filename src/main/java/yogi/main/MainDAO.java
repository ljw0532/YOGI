package yogi.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;
import yogi.members.MembersModel;

@Repository ("mainDAO")
public class MainDAO extends AbstractDAO{
	public MembersModel getInterest(String id) {
		return (MembersModel)selectOne("members.check", id);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> fav_field(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("members.fav_field", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> fav_area(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("members.fav_area", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> all(){
		return (List<Map<String, Object>>)selectList("members.all");
	}
	
	

}
