package kr.co.onecook.cs.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.cs.domain.CsVO;
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
					mv.addObject("msg", "공지사항 등록이 완료되었습니다.");
				}else {
					mv.addObject("msg", "공지사항 등록이 완료되지 않았습니다.");
					mv.setViewName("common/errorPage");
				}
			} catch (Exception e) {
				mv.addObject("msg", e.getMessage());
				mv.setViewName("common/errorPage");
			}
			return mv;
		}
}
