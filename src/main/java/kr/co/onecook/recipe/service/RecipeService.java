package kr.co.onecook.recipe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.co.onecook.recipe.domain.CommentVO;
import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PageInfo;
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
	 * 레시피 소스 등록 Service
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
	void insertprcdImages(PrcdImgVO prcdImgs);

	/**
	 * 레시피 상세 Service
	 * @param recipeNumber
	 * @return
	 */
	RecipeVO selectRecipeByNo(int recipeNumber);

	/**
	 * 레시피 상세 대표사진 Service
	 * @param recipeNumber
	 * @return
	 */
	TitleImageVO selectRecipeTitle(int recipeNumber);

	/**
	 * 레시피 상세 재료 Service
	 * @param recipeNumber
	 * @return
	 */
	List<IgrdVO> selectRecipeIgrd(int recipeNumber);

	/**
	 * 레시피 상세 양념 Service
	 * @param recipeNumber
	 * @return
	 */
	List<SauseVO> selectRecipeSause(int recipeNumber);

	/**
	 * 레시피 상세 설명 Service
	 * @param recipeNumber
	 * @return
	 */
	List<PrcdVO> selectRecipePrcd(int recipeNumber);

	/** 
	 * 레시피 상세 사진 Service
	 * @param recipeNumber
	 * @return
	 */
	List<PrcdImgVO> selectRecipePrcdImg(int recipeNumber);

	/**
	 * 레시피 유저 코멘트 등록 Service
	 * @param comment
	 * @return
	 */
	int insertComment(CommentVO comment);

	/**
	 * 레시피 유저 코멘트 리스트 Service
	 * @param recipeNumber
	 * @return
	 */
	List<CommentVO> selectRecipeComment(int recipeNumber);

	
	
	
	
	
//	레시피 찜 영역 0222
	/**
	 * 레시피 찜 페이지 Service 
	 * @return int
	 */
	int getTotalCount();
	
	/**
	 * 레시피 찜 목록 Service
	 * @return rList
	 */

	List<RecipeVO> selectRecwishList(PageInfo pInfo);

	/**
	 * 조회수 증가 Service
	 * @param recipeNumber
	 */
	void updateHitCount(int recipeNumber);

	/**
	 * 레시피 평균 점수 Service
	 * @param recipeNumber
	 * @return
	 */
	double AverageRating(int recipeNumber);
}
