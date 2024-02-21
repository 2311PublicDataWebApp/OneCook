package kr.co.onecook.recipe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.onecook.recipe.domain.CommentVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.service.RecipeService;
import kr.co.onecook.user.domain.UserVO;

@Controller
public class RecipeCommantController {

	@Autowired
	private RecipeService rService;

	@RequestMapping(value = "/recipe/test.oc", method = RequestMethod.GET)
	public String showComment(Model model) {
		return "redirect:/";
	}

	// 레시피 상세 페이지
	@RequestMapping(value = "/recipe/test.oc", method = RequestMethod.POST)
	public String showCommentTest(Model model, @ModelAttribute RecipeVO recipe, @ModelAttribute CommentVO comment,
			@ModelAttribute UserVO user,
			@RequestParam("recipeNumber") String recipeNumber, HttpSession session, HttpServletRequest request) {
		String writer = (String) session.getAttribute("userId");
		String cleanedRecipeNumber = recipeNumber.replace(",", "");
		int recipeNo = Integer.parseInt(cleanedRecipeNumber);
		System.out.println("------------------------------------------------------");
		System.out.println("유저 아이디 : " + writer);
		System.out.println("레시피 번호 : " + recipeNo);
		System.out.println("------------------------------------------------------");
		if (session != null && writer != null && !"".equals(writer)) {
			recipe.setUserId(writer);
			comment.setCommentWriter(writer);
			comment.setRecipeNumber(recipeNo);
		} else {
			model.addAttribute("msg", "로그인이 필요합니다");
			return "common/errorPage";
		}

		int result = rService.insertComment(comment);
		if (result != 0) {
			// 코멘드 등록 성공
			return "redirect:/";
		} else {
			// 코멘트 등록 실패
			model.addAttribute("msg", "등록 오류스~");
			return "common/errorPage";
		}

	}
}
