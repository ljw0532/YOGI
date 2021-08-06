package yogi.report;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import yogi.common.dao.AbstractDAO;

@Repository("reportDAO")
public class ReportDAO extends AbstractDAO{

	public void insertReport(Map<String, Object> map) {
		insert("report.insertReport", map);
	}
	
	public Map<String, Object> viewUserInfo(String str){
		return (Map<String, Object>) selectOne("report.viewUserInfo", str);
	}
	
	public List<Map<String, Object>> groupIntersection(Map<String, Object> mnopno){
		return (List<Map<String, Object>>) selectList("report.groupIntersection", mnopno);
	}
	
	public void updatePenalty(Map<String, Object> map) {
		update("report.updatePenaltyByMNO", map);
		update("report.updatePenaltyByGGNO", map);
	}
	
	public int reportCheck(Map<String, Object> map) {
		if(selectOne("report.reportCheck", map) != null)
			return 1;
		else
			return 0;
	}
}
