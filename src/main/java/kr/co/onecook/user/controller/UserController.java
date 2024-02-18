package kr.co.onecook.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
	@RequestMapping(value = "/user/login.kr", method = RequestMethod.POST)
	public String userLogin(String userId, @RequestParam("userPw") String userPw
			, Model model, HttpSession session) {
		try {
			UserVO user = new UserVO();
			user.setUserId(userId);
			user.setUserPw(userPw);
			user = uService.checkUserLogin(user);
			if(user != null) {
				// 로그인 성공
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userNick", user.getUserNick());
				return "redirect:/index.jsp";
			}else {
			  // 로그인 실패
			} model.addAttribute("msg", "로그인되지 않았습니다.");
			  return "";
			
		} catch (Exception e) {
			// 그 외 오류 (쿼리문 오타, Nullpointexception 체크하세요.)
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
}
