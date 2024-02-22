package kr.co.onecook.rec.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.onecook.rec.domain.PageInfo;
import kr.co.onecook.rec.domain.RecommendVO;
import kr.co.onecook.rec.domain.TitleImageVO;

@Service
public interface RecService {

	/**
	 * RECIPE_TBL 모든 요소 셀렉트 Service
	 * @param pInfo 
	 * @return RCPS
	 */
	List<RecommendVO> selectAllRecipe(PageInfo pInfo);

	/**
	 * RECIPE_THN_TBL 에 IMAGE_FILEPATH 셀렉트 Service
	 * @param recipeNumberList 
	 * @return tImage
	 */
	List<TitleImageVO> selectTitleImg(List<Integer> recipeNumberList);

	/**
	 * 전체 레시피 갯수 Service
	 * @return result
	 */
	int getTotalCount();

	/**
	 * RECIPE_TBL 모든 요소 셀렉트2 Service
	 * @param pInfo
	 * @return RCPS
	 */
	List<RecommendVO> selectAllRecipe2(PageInfo pInfo);

	/**
	 * RECIPE_TBL 카테고리별 셀렉트 Service
	 * @param foodType 
	 * @return foodList
	 */
	List<RecommendVO> foodTypeSelect(String foodType);

}
