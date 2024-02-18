package kr.co.onecook.recipe.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
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

}
