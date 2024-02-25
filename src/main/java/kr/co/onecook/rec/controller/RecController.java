package kr.co.onecook.rec.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView showRecRecipe(ModelAndView mv, HttpSession session,
			@RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage,
			@RequestParam(name = "popRecipe", required = false) String popRecipe,
		    @RequestParam(name = "recRecipe", required = false) String recRecipe,
		    @RequestParam(required = false) String foodType) {
		try {
			
			// 세션에서 userId 가져오기
	        String userId = (String) session.getAttribute("userId");
	        if (userId != null) {
	            // 로그인 상태인 경우의 동작
	            mv.addObject("loggedIn", true);
	        } else {
	            // 로그아웃 상태인 경우의 동작
	            mv.addObject("loggedIn", false);
	        }
	        
			// 카테고리 분기문
			List<TitleImageVO> tImageCategory = new ArrayList<TitleImageVO>();
			if(foodType != null && !foodType.isEmpty()) {
				List<RecommendVO> foodList = rService.foodTypeSelect(foodType);
				List<Integer> recipeNumberList = new ArrayList<Integer>();
				for (RecommendVO recommendVO : foodList) {
				    Integer recipeNumber = recommendVO.getRecipeNumber();
				    recipeNumberList.add(recipeNumber);
				}
				tImageCategory = rService.selectTitleImg(recipeNumberList);
				mv.addObject("foodList", foodList);
				mv.addObject("tImageCategory", tImageCategory);
				mv.setViewName("home");	
			}else {
				foodType = "한식";
				List<RecommendVO> foodList = rService.foodTypeSelect(foodType);
				List<Integer> recipeNumberList = new ArrayList<Integer>();
				for (RecommendVO recommendVO : foodList) {
				    Integer recipeNumber = recommendVO.getRecipeNumber();
				    recipeNumberList.add(recipeNumber);
				}
				tImageCategory = rService.selectTitleImg(recipeNumberList);
				mv.addObject("foodList", foodList);
				mv.addObject("tImageCategory", tImageCategory);
				mv.setViewName("home");
			}
			// 추천, 인기 분기문
			int totalCount = rService.getTotalCount();
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<RecommendVO> rList = rService.selectAllRecipe(pInfo);
			
			List<Integer> recipeNumberList = new ArrayList<Integer>();
			for (RecommendVO recommendVO : rList) {
			    Integer recipeNumber = recommendVO.getRecipeNumber();
			    recipeNumberList.add(recipeNumber);
			}
			
			
			if("추천".equals(popRecipe)) {
				List<TitleImageVO> tImage = new ArrayList<TitleImageVO>();
			    recipeNumberList = new ArrayList<>(); // 초기화
			    rList = rService.selectAllRecipe(pInfo);
			    for (RecommendVO recommendVO : rList) {
			        Integer recipeNumber = recommendVO.getRecipeNumber();
			        recipeNumberList.add(recipeNumber);
			    }
			    tImage = rService.selectTitleImg(recipeNumberList);
			    System.out.println(tImage);
			    mv.addObject("rList", rList);
			    mv.addObject("tImage", tImage);
			    mv.setViewName("home");	
			} else if("인기".equals(recRecipe)) {
				List<TitleImageVO> tImage = new ArrayList<TitleImageVO>();
			    recipeNumberList = new ArrayList<>(); // 초기화
			    rList = rService.selectAllRecipe2(pInfo);
			    for (RecommendVO recommendVO : rList) {
			        Integer recipeNumber = recommendVO.getRecipeNumber();
			        recipeNumberList.add(recipeNumber);
			    }
			    tImage = rService.selectTitleImg(recipeNumberList);
			    System.out.println(tImage);
			    mv.addObject("rList", rList);
			    mv.addObject("tImage", tImage);
			    mv.setViewName("home");
			} else {
				List<TitleImageVO> tImage = new ArrayList<TitleImageVO>();
			    tImage = rService.selectTitleImg(recipeNumberList);
//			    List<RecommendVO> foodList = rService.foodTypeSelect(foodType);
//			    mv.addObject("pInfo", pInfo);
			    mv.addObject("rList", rList);
			    mv.addObject("tImage", tImage);
//			    mv.addObject("foodList", foodList);
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
		int recordCountPerPage = 4; // 한 페이지당 보여줄 게시물의 수
		int naviCountPerPage = 1; // 한 페이지당 보여줄 범위의 갯수
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
