package yogi.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yogi.alram.AlramServiceImpl;
import yogi.common.util.PagingCalculator;
import yogi.common.util.YogiUtils;
import yogi.config.CommandMap;
import yogi.group.GroupService;
import yogi.members.MembersModel;
import yogi.members.MembersService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Resource(name = "alramService")
	private AlramServiceImpl alramService;
	
	private MembersModel mModel;
	
	@SuppressWarnings("unchecked")
	@RequestMapping (value= "/main")
	public ModelAndView main(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("session_m_id")!=null) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("mainPage");
		List<Map<String, Object>> list = null;
		
		MembersModel mm;
		mm = mainService.getInterest( (String) session.getAttribute("session_m_id") );
	
		if(mm.getM_fav_field() != null) {
			String interest_tmp = mm.getM_fav_field();
			String[] interest ;
			interest = interest_tmp.split(",");
			Map<String, Object> hm = new HashMap<String, Object>();

			hm.put("interest", interest);
			
			list = mainService.fav_field(hm);
			mv.addObject("list",list);
			
		}
		if( (list == null || list.size()<6 ) && mm.getM_fav_area() != null) {
			String area_tmp = mm.getM_fav_area();
			String[] area ;
			area = area_tmp.split(",");
			for(int i=0; i<area.length; i++) 
				area[i] = "%"+area[i]+"%";
			
			Map<String, Object> hm = new HashMap<String, Object>();
			hm.put("area", area);
			
			list = mainService.fav_area(hm);
			mv.addObject("list",list);
		}
		if(list == null ||list.size()<6) {
			list = mainService.all();
			mv.addObject("list",list);
		}
		
		List<Map<String, Object>> mem_alram = null;
		if(alramService.alramExist(Integer.parseInt(session.getAttribute("session_m_no").toString())) != 0){
			mem_alram = alramService.alramLoad(Integer.parseInt(session.getAttribute("session_m_no").toString()));
		}
		session.setAttribute("session_mem_alram", mem_alram);
		mv.addObject("m_lv", mm.getM_lv());
		System.out.println(mv.getModelMap());
		return mv;
		}
		else {
		
			ModelAndView mv = new ModelAndView();
			mv.setViewName("firstPage");
			return mv;
		}	
	}
	
}
	
