package yogi.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import yogi.members.MembersDAO;
import yogi.members.MembersModel;

@Service
public class MainServiceImpl implements MainService{
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	

	@Override
	public MembersModel getInterest(String id) {
		return mainDAO.getInterest(id);
	}


	@Override
	public  List<Map<String, Object>> fav_field(Map<String, Object> map)throws Exception{
		return mainDAO.fav_field(map);
	}
	
	@Override
	public List<Map<String, Object>> fav_area(Map<String, Object> map)throws Exception{
		return mainDAO.fav_area(map);
	}


	@Override
	public List<Map<String, Object>> all() {
		return mainDAO.all();
	}
	

}
