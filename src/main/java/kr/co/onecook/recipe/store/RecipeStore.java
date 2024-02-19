package kr.co.onecook.recipe.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PrcdImgVO;
import kr.co.onecook.recipe.domain.PrcdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.SauseVO;
import kr.co.onecook.recipe.domain.TitleImageVO;

public interface RecipeStore {

	/**
	 * 레시피 등록 Store
	 * 
	 * @param session
	 * @param recipe
	 * @param titleImage
	 * @param igrd
	 * @param igrdList
	 * @return int
	 */
	int insertRecipe(SqlSession session, RecipeVO recipe, TitleImageVO titleImage);

	/**
	 * 레시피 재료 등록 Store
	 * @param session
	 * @param igrd
	 */
	void insertIgrdList(SqlSession session, IgrdVO igrd);

	/**
	 * 레시피 소스 등록 Store
	 * @param session
	 * @param sause
	 */
	void insertSauseList(SqlSession session, SauseVO sause);

	/**
	 * 레시피 설명 등록 Store
	 * @param session
	 * @param newPrcd
	 */
	void insertPrcdList(SqlSession session, PrcdVO newPrcd);

	/**
	 * 레시피 설명 사진 등록 Store
	 * @param session
	 * @param prcdImg
	 */
	void insertPrcdImgList(SqlSession session, PrcdImgVO prcdImg);

}
