package yogi.admin.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminGroupService")
public class AdminGroupServiceImpl implements AdminGroupService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminGroupDao")
	private AdminGroupDao adminGroupDao;

	@Override
	public List<Map<String, Object>> selectAdminGroupList(Map<String, Object> map) throws Exception {
		System.out.println("adminGroupService if절 remove 전 :"+map);
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
			map.remove("searchCategory");
		}
		if(map.get("searchGroupActive") == null || StringUtils.isBlank(map.get("searchGroupActive").toString())){
			map.remove("searchGroupActive");
		}
		
		System.out.println("adminGroupService if절 remove 후 :"+map);
		
		return adminGroupDao.selectGroupList(map);
	}

	@Override
	public void inactivateGroup(Map<String, Object> map) throws Exception {
		adminGroupDao.inactivateGroup(map);
		
	}
	
	@Override
	public void activateGroup(Map<String, Object> map) throws Exception {
		adminGroupDao.activateGroup(map);
		
	}
	
	
}
