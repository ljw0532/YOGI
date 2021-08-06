package yogi.admin.lendplace;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;


import yogi.lendplace.LendplaceModel;
import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;

@Controller
public class AdminLendplaceController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminLendplaceService")
	private AdminLendplaceService lendplaceService;
	
	@RequestMapping(value= "/admin/lendplace/Form")
	public String lendplaceForm(){
		return "/admin/lendplaceForm";
	}
	
	@RequestMapping(value= "/test")
	public String test(){
		return "/admin/test";
	}
	

	//장소등록
    @RequestMapping(value="/admin/lendplace/Insert", method=RequestMethod.POST)
       public ModelAndView lendplaceInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
   
       
       MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
       MultipartFile L_REP_IMG = multipartRequest.getFile("L_REP_IMG");
         
         String filePath = "C:\\git\\YOGI\\YOGI\\src\\main\\webapp\\resources\\upload\\";
         String fileName = L_REP_IMG.getOriginalFilename();
         String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
         String fileName2="L_REP_IMG"+System.currentTimeMillis()+IMAGEExtension;
         
         commandMap.put("L_REP_IMG", fileName2);
         lendplaceService.insertPlace(commandMap.getMap(), request);
         
         File file = new File(filePath + fileName2);

      /*   if (file.exists() == false) {
            file.mkdirs();
         }*/

         L_REP_IMG.transferTo(file);

         return new ModelAndView("redirect:admin/lendplace/list"); //리다이렉트:관리자 장소 리스트 페이지
       }
         
	//테스트용 success화면
	@RequestMapping(value= "/admin/lendplaceSuccess")
	public String lendplaceSuccess(){
		return "/admin/lendplaceSuccess";
	}
	  
	//장소 삭제
	@RequestMapping(value="/admin/lendplace/Delete")
	public ModelAndView lendplaceDelete(CommandMap commandMap) throws Exception {
		
		String filePath = "C:\\git\\YOGI\\YOGI\\src\\main\\webapp\\resources\\upload\\";
		
		Map<String, Object> lmap = new HashMap<String, Object>();
		lmap = lendplaceService.selectOneLend(commandMap.getMap());
		if(lmap.get("L_REP_IMG") != null) {
			File imagefile = new File(filePath + lmap.get("L_REP_IMG"));
			imagefile.delete();
			
		}
		lendplaceService.deletePlace(commandMap.getMap());
		return new ModelAndView("redirect:/admin/lendplace/list"); //리다이렉트 : 관리자 장소 리스트 페이지
	}
	
	//장소 리스트
	@RequestMapping(value="/admin/lendplace/list")
	public ModelAndView lendplaceList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("adminLendplaceList");
		List<Map<String, Object>> list = lendplaceService.selectLendplaceList(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/admin/lendplace/list", commandMap.getCurrentPageNo(), list, 20 ,3);
		Map<String, Object> result = paging.getPagingList();
		mv.addObject("list",result.get("list"));
		mv.addObject("pagingHtml", result.get("pagingHtml"));
    	mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	
	//장소 예약 리스트
	@RequestMapping(value="/admin/placeBook/list")
	public ModelAndView placeBookList(CommandMap commandMap, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("adminPlaceBookList");
		List<Map<String, Object>> list = lendplaceService.selectPlaceBookList(commandMap.getMap());
		PagingCalculator paging = new PagingCalculator("/admin/placeBook/list", commandMap.getCurrentPageNo(), list, 20 ,3);
		Map<String, Object> result = paging.getPagingList();
		mv.addObject("list",result.get("list"));
		mv.addObject("pagingHtml", result.get("pagingHtml"));
    	mv.addObject("currentPageNo", commandMap.getCurrentPageNo());
		
		return mv;
	}
	
	  
	  //장소 신청 취소
	  @RequestMapping(value="/admin/lendplace/Cancel")
	    public ModelAndView placebookCancel(CommandMap commandMap, HttpSession session) throws Exception{
		   lendplaceService.cancelPlace(commandMap.getMap());
		   lendplaceService.dwCountUdate(commandMap.getMap());
		   commandMap.put("m_no", session.getAttribute("session_m_no"));
		   return new ModelAndView("redirect:/mypage/placebookHistory"); //리다이렉트:장소 리스트 페이지
	    }
	
	



}
