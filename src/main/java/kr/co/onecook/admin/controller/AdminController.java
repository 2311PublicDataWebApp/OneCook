package kr.co.onecook.admin.controller;

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
public class AdminController {

	@Autowired
	private UserService uService;
	
	@RequestMapping(value="/admin/login.kr", method=RequestMethod.POST)
	public String adminLogin(
			  String userId
			, @RequestParam("userPw") String userPw
			, Model model
			, HttpSession session) {
		try {
			UserVO user = new UserVO();
			user.setUserId(userId);
			user.setUserPw(userPw);
			user = uService.checkUserLogin(user);
			if(user != null && user.isAdmin() ) { // 관리자인지 확인
				// 로그인 성공!, Session에 저장
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				return "redirect:/admin/dashboard"; // 관리자 대시보드로 리다이렉트
			}else {
				// 로그인 실패 또는 일반 사용자
				model.addAttribute("msg", "No Data Found or Not an Admin");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// 그 외의 오류 발생(쿼리문 오타, NullPointerExceptino 등..)
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}


}
