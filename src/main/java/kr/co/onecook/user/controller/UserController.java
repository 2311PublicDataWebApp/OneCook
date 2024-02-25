package kr.co.onecook.user.controller;



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


import kr.co.onecook.user.domain.CommentVO;

import kr.co.onecook.notice.domain.NoticeVO;

import kr.co.onecook.user.domain.PageInfo;
import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService uService;
	
	// 로그인으로 이동
	@RequestMapping(value = "/user/login.oc", method = RequestMethod.GET)
	public String showLoginPage() {
		return "user/login";
	}
	
	// 로그인 로직
	@RequestMapping(value = "/user/login.oc", method = RequestMethod.POST)
	public String userLogin(String userId, @RequestParam("userPw") String userPw, Model model, HttpSession session) {
		try {
			UserVO user = new UserVO(userId, userPw);
			user = uService.checkUserLogin(user);
			if (user != null) {
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
				return "redirect:/user/mypage.oc";
			} else {
				model.addAttribute("msg", "No Data Found!!");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 로그아웃 로직
	@RequestMapping(value = "/user/logout.oc", method = RequestMethod.GET)
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
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	// 회원가입 창 이동
	@RequestMapping(value = "/user/register.oc", method = RequestMethod.GET)
	public String showInsertForm() {
		return "user/register";
	}
	// 회원가입 로직
	@RequestMapping(value = "/user/register.oc", method = RequestMethod.POST)
	public String insertMember(@ModelAttribute UserVO user, 
			 Model model) {
		try {
			int result = uService.insertMember(user);
			if (result > 0) {
				return "redirect:/index.jsp";
			} else {
				model.addAttribute("msg", "Service Failed!");
				return "common/errorPage";
			}
			   
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 수정 페이지로 이동
	@RequestMapping(value="/user/modify.oc", method=RequestMethod.GET)
	public String showModifyForm(HttpSession session, Model model, ModelAndView mv) {
		try {
			String userId = (String)session.getAttribute("userId");
			UserVO user = null;
            System.out.println(userId);
			if(userId != null) {
				user = uService.getOneById(userId);
			}
			if(user != null) {
				model.addAttribute("user", user);
				 mv.addObject("loggedIn", true);
				 return "user/modify";
			}else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
				mv.addObject("loggedIn", false);
				return "common/errorPage";
			}
			
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// 회원 정보 수정
	@RequestMapping(value="/user/modify.oc", method=RequestMethod.POST)
	public String modifyMember(
			@ModelAttribute UserVO user
			, Model model) {
		try {
			int result = uService.updateMember(user);
			if(result > 0) {
				return "redirect:/user/mypage.oc";
			}else {
				model.addAttribute("msg", "회원 정보 수정을 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	
	// 마이페이지 Controller
	@RequestMapping(value = "/user/mypage.oc", method = RequestMethod.GET)
	public String showMember(ModelAndView mv, HttpSession session, Model model) {
		try {
			String userId = (String) session.getAttribute("userId");
			System.out.println(userId);
			UserVO user = null;
			if (userId != null) {
				user = uService.getOneById(userId);
				 mv.addObject("loggedIn", true);
			}
			if (user != null) {
				model.addAttribute("user", user);
				 mv.addObject("loggedIn", false);
				return "user/mypage";
			} else {
				model.addAttribute("msg", "회원 정보 조회를 완료하지 못하였습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	
	
	

	// 회원탈퇴
	@RequestMapping(value = "/user/delete.oc", method = RequestMethod.GET)
	public String deleteMember(String userId, HttpSession session, Model model) {
		try {
			String sessionId = (String) session.getAttribute("userId");
			int result = 0;
			if (sessionId != null && sessionId.equals(userId)) {
				result = uService.deleteMember(userId);
			} else {
				model.addAttribute("msg", "로그인을 해야 합니다.");
				return "common/errorPage";
			}
			// 회원탈퇴가 성공했는지 확인
			if (result > 0) {
				return "redirect:/user/login.oc";
			} else {
				model.addAttribute("msg", "회원 탈퇴가 완료되지 않았습니다.");
				return "common/errorPage";
			}
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}

	// ID/PW찾기페이지 이동
	@RequestMapping(value = "/user/findacnt.oc", method = RequestMethod.GET)
	public String searchAcnt(HttpServletRequest request, Model model, UserVO user) {
		return "user/findacnt";
	}

	// 아이디찾기 로직
	@RequestMapping(value = "user/resultId.oc", method=RequestMethod.POST)
	public String searchResultId(HttpServletRequest request, Model model,
			@RequestParam(required = true, value = "userName") String userName,
			@RequestParam(required = true, value = "userPhone") String userPhone, UserVO user) {

		try {
			user.setUserName(userName);
			user.setUserPhone(userPhone);
			UserVO userSearch = uService.memberIdSearch(user);
			model.addAttribute("user", userSearch);

		} catch (Exception e) {
			System.out.println(e.toString());
			model.addAttribute("msg", "오류가 발생되었습니다.");
		}

		return "user/resultId";
	}
	
	// 회원조회 리스트
	@RequestMapping(value="/user/list.oc", method=RequestMethod.GET)
	public ModelAndView showUserList(ModelAndView mv,
	    @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
	    try {
	        Map<String, String> paramMap = new HashMap<String,String>(); // 파라미터 맵 생성
	        int totalCount = uService.getTotalCount(paramMap); // 전체 회원 수 가져오기
	        PageInfo pInfo = this.getPageInfo(currentPage, totalCount); // 페이지 정보 구성
	        
	        List<UserVO> uList = uService.selectUserList(pInfo); // 해당 페이지에 대한 회원 목록 가져오기
	        mv.addObject("uList", uList); // 회원 목록을 뷰에 전달
	        mv.addObject("pInfo", pInfo); // 페이지 정보를 뷰에 전달
	        mv.setViewName("user/list"); // 회원 목록 페이지로 이동
	    } catch (Exception e) {
	        mv.addObject("msg", e.getMessage());
	        mv.setViewName("common/errorPage");
	    }
	    return mv;
	}
	
	// 회원조회 검색바
	@RequestMapping(value="/user/search.oc", method=RequestMethod.GET)
	public ModelAndView searchUserList(ModelAndView mv,
	    @RequestParam(value="searchCondition", required=true) String searchCondition,
	    @RequestParam(value="searchKeyword", required=true) String searchKeyword,
	    @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		/*
		 * 2개의 값을 하나의 변수로 다루는 방법
		 * 1. VO 클래스를 만드는 방법(이미 해봄)
		 * 2. HashMap 사용하는 방법(이미 해봄)
		 */
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("searchCondition", searchCondition);
		paramMap.put("searchKeyword", searchKeyword);
		int totalCount = uService.getTotalCount(paramMap);
		//getTotalCount만 쓸 경우 모든 결과에 대한 값을 가져와서 검색결과가 잘못 나옴
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<NoticeVO> searchList = uService.searchUsersByKeyword(pInfo, paramMap);
		mv.addObject("sList", searchList);
		mv.addObject("pInfo",pInfo);
		mv.addObject("searchCondition", searchCondition);
		mv.addObject("searchKeyword", searchKeyword);
		mv.setViewName("user/search");
		return mv;
	}


	
	

	
	// 페이징 처리 정보저장
	private PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		PageInfo pInfo = new PageInfo();
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount;
		int startNavi;
		int endNavi;
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*naviCountPerPage+1;
		endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pInfo.setCurrentPage(currentPage);
		pInfo.setNaviTotalCount(naviTotalCount);
		pInfo.setStartNavi(startNavi);
		pInfo.setEndNavi(endNavi);
		return pInfo;
	}
	
	
	
	// 찜목록 이동
	@RequestMapping(value = "/user/wishlist.oc", method = RequestMethod.GET)
	public String showWishPage() {
		return "user/wishlist";
	}
	//레시피 목록 이동
	@RequestMapping(value = "/user/recipelist.oc", method = RequestMethod.GET)
	public String showRecipeList() {
		return "user/recipelist";
	}
	
	

	// 페이징 처리
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10;	// 한 페이지 당 보여줄 게시물의 갯수
		int naviCountPerPage = 5;		// 한 페이지 당 보여줄 범위의 갯수
		int naviTotalCount;				// 범위의 총갯수
		int startNavi;
		int endNavi;
		
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, 
				naviCountPerPage, startNavi, endNavi);
				
				return pi;
	
		
	}
	
	
	

	
	
	//마이페이지 _댓글관리
	@RequestMapping(value="/user/commentlist.oc", method=RequestMethod.GET)
	public String showNoticeList(Model model, ModelAndView mv, HttpSession session
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		try {
			Integer totalCount = uService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<CommentVO> uList = uService.selectCommentList(pInfo);
			 String userId = (String) session.getAttribute("userId");
	            System.out.println(userId);
			if(!uList.isEmpty()) {
				model.addAttribute("pInfo", pInfo);
				model.addAttribute("uList", uList);
			} if (userId != null) {
                mv.addObject("loggedIn", true);
            } else {
				model.addAttribute("uList", null);
				mv.addObject("loggedIn", false);
			}
			return "user/commentlist";
		} catch (Exception e) {
			model.addAttribute("msg", e.getMessage());
			return "common/errorPage";
		}
	}
	
	

	
	
	
	
	
	
	
	
	


} 
//전체닫기
