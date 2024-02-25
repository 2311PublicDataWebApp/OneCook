package kr.co.onecook.recipe.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.recipe.domain.CommentVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.service.RecipeService;

@Controller
public class RecipeCommantController {

    @Autowired
    private RecipeService rService;
    
    @RequestMapping(value = "/recipe/test.oc", method = RequestMethod.POST)
    public String showCommentTest(Model model, ModelAndView mv,
                                  @ModelAttribute RecipeVO recipe,
                                  @ModelAttribute CommentVO comment,
                                  HttpSession session,
                                  HttpServletRequest request) {
    	
        // 세션에서 userId 가져오기
        String userId = (String) session.getAttribute("userId");
        System.out.println(userId);
        if (userId != null) {
            // 로그인 상태인 경우의 동작
            mv.addObject("loggedIn", true);
        } else {
            // 로그아웃 상태인 경우의 동작
        	mv.addObject("loggedIn", false);
        }

        String writer = (String) session.getAttribute("userId");
        if (writer == null || "".equals(writer)) {
            model.addAttribute("msg", "로그인이 필요합니다");
            return "common/errorPage";
        }

        String recipeNumber = request.getParameter("recipeNumber");
        String cleanedRecipeNumber = recipeNumber.replace(",", "");
        int recipeNo = Integer.parseInt(cleanedRecipeNumber);

        // 이미 후기를 작성한 사용자인지 확인
        boolean alreadyCommented = rService.checkIfUserAlreadyCommented(writer, recipeNo);
        model.addAttribute("alreadyCommented", alreadyCommented);
        if (alreadyCommented) {
            model.addAttribute("alreadyCommented", "true"); // 이미 후기를 작성했음을 JSP에 전달
            model.addAttribute("msg", "이미 후기를 작성했습니다.");
            return "recipe/detail"; // 리디렉션 대신 해당 페이지로 이동
        }

        recipe.setUserId(writer);
        comment.setCommentWriter(writer); // 댓글 작성자 설정
        comment.setRecipeNumber(recipeNo);

        int result = rService.insertComment(comment);
        if (result != 0) {
            return "redirect:/";
        } else {
            model.addAttribute("msg", "등록 오류스~");
            return "common/errorPage";
        }
    }
}