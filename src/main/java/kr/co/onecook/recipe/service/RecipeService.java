package kr.co.onecook.recipe.service;

import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.TitleImageVO;

public interface RecipeService {
	/**
	 * 레시피 등록 Service
	 * @param recipe
	 * @param titleImage 
	 * @param igrd 
	 * @param igrdList 
	 * @return int
	 */
	int insertRecipe(RecipeVO recipe, TitleImageVO titleImage);
	
	/**
	 * 레시피 재료 등록 Service
	 * @param igrdList
	 */
	void insertIgrdList(IgrdVO igrdList);
}
