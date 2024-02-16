package kr.co.onecook.rec.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.rec.domain.RecVO;
import kr.co.onecook.rec.service.RecService;

@Controller
public class RecController {
	public ModelAndView showRegisterForm(ModelAndView mv) {
		return mv;
	}
	@Autowired
	private RecService rService;
	@RequestMapping(value="/index.kr", method=RequestMethod.GET)
	public String showRecRecipe(Model model) {
		try {
			List<RecVO> rList = rService.selectAllRecipe();
			model.addAttribute("rList", rList);
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
		return "/";
	}
}
