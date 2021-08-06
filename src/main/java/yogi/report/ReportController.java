package yogi.report;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.common.YogiConstants;
import yogi.config.CommandMap;

@Controller
public class ReportController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportService")
	private ReportService reportService;
	
	@RequestMapping(value="report/viewUserInfo")
	public ModelAndView viewUserInfo(HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView("viewUserInfo");
		
		/*Enumeration<String> params = request.getParameterNames(); 
		while(params.hasMoreElements()){
		 String paramName = params.nextElement();
		 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
		}*/
		
		Map<String, Object> report = reportService.selectGroup(request, session);
		List<String> group = (List<String>) report.get("groupList");
		if (group.isEmpty()) {
			mv.addObject("group", "0");
		}
		
		Map<String, Object> userInfo = reportService.viewUserInfo(request);
		mv.addObject("userInfo",userInfo);
		
		System.out.println(mv.getModelMap());
		
		return mv;
	}
	
	@RequestMapping(value="report/reportForm")
	public ModelAndView reportForm(HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("reportForm");
		
		Enumeration<String> params = request.getParameterNames(); 
		while(params.hasMoreElements()){
		 String paramName = params.nextElement();
		 System.out.println("Parameter Name - "+paramName+", Value - "+request.getParameter(paramName));
		}
		
		Map<String, Object> report = reportService.selectGroup(request, session);
		mv.addObject("report",report);
		
		System.out.println(report);
		
		return mv;
	}
	
	@RequestMapping(value="report/reportInsert", method=RequestMethod.POST)
	public String insertReport(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		 commandMap.put("m_no", request.getSession().getAttribute("session_m_no"));
		System.out.println(commandMap);
		reportService.insertReport(commandMap.getMap());
		
		return "redirect:/main";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkReport")
	public Map<Object, Object> checkReport(HttpServletRequest request){
		
		System.out.println(request.getParameter("userNo"));
		System.out.println(request.getParameter("groupNo"));
		
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		count = reportService.checkReport(request);
		map.put("cnt", count);
		
		System.out.println(map);
		return map;
	}
}
