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
		
		@RequestMapping(value="/user/register.kr", method=RequestMethod.GET)
		public String showInsertForm() {
			return "user/register";
		}
		
		@RequestMapping(value="/user/login.kr",method=RequestMethod.GET)
		public String showLoginPage() {
			return "user/login";
			
		}
		@RequestMapping(value="/user/find.kr",method=RequestMethod.GET)
		public String showFindPage() {
			return "user/find";
			
		}
		
		
		@RequestMapping(value="/user/login.kr", method=RequestMethod.POST)
		public String userLogin(
				  String userId
				, @RequestParam("userPw") String userPw
				, Model model
				, HttpSession session) {
			try {
				UserVO user = new UserVO();
				user.setUserId(userId);
				user.setUserPw(userPw);
				user = uService.checkUserLogin(user);
				if(user != null) {
					// 로그인 성공!, Session에 저장
					session.setAttribute("userId", user.getUserId());
					session.setAttribute("userName", user.getUserName());
					return "redirect:/index.jsp";
				}else {
					// 로그인 실패, No Data Found!
					model.addAttribute("msg", "No Data Found!!");
					return "common/errorPage";
				}
			} catch (Exception e) {
				// TODO: handle exception
				// 그 외의 오류 발생(쿼리문 오타, NullPointerExceptino 등..)
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}
		
		@RequestMapping(value="/user/logout.kh", method=RequestMethod.GET)
		public String userLogout(HttpSession session, Model model) {
			try {
				if(session != null) {
					session.invalidate();
					return "redirect:/index.jsp";
				}else {
					model.addAttribute("msg", "로그아웃을 완료하지 못하였습니다.");
					return "common/errorPage";
				}
			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}
	
}
