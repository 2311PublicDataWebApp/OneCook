package kr.co.onecook.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.domain.PageInfo;
import kr.co.onecook.cs.service.CsService;
import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;

@Controller
public class AdminController {

	@Autowired
	private UserService uService;
	@Autowired
	private CsService cService;

	// 로그인으로 이동
	@RequestMapping(value = "/admin/login.oc", method = RequestMethod.GET)
	public String showLoginPage() {
		return "admin/login";
	}

	

	// 1:1문의 상세
		@RequestMapping(value="/admin/faqdetail.oc", method=RequestMethod.GET)
		public ModelAndView showQuestionDetail(ModelAndView mv, int questionNo) {
			try {
				CsVO cs = cService.selectQuestionByNo(questionNo);
				if(cs != null) {					
					mv.addObject("cs", cs)
					  .setViewName("admin/faqdetail");
				}else {
					mv.addObject("msg", "데이터가 존재하지 않습니다.")
					  .setViewName("common/errorPage");
				}
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage())
				  .setViewName("common/errorPage");
			}
			return mv;
		}
	
	
	// 관리자 로그인
	@RequestMapping(value = "/admin/login.oc", method = RequestMethod.POST)
	public String adminLogin(@RequestParam("userId") String userId, @RequestParam("userPw") String userPw, Model model,
			HttpSession session) {
		try {
			UserVO user = new UserVO(userId, userPw);
			user.setUserId(userId);
			user.setUserPw(userPw);
			user = uService.checkUserLogin(user);
			if (user != null && user.isAdmin()) { // 관리자인지 확인
				// 로그인 성공!, Session에 저장
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				return "user/list"; // 관리자 대시보드로 리다이렉트
			} else {
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
	@RequestMapping(value = "/admin/modify.oc", method = RequestMethod.GET)
	public String showModifyForm(HttpSession session, Model model, String userId) {
		try {
//				String userId = (String)session.getAttribute("userId"); // 세션에서 로그인한 id 받아오기
			UserVO user = null;
			if (userId != null) {
				user = uService.getOneById(userId);
			}
			if (user != null) {
				model.addAttribute("user", user);
				return "admin/modify";
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

	// (관리자)회원 정보 수정
	@RequestMapping(value = "/admin/modify.oc", method = RequestMethod.POST)
	public String modifyMember(@ModelAttribute UserVO user, Model model) {
		try {
			int result = uService.updateMember(user);
			if (result > 0) {
				// success -> 수정 완료
				return "redirect:/admin/modify.oc?userId="+user.getUserId();
//				return "redirect:/admin/modify.oc";
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

	// 1:1문의 리스트
	@RequestMapping(value = "/admin/faqlist.oc", method = RequestMethod.GET)
	public String showFaqList(Model model,ModelAndView mv, HttpSession session,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) {
		try {
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
			Integer totalCount = cService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<CsVO> cList = cService.selectFaqList(pInfo);
			if (!cList.isEmpty()) {
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("cList", cList);
			} else {
				model.addAttribute("cList", null);
			}
			return "admin/faqlist";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	// 1:1문의 답변 페이지로 이동
	@RequestMapping(value="/admin/faqreply.oc", method=RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv, int questionNo) {
		try {
			CsVO cs = cService.selectQuestionByNo(questionNo);
			if(cs != null) {
				mv.addObject("cs", cs);
				mv.setViewName("admin/faqreply");
			}else {
				mv.addObject("msg", "데이터가 존재하지 않았습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 1:1문의 답변
	@RequestMapping(value="/admin/faqreply.oc", method=RequestMethod.POST)
	public ModelAndView updateQuestion(
			ModelAndView mv
			, @ModelAttribute CsVO cs
			, HttpServletRequest request) {
		try {				
			int result = cService.updateQuestion(cs);
			if(result > 0) {
				mv.setViewName("redirect:/cs/faqdetail.oc?questionNo="+cs.getQuestionNo());
			}else {
				mv.addObject("msg", "데이터가 존재하지 않습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch(Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	

	// 페이징 처리
	private PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		PageInfo pInfo = new PageInfo();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		naviTotalCount = (int) Math.ceil((double) totalCount / recordCountPerPage);
		startNavi = ((int) ((double) currentPage / naviCountPerPage + 0.9) - 1) * naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pInfo.setCurrentPage(currentPage);
		pInfo.setNaviTotalCount(naviTotalCount);
		pInfo.setStartNavi(startNavi);
		pInfo.setEndNavi(endNavi);
		pInfo.setRecordCountPerPage(recordCountPerPage);
		return pInfo;
	}

}
