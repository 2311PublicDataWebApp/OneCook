package kr.co.onecook.ranking.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import kr.co.onecook.recipe.domain.PageInfoVO;
import kr.co.onecook.recipe.domain.RecipeDTO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.TitleImageVO;
import kr.co.onecook.recipe.service.RecipeService;

@Controller
public class rankingController {

    @Autowired
    private RecipeService rService;

 // 랭킹 페이지 이동 
    @RequestMapping(value = "/ranking/ranking.oc", method = RequestMethod.GET)
    public ModelAndView showRankingRecipe(ModelAndView mv, HttpSession session
    		, @RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage) {
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
    	
    	
        // 전체 레시피 수를 가져옴
        int totalCount = rService.TotalCount();
        // 요청된 페이지에 해당하는 페이징 정보 생성
        PageInfoVO pInfo = this.getPageInfo(currentPage, totalCount);
        // 요청된 페이지에 해당하는 레시피 목록을 가져옴
        List<RecipeVO> recipeList = rService.getPageInfo(pInfo);

        // 레시피 목록을 DTO로 변환
        List<RecipeDTO> recipeDTOList = new ArrayList<>();
        for (RecipeVO recipe : recipeList) {
            double averageRating = rService.getAverageRating(recipe.getRecipeNumber());
            RecipeDTO recipeDTO = new RecipeDTO();
            recipeDTO.setRecipeVO(recipe);
            TitleImageVO titleImageVO = rService.getTitleImageByRecipeNumber(recipe.getRecipeNumber());
            recipeDTO.setTitleVO(titleImageVO);
            recipeDTO.setAverageRating(averageRating);
            recipeDTOList.add(recipeDTO);
        }

        Collections.sort(recipeDTOList, (r1, r2) -> {
            int ratingComparison = Double.compare(r2.getAverageRating(), r1.getAverageRating());
            if (ratingComparison != 0) {
                // 평점이 다른 경우에는 평점을 기준으로 내림차순 정렬
                return ratingComparison;
            } else {
                // 평점이 같은 경우에는 조회수를 기준으로 내림차순 정렬
                return Integer.compare(r2.getRecipeVO().getRecipeCount(), r1.getRecipeVO().getRecipeCount());
            }
        });

        // ModelAndView에 데이터를 담아서 뷰로 전달
        mv.addObject("recipeDTOList", recipeDTOList);
        mv.addObject("pInfo", pInfo); // 페이징 정보도 함께 전달
        mv.setViewName("ranking/ranking");
        return mv;
    }

    private PageInfoVO getPageInfo(Integer currentPage, int totalCount) {
        int recordCountPerPage = 8; // 한 페이지당 보여줄 게시물의 수
        int naviCountPerPage = 5; // 한 번에 보여줄 페이지 링크 수

        // 페이지 총 갯수를 구하기 위한 계산
        int totalPageCount = (int) Math.ceil((double) totalCount / recordCountPerPage);

        // 현재 페이지가 유효한 범위 내에 있는지 확인하고 조정
        if (currentPage < 1) {
            currentPage = 1;
        } else if (currentPage > totalPageCount) {
            currentPage = totalPageCount;
        }

        // 시작 네비게이션 페이지 계산
        int startNavi = ((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1;

        // 끝 네비게이션 페이지 계산
        int endNavi = startNavi + naviCountPerPage - 1;
        if (endNavi > totalPageCount) {
            endNavi = totalPageCount;
        }

        // PageInfoVO 객체 생성하여 반환
        return new PageInfoVO(currentPage, totalCount, totalPageCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
    }
}