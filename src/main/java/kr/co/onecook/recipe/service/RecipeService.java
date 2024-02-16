package kr.co.onecook.recipe.service;

import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.TitleImageVO;

public interface RecipeService {
	/**
	 * 레시피 등록 Service
	 * @param recipe
	 * @param titleImage 
	 * @return int
	 */
	int insertRecipe(RecipeVO recipe, TitleImageVO titleImage);

}
