package kr.co.onecook.recipe.service;

import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PrcdImgVO;
import kr.co.onecook.recipe.domain.PrcdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.SauseVO;
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

	/**
	 * 레시피 소스 등록 Servise
	 * @param newSause
	 */
	void insertSauseList(SauseVO sause);

	/**
	 * 레시피 설명 등록 Service
	 * @param newPrcd
	 */
	void insertPrcdList(PrcdVO newPrcd);
	
	/**
	 * 레시피 설명 사진 등록 Service
	 * @param prcdImg
	 */
	void insertPrcdImgList(PrcdImgVO prcdImg);
}
