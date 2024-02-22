package kr.co.onecook.rec.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.rec.domain.PageInfo;
import kr.co.onecook.rec.domain.RecommendVO;
import kr.co.onecook.rec.domain.TitleImageVO;

public interface RecStore {

	/**
	 * RECIPE_TBL 모든 요소 셀렉트 Store
	 * @param session
	 * @param pInfo 
	 * @return RCPS
	 */
	List<RecommendVO> selectAllRecipe(SqlSession session, PageInfo pInfo);

	/**
	 * RECIPE_THN_TBL 에 IMAGE_FILEPATH 셀렉트 Store
	 * @param recipeNumberList 
	 * @return tImage
	 */
	List<TitleImageVO> selectTitleImg(SqlSession session, List<Integer> recipeNumberList);

	/**
	 * 전체 레시피 갯수 Store
	 * @return
	 */
	int getTotalCount(SqlSession session);

	/**
	 * RECIPE_TBL 모든 요소 셀렉트2 Store
	 * @param session
	 * @param pInfo
	 * @return RCPS
	 */
	List<RecommendVO> selectAllRecipe2(SqlSession session, PageInfo pInfo);

	/**
	 * RECIPE_TBL 카테고리별 셀렉트 Store
	 * @param foodType 
	 * @return foodList
	 */
	List<RecommendVO> foodTypeSelect(SqlSession session, String foodType);

}
