package yogi.admin.report;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminReportService")
public class AdminReportServiceImpl implements AdminReportService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminReportDao")
	private AdminReportDao adminReportDao;

	@Override
	public List<Map<String, Object>> selectAdminReportList(Map<String, Object> map) throws Exception {
		System.out.println("adminReportService if절 remove 전 :"+map);
		if(map.get("searchWord") == null || StringUtils.isBlank(map.get("searchWord").toString())){
			map.remove("searchWord");
			map.remove("searchCategory");
		}
		if(map.get("searchMemberActive") == null || StringUtils.isBlank(map.get("searchMemberActive").toString())){
			map.remove("searchMemberActive");
		}
		if(map.get("searchGroupActive") == null || StringUtils.isBlank(map.get("searchGroupActive").toString())){
			map.remove("searchGroupActive");
		}
		
		System.out.println("adminReportService if절 remove 후 :"+map);
		
		return adminReportDao.selectReportList(map);
	}

}
