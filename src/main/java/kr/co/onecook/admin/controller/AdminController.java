package kr.co.onecook.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService uService;
	
	
	// 로그인으로 이동
	@RequestMapping(value = "/adminlogin", method = RequestMethod.GET)
	public String showLoginPage() {
		return "admin/login";
	}
	
	// 관리자 로그인
	@RequestMapping(value="/adminlogin", method=RequestMethod.POST)
	public String adminLogin(
			  @RequestParam("userId") String userId, @RequestParam("userPw") String userPw
			  , Model model, HttpSession session) {
		try {
			UserVO user = new UserVO(userId, userPw);
			user.setUserId(userId);
			user.setUserPw(userPw);
			user = uService.checkUserLogin(user);
			if(user != null && user.isAdmin() ) { // 관리자인지 확인
				// 로그인 성공!, Session에 저장
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				return "redirect:/index.jsp"; // 관리자 대시보드로 리다이렉트 
			}else {
				// 로그인 실패 또는 일반 사용자
				model.addAttribute("msg", "데이터를 찾을 수 없거나 관리자가 아닙니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// 그 외의 오류 발생(쿼리문 오타, NullPointerExceptino 등..)
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// (관리자)수정 페이지로 이동
		@RequestMapping(value="/admin/modify.oc", method=RequestMethod.GET)
		public String showModifyForm(HttpSession session, Model model) {
			try {
				String userId = (String)session.getAttribute("userId");
				UserVO user = null;
				if(userId != null) {
					user = uService.getOneById(userId);
				}
				if(user != null) {
					model.addAttribute("user", user);
					return "admin/modify";
				}else {
					model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
					return "common/errorPage";
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}

		// (관리자)회원 정보 수정
		@RequestMapping(value="/admin/modify.oc", method=RequestMethod.POST)
		public String modifyMember(
				@ModelAttribute UserVO user
				, Model model) {
			try {
				int result = uService.updateMember(user);
				if(result > 0) {
					// success -> 수정 완료
					return "redirect:/admin/modify.oc";
				}else {
					// fail -> 에러페이지 이동
					model.addAttribute("msg", "회원 정보 수정을 완료하지 못하였습니다.");
					return "common/errorPage";
				}
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}
	
	
}
