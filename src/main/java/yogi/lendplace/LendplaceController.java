package yogi.lendplace;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;

@Controller
public class LendplaceController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="lendplaceService")
	private LendplaceService lendplaceService;
	
	//장소 목록 & 검색
	@RequestMapping(value="/lendplace/list")
    public ModelAndView selectLendplaceList(CommandMap commandMap,HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/lendplace/list");
    	List<Map<String, Object>> list = lendplaceService.selectLendplaceList(commandMap.getMap());
    	PagingCalculator paging = new PagingCalculator("lendplace/list", commandMap.getCurrentPageNo(), list, 6 ,3);
    	Map<String, Object> result = paging.getPagingList();
    	mv.addObject("list",result.get("list"));
    	mv.addObject("pagingHtml", result.get("pagingHtml"));
    	mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
    	
		return mv;
	}
	
	//장소 상세
	@RequestMapping(value="/lendplace/detail")
	public ModelAndView selectLendplaceDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/lendplace/detail");
		Map<String,Object> map = lendplaceService.selectLendplaceDetail(commandMap.getMap());
		if (map.get("L_CONTENT").toString().contains("\r\n")) {
			String content2 = map.get("L_CONTENT").toString().replace("\r\n", "<br>");
			map.put("L_CONTENT2", content2);
		}
		commandMap.put("M_NO", session.getAttribute("session_m_no"));
		List<Map<String, Object>> check = lendplaceService.checkReview(commandMap.getMap());
		if(check != null)
			mv.addObject("check", check);
		else
			mv.addObject("check", null);
		mv.addObject("map", map);
		int Udate = (Integer.parseInt(map.get("L_UDATE").toString()));
		double n = Double.parseDouble(map.get("L_RATE").toString() );
		mv.addObject("rate", (int)n * 10 / 10);
		System.out.println(n*10/10);
		if (Udate != 0 && Udate >= 1) {
			List<Map<String, Object>> date = lendplaceService.dateCheck(commandMap.getMap());
			mv.addObject("date",date);
		}
		List<Map<String, Object>> list = lendplaceService.selectReview(commandMap.getMap());
		mv.addObject("list",list);
		
		return mv;
	}
	
	//장소 수정폼
		@RequestMapping(value="/lendplace/updateForm")
		public ModelAndView updateLendplaceForm(CommandMap commandMap) throws Exception{
			ModelAndView mv = new ModelAndView("/admin/lendplaceUpdateForm");
			Map<String,Object> map = lendplaceService.selectLendplaceDetail(commandMap.getMap());
			mv.addObject("map", map);
			return mv;  
		}
	
	//장소 수정
	@RequestMapping(value="/lendplace/update")
	public ModelAndView updateLendplace(CommandMap commandMap) throws Exception{
	         lendplaceService.updateLendplace(commandMap.getMap());
	         return new ModelAndView("redirect:/admin/lendplace/list"); 
	}
	
	//장소 신청
	@RequestMapping(value="/lendplace/apply")
    public ModelAndView placebookInsert(CommandMap commandMap) throws Exception{
		lendplaceService.insertPlacebook(commandMap.getMap());
		lendplaceService.upCountUdate(commandMap.getMap());
		return new ModelAndView("redirect:/lendplace/detail?L_NO="+commandMap.getMap().get("L_NO")); //리다이렉트 : 장소 상세 페이지
	    }
	
	
    //후기 저장 & 수정
    @RequestMapping(value="/lendplace/insertReview")
    public ModelAndView insertReview(CommandMap commandMap) throws Exception{
    	
    	if( commandMap.get( "star-input" ) != null)	
    		commandMap.put("rate", commandMap.get( "star-input" ));
    	else
    		commandMap.put("rate", -1 );
    	
    	if (commandMap.get("R_NO") == null || "".equals(commandMap.get("R_NO"))) {
    		if (commandMap.get("R_PARENT") != null) {
    			lendplaceService.updateReviewOrder(commandMap.getMap());
    		} 
    		lendplaceService.insertReview(commandMap.getMap());
    		lendplaceService.updateplusGrade(commandMap.getMap());
    	}else {
    		lendplaceService.updateReview(commandMap.getMap());
    	}
        return new ModelAndView("redirect:/lendplace/detail?L_NO=" + commandMap.getMap().get("L_NO"));
    }

    //후기 삭제
    @RequestMapping(value="/lendplace/deleteReview")
    public ModelAndView deleteReview(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/lendplace/detail?L_NO=" + commandMap.getMap().get("L_NO"));
    	Map<String,Object> map = lendplaceService.selectReviewChild(commandMap.getMap());
    	Integer cnt = Integer.parseInt(map.get("CNT").toString());
    	if ( cnt == 0) {
    		Map<String,Object> del = lendplaceService.selectDeletedParent(commandMap.getMap());
    		Map<String,Object> par = lendplaceService.selectParent(commandMap.getMap());
    		Integer DEL = Integer.parseInt(del.get("DEL").toString());
    		Integer PAR = Integer.parseInt(par.get("PAR").toString());
    		
    		lendplaceService.deleteReview(commandMap.getMap());
    		lendplaceService.updateminusGrade(commandMap.getMap());
    		if ( DEL == (PAR-1)) {
				lendplaceService.deleteGroupReview(commandMap.getMap());
			}
        	return mv;	
        }else {
        	lendplaceService.updateDeleteFlag(commandMap.getMap());
        	lendplaceService.updateminusGrade(commandMap.getMap());
    		return mv;
        }
    }
}
