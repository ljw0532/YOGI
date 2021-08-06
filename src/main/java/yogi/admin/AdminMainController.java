package yogi.admin;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminMainController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMainService")
	private AdminMainService adminMainService;
	
	@RequestMapping(value="/admin/adminpageView")
	public ModelAndView adminpageView(HttpSession session) throws Exception{
		if (session.getAttribute("session_m_lv") == "관리자") {
			return new ModelAndView("redirect:/first");
		}
		ModelAndView mv = new ModelAndView("adminpageView");
		Map<String, Object> admin = adminMainService.selectOneAdminMember(session.getAttribute("session_m_no"));
		
		mv.addObject("admin", admin);
		
		return mv;
	}
}
