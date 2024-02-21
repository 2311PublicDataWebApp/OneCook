package kr.co.onecook.rec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.onecook.rec.domain.PageInfo;
import kr.co.onecook.rec.domain.RecommendVO;
import kr.co.onecook.rec.domain.TitleImageVO;
import kr.co.onecook.rec.service.RecService;

@Controller
public class RecController {
	@Autowired
	private RecService rService;
	
	@RequestMapping(value="/home.oc", method=RequestMethod.GET)
	public ModelAndView showRecRecipe(ModelAndView mv,
			@RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage,
			@RequestParam(name = "popRecipe", required = false) String popRecipe,
		    @RequestParam(name = "recRecipe", required = false) String recRecipe,
		    @RequestParam(required = false) String foodType) {
		try {
			// 카테고리 분기문
			if(foodType != null && !foodType.isEmpty()) {
//				foodType = rService.foodTypeSelect();
				
			}
			int totalCount = rService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<RecommendVO> rList = rService.selectAllRecipe(pInfo);
			List<TitleImageVO> tImage = rService.selectTitleImg();
			if("추천".equals(popRecipe)) {
				rList = rService.selectAllRecipe(pInfo);
				tImage = rService.selectTitleImg();
				mv.addObject("rList", rList);
				mv.addObject("tImage", tImage);
				mv.setViewName("home");	
			}else if("인기".equals(recRecipe)) {
				rList = rService.selectAllRecipe2(pInfo);
//				tImage = rService.selectTitleImg2();
				mv.addObject("rList", rList);
				mv.addObject("tImage", tImage);
				mv.setViewName("home");	
			}else {
				mv.addObject("pInfo", pInfo);
				mv.addObject("rList", rList);
				mv.addObject("tImage", tImage);
				mv.setViewName("home");				
			}
		} catch (Exception e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 페이징 처리
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10; // 한 페이지당 보여줄 게시물의 수
		int naviCountPerPage = 5; // 한 페이지당 보여줄 범위의 갯수
		int naviTotalCount; // 범위의 총 갯수 n/
		int startNavi;
		int endNavi;
		
		// 페이지 총 갯수를 구하기 위해 double값 전환 후 올림값 처리와 다시 int값으로 전환
		naviTotalCount = (int)((double)totalCount/recordCountPerPage+0.9);
		startNavi = (((int)((double)currentPage/naviCountPerPage+0.9))-1)*naviCountPerPage + 1;
		endNavi = startNavi + naviCountPerPage -1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		return pi;
	}
	
	
}
