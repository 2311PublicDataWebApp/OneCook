package kr.co.onecook.cs.controller;



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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.domain.PageInfo;
import kr.co.onecook.cs.service.CsService;
import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;

@Controller
public class CsController {

	@Autowired
	private CsService cService;
	@Autowired
	private UserService uService;
	
	// 자주묻는 질문 페이지로 이동
	@RequestMapping(value = "/cs/qna.oc", method = RequestMethod.GET)
	public String showQnaPage() {
		return "cs/qna";
	}
	
	// 1:1문의 페이지로 이동
	@RequestMapping(value = "/cs/faq.oc", method = RequestMethod.GET)
	public String showFaqPage() {
		return "cs/faq";
	}

	
	
	// 1:1문의 상세
		@RequestMapping(value="/cs/faqdetail.oc", method=RequestMethod.GET)
		public ModelAndView showQuestionDetail(ModelAndView mv, int questionNo) {
			try {
				CsVO cs = cService.selectQuestionByNo(questionNo);
				if(cs != null) {					
					mv.addObject("cs", cs)
					  .setViewName("cs/faqdetail");
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
	
	
		// 1:1문의 등록
		@RequestMapping(value="/cs/faq.oc", method=RequestMethod.POST)
		public ModelAndView insertFaq(ModelAndView mv
				, @ModelAttribute CsVO cs
				, HttpServletRequest request,
				HttpSession session) {
			try {
				int result = cService.insertFaq(cs);
				 String userId = (String) session.getAttribute("userId");
		            System.out.println(userId);
				if(result > 0 && userId!=null) {
					 mv.addObject("loggedIn", true);
					mv.addObject("msg","1:1문의 등록이 완료되었습니다.");
					mv.setViewName("redirect:/notice/list.oc");
					
				}
				 else {
					mv.addObject("msg", "1:1문의 등록이 완료되지 않았습니다.");
					mv.setViewName("common/errorPage");
					mv.addObject("loggedIn", false);
				}
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		//1:1문의 리스트
		@RequestMapping(value="/cs/faqlist.oc", method=RequestMethod.GET)
		public String showFaqList(Model model
				,ModelAndView mv, HttpSession session,
				@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
			try {
				   String userId = (String) session.getAttribute("userId");
		            System.out.println(userId);
				Integer totalCount = cService.getTotalCount();
				PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
				List<CsVO> cList = cService.selectFaqList(pInfo);
				if(!cList.isEmpty() && userId != null) {
					model.addAttribute("pInfo", pInfo);
					model.addAttribute("cList", cList);
					mv.addObject("loggedIn", true);
				} 
	             else {
					model.addAttribute("cList", null);
					mv.addObject("loggedIn", false);
				}
				return "cs/faqlist";
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
		}
		
		
		// 1:1문의 수정 페이지
		@RequestMapping(value="/cs/faqmodify.oc", method=RequestMethod.GET)
		public ModelAndView showModifyForm(ModelAndView mv, int questionNo,
				HttpSession session) {
			try {
				CsVO cs = cService.selectQuestionByNo(questionNo);
			     String userId = (String) session.getAttribute("userId");
		            System.out.println(userId);
				if(cs != null && userId != null) {
					mv.addObject("cs", cs);
					mv.setViewName("cs/faqmodify");
				}else {
					mv.addObject("msg", "데이터가 존재하지 않았습니다.");
					mv.setViewName("common/errorPage");
					mv.addObject("loggedIn", false);
				}
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
		
		// 1:1문의 수정
		@RequestMapping(value="/cs/faqmodify.oc", method=RequestMethod.POST)
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
			pInfo.setRecordCountPerPage(recordCountPerPage);
			return pInfo;
		}
		

		
		//삭제
//		@RequestMapping(value = "/cs/delete.oc", method = RequestMethod.GET)
//		public String deleteArticle(int questionNo, HttpSession session, Model model) {
//			try {
//				questionNo = (int) session.getAttribute("questionNo");
//				int result = cService.deleteArticle(questionNo);
//					return "/cs/faqlist.oc";
//				
//			} catch (Exception e) {
//				model.addAttribute("msg", e.getMessage());
//				return "common/errorPage";
//			}
//		}

		
		
}
