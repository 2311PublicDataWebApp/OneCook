package kr.co.onecook.recipe.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.recipe.domain.CommentVO;
import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PageInfo;
import kr.co.onecook.recipe.domain.PageInfoVO;
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
	void insertprcdImages(SqlSession session, PrcdImgVO prcdImgs);

	/** 
	 * 레시피 상세 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	RecipeVO selectRecipeByNo(SqlSession session, int recipeNumber);

	/**
	 * 레시피 상세 대표사진 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	TitleImageVO selectRecipeTitle(SqlSession session, int recipeNumber);

	/**
	 * 레시피 상세 재료 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	List<IgrdVO> selectRecipeIgrd(SqlSession session, int recipeNumber);

	/**
	 * 레시피 상세 양념 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	List<SauseVO> selectRecipeSause(SqlSession session, int recipeNumber);

	/**
	 * 레시피 상세 설명 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	List<PrcdVO> selectRecipePrcd(SqlSession session, int recipeNumber);

	/**
	 * 레시피 상세 사진 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	List<PrcdImgVO> selectRecipePrcdImg(SqlSession session, int recipeNumber);

	/**
	 * 레시피 코멘트 등록 Store
	 * @param session
	 * @param comment
	 * @return
	 */
	int insertComment(SqlSession session, CommentVO comment);

	/**
	 * 레시피 유저 코멘트 리스트 Service
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	List<CommentVO> selectRecipeComment(SqlSession session, int recipeNumber);

	
	
	
	
	
//	0222 추가 레시피 찜 리스트 -김혜연
	
	/**
	 * 레시피찜 전체 게시물 갯수 Store
	 * @param session
	 * @return int
	 */
	
	int selectTotalCount(SqlSession session);

	/**
	 * 레시피찜 목록 Store
	 * @param session
	 * @return
	 */
	
	
	List<RecipeVO> selectRecwishList(SqlSession session, PageInfo pInfo);

	/** 
	 * 조회수 증가 Store
	 * @param session
	 * @param recipeNumber
	 */
	void updateHitCount(SqlSession session, int recipeNumber);

	/**
	 * 레시피 평균 점수
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	double AverageRating(SqlSession session, int recipeNumber);

	/**
	 * 평가 중복 확인 Store
	 * @param session
	 * @param writer
	 * @param recipeNo
	 * @return
	 */
	boolean checkIfUserAlreadyCommented(SqlSession session, String writer, int recipeNo);

	/**
	 * 전체 레시피 조회 Store
	 * @param session
	 * @return
	 */
	List<RecipeVO> getAllRecipes(SqlSession session);

	/**
	 * 랭킹 페이지 평점 조회 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	double getAverageRating(SqlSession session, int recipeNumber);

	/**
	 * 랭킹 페이지 타이틀 이미지 Store
	 * @param session
	 * @param recipeNumber
	 * @return
	 */
	TitleImageVO getTitleImageByRecipeNumber(SqlSession session, int recipeNumber);

	/**
	 * 랭킹 페이지 토탈 갯수 Store
	 * @param session
	 * @return
	 */
	int getRecipeCount(SqlSession session);

	/**
	 * 랭킹 페이지 현재 페이지 Store
	 * @param session
	 * @param page
	 * @param pageSize
	 * @return
	 */
	List<RecipeVO> getRecipesByPage(SqlSession session, int page, int pageSize);

	/**
	 * 랭킹 페이지 페이징
	 * @param session
	 * @param pInfo
	 * @return
	 */
	List<RecipeVO> getPageInfo(SqlSession session, PageInfoVO pInfo);

	/**
	 * 랭킹 페이지 토탈 카운트
	 * @param session
	 * @return
	 */
	int TotalCount(SqlSession session);

	
}
