package yogi.admin.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;

@Controller
public class AdminGroupController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminGroupService")
	private AdminGroupService adminGroupService;

	@RequestMapping(value="/admin/group/list")
	public ModelAndView memberList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("adminGroupList");
		List<Map<String, Object>> list = adminGroupService.selectAdminGroupList(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/admin/group/list", commandMap.getCurrentPageNo(), list, 20 ,3);
		Map<String, Object> result = paging.getPagingList();
		mv.addObject("list",result.get("list"));
		mv.addObject("pagingHtml", result.get("pagingHtml"));
    	mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/group/inactivateGroup")
	public ModelAndView inactivateGroup(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/group/list");
		adminGroupService.inactivateGroup(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/admin/group/activateGroup")
	public ModelAndView activateGroup(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/group/list");
		adminGroupService.activateGroup(commandMap.getMap());
		
		return mv;
	}

}
