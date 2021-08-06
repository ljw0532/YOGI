package yogi.admin.report;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("adminReportDao")
public class AdminReportDao extends AbstractDAO{

	//리포트 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.selectAdminReportList", map);
	}
}
