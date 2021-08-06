package yogi.admin;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminMainService")
public class AdminMainServiceImpl implements AdminMainService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMainDAO")
	private AdminMainDAO adminMainDAO;
	
	@Override
	public Map<String, Object> selectOneAdminMember(Object object) throws Exception {
		// TODO Auto-generated method stub
		return adminMainDAO.selectOneAdminMember(object);
	}
}
