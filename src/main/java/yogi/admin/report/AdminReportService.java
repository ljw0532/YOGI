package yogi.admin.report;

import java.util.List;
import java.util.Map;

public interface AdminReportService {
	
	//리포트 전체 리스트
	List<Map<String, Object>> selectAdminReportList(Map<String, Object> map) throws Exception;

}
