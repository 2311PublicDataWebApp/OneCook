package kr.co.onecook.recipe.service;

import kr.co.onecook.recipe.domain.RecipeVO;

public interface RecipeService {
	/**
	 * 레시피 등록 Service
	 * @param recipe
	 * @return int
	 */
	int insertRecipe(RecipeVO recipe);

}
