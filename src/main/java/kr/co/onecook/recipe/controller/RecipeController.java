package kr.co.onecook.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.service.RecipeService;

	@Controller
	public class RecipeController {
		
		@Autowired
		private RecipeService rService;
		
		@RequestMapping(value="/recipe/register.kh", method=RequestMethod.GET)
		public String showInsertRecipe(Model model) {
			
			return "recipe/register";
		}
		
		@RequestMapping(value="/recipe/register.kh", method=RequestMethod.POST)
		public String insertRecipe(Model model
				, @ModelAttribute RecipeVO recipe) {
				int result = rService.insertRecipe(recipe);
				if(result > 0) {
					return "redirect:/";
				}else {
					model.addAttribute("msg","레시피 등록 오류스~");
					return "common/errorPage";
				}	
		}
	}
