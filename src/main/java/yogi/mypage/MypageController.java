package yogi.mypage;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.util.PagingCalculator;

import yogi.admin.lendplace.AdminLendplaceService;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;
import yogi.members.MembersModel;

@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mypageService")
	private MypageService mypageService;

	
	@RequestMapping("/mypage/mypageView")
	public ModelAndView mypageView(HttpSession session) throws Exception{
		if (session.getAttribute("session_m_no") == null) {
			return new ModelAndView("redirect:/first");
		}
		ModelAndView mv = new ModelAndView("/mypage/mypageViewCss");
		Map<String, Object> member = mypageService.selectOneMember(session.getAttribute("session_m_no"));
		
		mv.addObject("member", member);
		
		return mv;
		
	}
	
	//내가 개설한 모임
	@RequestMapping(value="/mypage/writeHistory")
	public ModelAndView writeHistory(CommandMap commandMap,HttpSession session, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/mypage/mypageWriteHistory");
		commandMap.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.selectWriteHistory(commandMap.getMap());

		PagingCalculator paging = new PagingCalculator("/mypage/writeHistory", commandMap.getCurrentPageNo(), list, 10, 3);
		 Map<String, Object> page = paging.getPagingList();
	     mv.addObject("list", page.get("list"));
	     mv.addObject("pagingHtml",page.get("pagingHtml"));
	     mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		return mv;
	}
	
	//내가 참여한 모임
	@RequestMapping(value="/mypage/meetHistory")
	public ModelAndView meetHistory(CommandMap commandMap, HttpSession session , HttpServletRequest request)  throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/mypage/mypageMeetHistory");
		commandMap.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.selectMeetHistory(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/mypage/meetHistory", commandMap.getCurrentPageNo(), list, 10, 3);
//		commandMap.put("m_no", session.getAttribute("session_m_no"));

		 Map<String, Object> page = paging.getPagingList();
	     mv.addObject("list", page.get("list"));
	     mv.addObject("pagingHtml",page.get("pagingHtml"));
	     mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	
	//내가 찜한 모임
	@RequestMapping(value="/mypage/zzimHistory")
	public ModelAndView zzimHistory(CommandMap commandMap, HttpSession session, HttpServletRequest request ) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/mypage/mypageZzimHistory");
		commandMap.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.selectZzimHistory(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/mypage/zzimHistory", commandMap.getCurrentPageNo(), list, 10, 3);
//		commandMap.put("m_no", session.getAttribute("session_m_no"));
		Map<String, Object> page = paging.getPagingList();
	    mv.addObject("list", page.get("list"));
	    mv.addObject("pagingHtml",page.get("pagingHtml"));
	    mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	
	
	
	//장소 신청 내역
	@RequestMapping(value="/mypage/placebookHistory")
	public ModelAndView placebookHistory(CommandMap commandMap, HttpSession session,  HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/mypage/mypagePlacebookHistory");
		commandMap.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.selectPlacebookHistory(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/mypage/placebookHistory", commandMap.getCurrentPageNo(), list, 10, 3);
		Map<String, Object> page = paging.getPagingList();
	    mv.addObject("list", page.get("list"));
	    mv.addObject("pagingHtml",page.get("pagingHtml"));
	    mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	
	
	//  신고 내역
	@RequestMapping(value="/mypage/reportHistory")
	public ModelAndView reportHistory(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/mypage/mypageReportHistory");
		commandMap.put("m_no", session.getAttribute("session_m_no"));
		List<Map<String, Object>> list = mypageService.selectReportHistory(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/mypage/reportHistory", commandMap.getCurrentPageNo(), list, 10, 3);
		
		Map<String, Object> page = paging.getPagingList();
	    mv.addObject("list", page.get("list"));
	    mv.addObject("pagingHtml",page.get("pagingHtml"));
	    mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	

}
