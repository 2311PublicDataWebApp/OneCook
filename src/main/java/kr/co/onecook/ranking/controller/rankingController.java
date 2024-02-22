package kr.co.onecook.ranking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class rankingController {
	
	@RequestMapping(value="/ranking/ranking.oc", method=RequestMethod.GET)
	public ModelAndView showRankingRecipe(ModelAndView mv) {
		
		
		return mv;
	}
}
