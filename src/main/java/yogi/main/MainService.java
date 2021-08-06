package yogi.main;

import java.util.List;
import java.util.Map;

import yogi.members.MembersModel;

public interface MainService {
	public MembersModel getInterest(String id);
	public List<Map<String, Object>> fav_field(Map<String, Object> map)throws Exception;
	public List<Map<String, Object>> fav_area(Map<String, Object> map)throws Exception;
	public List<Map<String, Object>> all();
}
