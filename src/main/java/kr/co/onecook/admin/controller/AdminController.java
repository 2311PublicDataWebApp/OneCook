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
		return null;
	}
}
