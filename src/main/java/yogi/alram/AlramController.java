package yogi.alram;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import yogi.config.CommandMap;

@Controller
public class AlramController {

	@Resource(name="alramService")
	private AlramService alramService;
	
	@RequestMapping(value="/alramRead")
	public ModelAndView alramRead(CommandMap map,HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String alram_seq = request.getParameter("alram_seq");
		
		alramService.readAlram(map.getMap());
		Map<String, Object> alramModel = alramService.selectAlramOne(map.getMap());
		
		String url = "";
		
		if(Integer.parseInt(alramModel.get("ALRAM_INDEX_NO").toString()) == 1 || Integer.parseInt(alramModel.get("ALRAM_INDEX_NO").toString()) == 2) {
			url = "groupDetail?gg_no="+alramModel.get("ALRAM_CONTNUM");
		} else if(Integer.parseInt(alramModel.get("ALRAM_INDEX_NO").toString()) == 3) {
			url = "main";
		} /*else if(Integer.parseInt(alramModel.get("alram_index_no").toString()) == 3) {
			url = "myPageActivitySty.do?mem_id="+alramModel.get("alram_id");
		}*/
	
		mav.setViewName("redirect:"+url);
		
		return mav;
	}
	
}
