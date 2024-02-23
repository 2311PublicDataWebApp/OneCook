package kr.co.onecook.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.notice.domain.PageInfo;
import kr.co.onecook.notice.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	// 공지사항 상세 정보
	@RequestMapping(value="/notice/detail.oc", method = RequestMethod.GET)
	public ModelAndView showNoticeDetail(ModelAndView mv, int noticeNo) {
		try {
			NoticeVO notice = nService.selectNoticeByNo(noticeNo);
			if(notice != null) {
				mv.addObject("notice", notice).setViewName("notice/detail");				
			}else {
				mv.addObject("msg", "데이터가 존재하지 않습니다.").setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

	// 공지사항 목록
	@RequestMapping(value="/notice/list.oc", method = RequestMethod.GET)
		public ModelAndView showNoticeList(ModelAndView mv
				,@RequestParam(value="page", required=false, defaultValue = "1") Integer currentPage ) {
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			int totalCount = nService.getTotalCount(paramMap);
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			
			List<NoticeVO> nList = nService.selectNoticeList(pInfo);
			
			mv.addObject("nList", nList);
			mv.addObject("pInfo", pInfo);
			mv.setViewName("notice/list");
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 공지사항 등록
	@RequestMapping(value = "/notice/insert.oc", method = RequestMethod.POST)
	public ModelAndView insertNotice(ModelAndView mv, @ModelAttribute NoticeVO notice
			, HttpServletRequest request) {
		try {
			// 공지사항 정보 저장
			int result = nService.insertNotice(notice);
			if(result > 0) {
				mv.setViewName("redirect:/notice/list.oc");
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

	// 공지사항을 등록 폼
	@RequestMapping(value = "/notice/insert.oc", method = RequestMethod.GET)
	public ModelAndView showInsertForm(ModelAndView mv) {
		mv.setViewName("notice/register");
		return mv;
	}

	// 공지사항 수정
	@RequestMapping(value = "/notice/modify.oc", method = RequestMethod.POST)
	public ModelAndView updateNotice(ModelAndView mv, @ModelAttribute NoticeVO notice,
			HttpServletRequest request) {
		try {
			int result = nService.updateNotice(notice);
			if (result > 0) {
				mv.setViewName("redirect:/notice/detail.oc?noticeNo=" + notice.getNoticeNo());
			} else {
				mv.addObject("msg", "데이터가 존재하지 않습니다");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	// 공지사항 수정 폼(페이지)
	@RequestMapping(value = "/notice/modify.oc", method = RequestMethod.GET)
	public ModelAndView showModifyForm(ModelAndView mv, int noticeNo) {
		try {
			System.out.println(noticeNo);
			NoticeVO notice = nService.selectNoticeByNo(noticeNo);
			if (notice != null) {
				mv.addObject("notice", notice);
				mv.setViewName("notice/modify");
			}else {
				mv.addObject("msg", "데이터가 존재하지 않습니다.");
				mv.setViewName("common/errorPage");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	// 공지사항 삭제
	@RequestMapping(value = "/notice/delete.oc", method = RequestMethod.GET)
	public ModelAndView deleteNotice(ModelAndView mv, int noticeNo) {
		try {
			int result = nService.deleteNotice(noticeNo);
			if (result > 0) {
				mv.setViewName("redirect:noticelist");
			} else {
				mv.addObject("msg", "데이터가 조회되지 않습니다.");
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage()).setViewName("common/errorPage");
		}
		return mv;
	}

	// 페이징처리
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10; // 한 페이지 당 보여줄 게시물의 갯수
		int naviCountPerPage = 5;    // 한 페이지 당 보여줄 페이지 범위의 갯수
		int naviTotalCount;			 // 범위의 총 갯수
		int startNavi;				 // 현재 페이지가 속한 페이지 범위의 시작 페이지 번호를 계산.
		int endNavi;				 // 현재 페이지가 속한 페이지 범위의 끝 번호를 계산. 
									 // *단, 전체 페이지 범위의 수보다 크면 전체 페이지 범위의 수로 설정.
		
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		return pi;
	}
	
	
	
	

	
		
	
}
