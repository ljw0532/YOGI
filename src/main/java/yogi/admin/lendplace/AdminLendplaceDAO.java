package yogi.admin.lendplace;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;
import yogi.lendplace.LendplaceModel;

@Repository("adminLendplaceDAO")
public class AdminLendplaceDAO extends AbstractDAO{

	public void insertPlace(Map<String, Object> map ) {
		insert("lendplace.insertLendplace", map);
	}

	public void deletePlace(Map<String, Object> map) {
		// TODO Auto-generated method stub
		delete("lendplace.deleteLendplace",map);
		
	}
	
	public List<Map<String, Object>> selectLendplaceList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdminLendplaceList", map);
	}
	
	public List<Map<String, Object>> selectPlaceBookList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdminPlaceBookList", map);
	}
	
	public void applyPlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		insert("lendplace.insertPlacebook", map);
		
	}

	public void cancelPlace(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		delete("lendplace.deletePlacebook", map);
	}

	public void dwCountUdate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("lendplace.dwCountUdate", map);
		
	}

	public Map<String, Object> selectOneLend(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("lendplace.selectLendplaceDetail", map);
		
	}
	
}
