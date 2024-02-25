package kr.co.onecook.recipe.service.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.onecook.recipe.domain.CommentVO;
import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PageInfo;
import kr.co.onecook.recipe.domain.PageInfoVO;
import kr.co.onecook.recipe.domain.PrcdImgVO;
import kr.co.onecook.recipe.domain.PrcdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.SauseVO;
import kr.co.onecook.recipe.domain.TitleImageVO;
import kr.co.onecook.recipe.service.RecipeService;
import kr.co.onecook.recipe.store.RecipeStore;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeStore rStore;

	@Autowired
	private SqlSession session;

	@Override
	public int insertRecipe(RecipeVO recipe, TitleImageVO titleImage) {
		int result = rStore.insertRecipe(session, recipe, titleImage);

		return result;
	}

	@Override
	public void insertIgrdList(IgrdVO igrdList) {
		rStore.insertIgrdList(session, igrdList);
	}

	@Override
	public void insertSauseList(SauseVO sause) {
		rStore.insertSauseList(session, sause);

	}

	@Override
	public void insertPrcdList(PrcdVO newPrcd) {
		rStore.insertPrcdList(session, newPrcd);
	}

	@Override
	public void insertprcdImages(PrcdImgVO prcdImgs) {
		rStore.insertprcdImages(session, prcdImgs);
	}

	@Override
	public RecipeVO selectRecipeByNo(int recipeNumber) {
		RecipeVO recipe = rStore.selectRecipeByNo(session, recipeNumber);
		return recipe;
	}

	@Override
	public TitleImageVO selectRecipeTitle(int recipeNumber) {
		TitleImageVO title = rStore.selectRecipeTitle(session, recipeNumber);
		return title;
	}

	@Override
	public List<IgrdVO> selectRecipeIgrd(int recipeNumber) {
		List<IgrdVO> igrd = rStore.selectRecipeIgrd(session, recipeNumber);
		return igrd;
	}

	@Override
	public List<SauseVO> selectRecipeSause(int recipeNumber) {
		List<SauseVO> sause = rStore.selectRecipeSause(session, recipeNumber);
		return sause;
	}

	@Override
	public List<PrcdVO> selectRecipePrcd(int recipeNumber) {
		List<PrcdVO> prcd = rStore.selectRecipePrcd(session, recipeNumber);
		return prcd;
	}

	@Override
	public List<PrcdImgVO> selectRecipePrcdImg(int recipeNumber) {
		List<PrcdImgVO> prcdImg = rStore.selectRecipePrcdImg(session, recipeNumber);
		return prcdImg;
	}

	@Override
	public int insertComment(CommentVO comment) {
		int result = rStore.insertComment(session, comment);
		return result;
	}

	@Override
	public List<CommentVO> selectRecipeComment(int recipeNumber) {
		List<CommentVO> comment = rStore.selectRecipeComment(session, recipeNumber);
		return comment;
	}


	
	//0222 레시피 찜 영역 추가 - 김혜연
	
	@Override
	public int getTotalCount() {
		int totalCount = rStore.selectTotalCount(session);
		return totalCount;
	}

	@Override
	public List<RecipeVO> selectRecwishList(PageInfo pInfo) {
		List<RecipeVO> rList = rStore.selectRecwishList(session, pInfo);
		return rList;
	}

	@Override
	public void updateHitCount(int recipeNumber) {
	    rStore.updateHitCount(session, recipeNumber);
	}

	@Override
	public double AverageRating(int recipeNumber) {
		return rStore.AverageRating(session, recipeNumber);
	}

	@Override
	public boolean checkIfUserAlreadyCommented(String writer, int recipeNo) {
	    // 이미 댓글을 작성했는지 여부를 확인하여 불리언 값으로 반환
	    return rStore.checkIfUserAlreadyCommented(session, writer, recipeNo);
	}

	@Override
	public List<RecipeVO> getAllRecipes() {
		List<RecipeVO> recipe = rStore.getAllRecipes(session);
		return recipe;
	}

	@Override
	public double getAverageRating(int recipeNumber) {
		double getAvg = rStore.getAverageRating(session, recipeNumber);
		return getAvg;
	}

	@Override
	public TitleImageVO getTitleImageByRecipeNumber(int recipeNumber) {
		TitleImageVO titleImg = rStore.getTitleImageByRecipeNumber(session, recipeNumber);
		return titleImg;
	}

	@Override
	public List<RecipeVO> getPageInfo(PageInfoVO pInfo) {
		List<RecipeVO> page = rStore.getPageInfo(session, pInfo);
		return page;
	}

	@Override
	public int TotalCount() {
		int totalCount = rStore.TotalCount(session);
		return totalCount;
	}
}
