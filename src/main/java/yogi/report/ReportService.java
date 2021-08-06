package yogi.report;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ReportService {

	public void insertReport(Map<String, Object> map) throws Exception;
	public Map<String, Object> viewUserInfo(HttpServletRequest request) throws Exception;
	public Map<String, Object> selectGroup(HttpServletRequest request, HttpSession session);
	public int checkReport(HttpServletRequest request);
}
