package yogi.report;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("reportService")
public class ReportServiceImpl implements ReportService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportDAO")
	private ReportDAO reportDAO;

	@Override
	public void insertReport(Map<String, Object> map) throws Exception {
		
		reportDAO.insertReport(map);
		reportDAO.updatePenalty(map);
		
	}

	@Override
	public Map<String, Object> viewUserInfo(HttpServletRequest request) throws Exception {
		
		return reportDAO.viewUserInfo(request.getParameter("m_pno"));
	}

	@Override
	public Map<String, Object> selectGroup(HttpServletRequest request, HttpSession session) {
		Map<String, Object> report = new HashMap<String, Object>();
		
		Map<String, Object> userInfo = reportDAO.viewUserInfo(request.getParameter("m_pno"));
		
		Map<String, Object> mnopno = new HashMap<String, Object>();
		mnopno.put("m_no", (Integer)session.getAttribute("session_m_no"));
		mnopno.put("m_pno", request.getParameter("m_pno"));
		
		List<Map<String, Object>> groupIntersection = reportDAO.groupIntersection(mnopno);//신고할 회원이 주최한 모임 리스트 뽑기
		
		report.put("userInfo", userInfo);
		report.put("groupList", groupIntersection);
		
		return report;
	}

	@Override
	public int checkReport(HttpServletRequest request) {
		Map<String, Object> report = new HashMap<String, Object>();
		
		report.put("userNo", request.getParameter("userNo"));
		report.put("groupNo", request.getParameter("groupNo"));
		
		return reportDAO.reportCheck(report);
	}

}
