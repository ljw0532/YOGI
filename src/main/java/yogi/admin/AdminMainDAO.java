package yogi.admin;

import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("adminMainDAO")
public class AdminMainDAO extends AbstractDAO{

	public Map<String, Object> selectOneAdminMember(Object object) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("admin.selectOneAdminMember", object);
	}

}
