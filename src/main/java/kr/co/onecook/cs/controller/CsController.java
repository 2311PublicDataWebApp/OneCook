package kr.co.onecook.cs.controller;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

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

@Controller
public class CsController {

	@Autowired
	private CsService cService;
	
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
	
	
	// 1:1문의 등록
		@RequestMapping(value="/cs/faq.oc", method=RequestMethod.POST)
		public ModelAndView insertFaq(ModelAndView mv
				, @ModelAttribute CsVO cs
				, HttpServletRequest request) {
			try {
				int result = cService.insertFaq(cs);
				if(result > 0) {
					mv.addObject("msg", "1:1문의 등록이 완료되었습니다.");
				}else {
					mv.addObject("msg", "1:1문의 등록이 완료되지 않았습니다.");
					mv.setViewName("common/errorPage");
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
				, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
			try {
				Integer totalCount = cService.getTotalCount();
				PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
				List<CsVO> cList = cService.selectFaqList(pInfo);
				if(!cList.isEmpty()) {
					model.addAttribute("pInfo", pInfo);
					model.addAttribute("cList", cList);
				}else {
					model.addAttribute("cList", null);
				}
				return "cs/faqlist";
			} catch (Exception e) {
				model.addAttribute("msg", e.getMessage());
				return "common/errorPage";
			}
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
