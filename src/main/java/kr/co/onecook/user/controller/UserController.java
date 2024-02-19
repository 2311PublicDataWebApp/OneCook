package kr.co.onecook.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	// 회원가입 창 이동
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String showInsertForm() {
		return "user/register";
	}

	// 로그인으로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showLoginPage() {
		return "user/login";
	}

	// 찾기 페이지로 이동
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String showFindPage() {
		return "user/find";
	}

	// 로그인 로직
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String userLogin(String userId, @RequestParam("userPw") String userPw, Model model, HttpSession session) {
		try {
			UserVO user = new UserVO(userId, userPw);
			user = uService.checkUserLogin(user);
			if (user != null) {
				// 로그인 성공!, Session에 저장
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				return "redirect:/index.jsp";
			} else {
				// 로그인 실패, No Data Found!
				model.addAttribute("msg", "No Data Found!!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// 그 외 오류 (쿼리문 오타, NullPointException 체크하세요.)
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 로그아웃 로직
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String userLogout(HttpSession session, Model model) {
		try {
			if (session != null) {
				session.invalidate();
				return "redirect:/index.jsp";
			} else {
				model.addAttribute("msg", "로그아웃을 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 회원가입 로직
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute UserVO user

			, Model model) {
		try {

			int result = uService.insertMember(user);
			if (result > 0) {
				// 로그인 페이지
				return "redirect:/login";
			} else {
				// 실패하면 에러페이지

				model.addAttribute("msg", "Service Failed!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			// 예외발생시 에러페이지
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 수정 페이지로 이동
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String showModifyForm(HttpSession session, Model model) {
		try {
			String userId = (String) session.getAttribute("userId");
			UserVO user = null;
			if (userId != null) {
				user = uService.getOneById(userId);
			}
			if (user != null) {
				model.addAttribute("user", user);
				return "user/modify";
			} else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
				return "common/errorPage";
			}

		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 회원 정보 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modifyMember(@ModelAttribute UserVO user

			, Model model) {
		try {

			int result = uService.updateMember(user);
			if (result > 0) {
				// success -> 마이페이지 이동
				return "redirect:/user/mypage";
			} else {
				// fail -> 에러페이지 이동
				model.addAttribute("msg", "회원 정보 수정을 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 마이페이지 Controller
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String showMyPage(HttpSession session, Model model) {
		try {
			String userId = (String) session.getAttribute("userId");
			UserVO user = null;
			if (userId != null) {
				user = uService.getOneById(userId);
			}
			if (user != null) {
				model.addAttribute("user", user);
				return "user/mypage";
			} else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
}
