package yogi.admin.report;

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
public class AdminReportController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="adminReportService")
	private AdminReportService adminReportService;

	@RequestMapping(value="/admin/report/list")
	public ModelAndView memberList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("adminReportList");
		List<Map<String, Object>> list = adminReportService.selectAdminReportList(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/admin/report/list", commandMap.getCurrentPageNo(), list, 20 ,3);
		Map<String, Object> result = paging.getPagingList();
		mv.addObject("list",result.get("list"));
		mv.addObject("pagingHtml", result.get("pagingHtml"));
    	mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
}
