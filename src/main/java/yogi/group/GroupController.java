package yogi.group;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import yogi.group.GroupService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import yogi.alram.AlramService;
import yogi.common.common.YogiConstants;
import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;

@Controller
public class GroupController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	@Resource(name="groupService")
	private GroupService groupService;
	
	@Resource(name="alramService")
	private AlramService alramService;
	
	@Resource(name="groupDAO")
	private GroupDAO groupDAO;
	
	@RequestMapping(value="/groupList", method={RequestMethod.GET, RequestMethod.POST})
    public ModelAndView groupList(CommandMap map, HttpServletRequest request) throws Exception{
		YogiUtils.savePageURI(request);
		ModelAndView mv = new ModelAndView("/group/groupList");
		List<Map<String,Object>> list = groupService.selectGroupList(map.getMap());
		PagingCalculator paging = new PagingCalculator("/groupList", map.getCurrentPageNo(), list, 6 ,3);
		Map<String, Object> result = paging.getPagingList();
		mv.addObject("list", result.get("list"));
		mv.addObject("pagingHtml", result.get("pagingHtml"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
        return mv;
    }	
	
	@RequestMapping(value="/groupDetail", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView groupDetail(CommandMap map, HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/group/groupDetail");
		map.put("m_no", (Integer)session.getAttribute("session_m_no"));
		System.out.println(map.get("m_no"));
		Map<String, Object> result = groupService.selectGroupDetail(map.getMap());
		mv.addObject("enrollM", result.get("enrollM"));
		mv.addObject("gModel",result.get("detail"));
		mv.addObject("cmtList", result.get("cmtList"));
		mv.addObject("sWriter",result.get("sWriter"));
		mv.addObject("geList", result.get("geList"));
		mv.addObject("currentPageNo", map.getCurrentPageNo());
		return mv;
	}
	
	@ResponseBody//자바 객체를 HTTP 요청의 body 내용으로 매핑하는 역할을 합니다.
	@RequestMapping("/group/likeit")
	public Map<Object, Object>  likeIt(HttpServletRequest request) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<Object, Object> result = new HashMap<Object, Object>();
		
		map.put("gg_no", Integer.parseInt(request.getParameter("gg_no")));
		map.put("m_no", (Integer)request.getSession().getAttribute(YogiConstants.M_NO));
		
    	int n = groupService.insertLikeit(map,request);
    	result.put("likeIt", n);
    	return result;
	}
	
	@RequestMapping(value="/enroll", method=RequestMethod.POST)
    public ModelAndView enroll(CommandMap map, HttpServletRequest request) throws Exception{
    	groupService.insertGroupEnroll(map.getMap(),request);
    	return new ModelAndView("redirect:/groupDetail?gg_no="+map.get("gg_no"));
    }	
	
	//모임 폼 열기
		@RequestMapping(value="/groupForm")
		public String groupForm() {
			return "groupForm";
		}
			
		//모임 폼 넣기
		@RequestMapping(value="/groupInsert", method=RequestMethod.POST)
		public String groupInsert(CommandMap commandMap, HttpServletRequest request) throws Exception{
			System.out.println("GroupController : insertGroup 실행");
			commandMap.put("m_no", request.getSession().getAttribute("session_m_no"));
			groupService.insertGroup(commandMap.getMap(), request);
			return "redirect:/groupList";
		}
		
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	//모임 수정 폼 열기
	@RequestMapping(value="/modifyForm")
	public ModelAndView groupModifyForm(CommandMap map, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("group/groupModifyForm");
		
		Map<String, Object> group = groupService.selectGroupDetail(map.getMap());
		mv.addObject("gModel", group.get("detail"));

		System.out.println(mv.getModel());
		return mv;
	}
	
	@RequestMapping(value="/groupModify")
	public ModelAndView modify(CommandMap map, HttpServletRequest request) throws Exception{
		System.out.println("groupModify:controller 실행");
		ModelAndView mv = new ModelAndView("redirect:/groupDetail?gg_no="+map.get("gg_no"));
		
		Map<String, Object> group = groupService.modifyGroup(map.getMap(), request);

		
		mv.addObject("group", group);
		
		return mv;
	}
	
	@RequestMapping(value="/inactivateGroup")
	public ModelAndView inactivateGroup(CommandMap map, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/groupList");
		groupService.inactivateGroup(map.getMap());
		List<Map<String,Object>> geList = groupDAO.groupEnrollList(map.getMap());
		if(geList.size()!=0) { 
		
			for(int i=0; i<geList.size(); i++) {
				alramService.regAlram(Integer.parseInt(geList.get(i).get("M_NO").toString()),"null", 3, Integer.parseInt(map.get("gg_no").toString()));
			}
		}
		return mv;
	}
	
	@RequestMapping(value="/comments", method=RequestMethod.POST)
	public ModelAndView insertCmt(CommandMap commandMap, HttpServletRequest request) throws Exception{
		if(commandMap.get("c_no") == null || "".equals(commandMap.get("c_no"))) {
			if(commandMap.get("c_parent") != null) {
					groupService.updateReplyStep(commandMap.getMap());			
			}
			
			System.out.println(commandMap.getMap());
			groupService.insertComments(commandMap.getMap());
			alramService.regAlram(Integer.parseInt(commandMap.get("m_no1").toString()),(String)commandMap.get("m_name"), 1, Integer.parseInt(commandMap.get("gg_no").toString()));
		}
		return new ModelAndView("redirect:/groupDetail?gg_no="+commandMap.get("gg_no"));
	}
	
	
	  @RequestMapping(value="/deleteCmt")
	    public ModelAndView deleteCmt(CommandMap commandMap) throws Exception{
	    	ModelAndView mv = new ModelAndView("redirect:/groupDetail?gg_no="+commandMap.get("gg_no"));
	    	System.out.println(commandMap.get("c_no"));
	    	Map<String,Object> map = groupService.selectCmtChild(commandMap.getMap());
	    	Integer cnt = Integer.parseInt(map.get("CNT").toString());
	    	if ( cnt == 0) {
	    		Map<String,Object> del = groupService.selectDeletedParent(commandMap.getMap());
	    		Map<String,Object> par = groupService.selectParent(commandMap.getMap());
	    		Integer DEL = Integer.parseInt(del.get("DEL").toString());
	    		Integer PAR = Integer.parseInt(par.get("PAR").toString());
	    		
	    		groupService.deleteComments(commandMap.getMap());
	    		if ( DEL == (PAR-1)) {
	    			groupService.cmtGroupDelete(commandMap.getMap());
				}
	        	return mv;	
	        }else {
	        	groupService.updateDeleteFlag(commandMap.getMap());
	    		return mv;
	        
	    }
	  }
}
