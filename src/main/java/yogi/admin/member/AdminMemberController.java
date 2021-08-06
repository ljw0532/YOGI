package yogi.admin.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;



@Controller
public class AdminMemberController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminMemberService")
	private AdminMemberService adminMemberService;

	@RequestMapping(value="/admin/member/list")
	public ModelAndView memberList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("adminMemberList");
		List<Map<String, Object>> list = adminMemberService.selectAdminMemberList(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/admin/member/list", commandMap.getCurrentPageNo(), list, 20 ,3);
		Map<String, Object> result = paging.getPagingList();
		mv.addObject("list",result.get("list"));
		mv.addObject("pagingHtml", result.get("pagingHtml"));
    	mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/member/inactivateMember")
	public ModelAndView inactivateMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/member/list");
		//System.out.println("adminMemberController 실행");
		//System.out.println("커맨드맵 : "+commandMap.get("M_NO"));
		adminMemberService.inactivateMember(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/member/activateMember")
	public ModelAndView activateMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/member/list");
		//System.out.println("adminMemberController 실행");
		//System.out.println("커맨드맵 : "+commandMap.get("M_NO"));
		adminMemberService.activateMember(commandMap.getMap());
		
		return mv;
	}
}
