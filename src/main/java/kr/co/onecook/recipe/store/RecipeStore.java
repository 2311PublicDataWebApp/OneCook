package kr.co.onecook.recipe.store;


import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.TitleImageVO;



public interface RecipeStore {

	/**
	 * 레시피 등록 Store
	 * @param session
	 * @param recipe
	 * @param titleImage 
	 * @return int
	 */
	int insertRecipe(SqlSession session, RecipeVO recipe, TitleImageVO titleImage);

}
