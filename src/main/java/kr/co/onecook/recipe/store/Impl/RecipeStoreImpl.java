package kr.co.onecook.recipe.store.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.rec.domain.RecommendVO;
import kr.co.onecook.recipe.domain.CommentVO;
import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.PageInfo;
import kr.co.onecook.recipe.domain.PageInfoVO;
import kr.co.onecook.recipe.domain.PrcdImgVO;
import kr.co.onecook.recipe.domain.PrcdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.domain.SauseVO;
import kr.co.onecook.recipe.domain.TitleImageVO;
import kr.co.onecook.recipe.store.RecipeStore;

@Repository
public class RecipeStoreImpl implements RecipeStore {

	@Override
	public int insertRecipe(SqlSession session, RecipeVO recipe, TitleImageVO titleImage) {
		int result = session.insert("RecipeMapper.insertRecipe", recipe);
		result += session.insert("RecipeMapper.insertTitleImage", titleImage);
		return result;
	}

	@Override
	public void insertIgrdList(SqlSession session, IgrdVO igrd) {
		session.insert("RecipeMapper.insertIgrdList", igrd);
	}

	@Override
	public void insertSauseList(SqlSession session, SauseVO sause) {
		session.insert("RecipeMapper.insertSause", sause);	
	}

	@Override
	public void insertPrcdList(SqlSession session, PrcdVO newPrcd) {
		session.insert("RecipeMapper.insertRecipeDetails", newPrcd);
		
	}

	@Override
	public void insertprcdImages(SqlSession session, PrcdImgVO prcdImgs) {
		session.insert("RecipeMapper.insertprcdImages", prcdImgs);	
	}

	@Override
	public RecipeVO selectRecipeByNo(SqlSession session, int recipeNumber) {
		RecipeVO recipe = session.selectOne("RecipeMapper.selectRecipeByNo", recipeNumber);
		return recipe;
	}

	@Override
	public TitleImageVO selectRecipeTitle(SqlSession session, int recipeNumber) {
		TitleImageVO title = session.selectOne("RecipeMapper.selectRecipeTitleImg", recipeNumber);
		return title;
	}

	@Override
	public List<IgrdVO> selectRecipeIgrd(SqlSession session, int recipeNumber) {
		List<IgrdVO> igrd = session.selectList("RecipeMapper.selectRecipeIgrd", recipeNumber);
		return igrd;
	}

	@Override
	public List<SauseVO> selectRecipeSause(SqlSession session, int recipeNumber) {
		List<SauseVO> sause = session.selectList("RecipeMapper.selectRecipeSause", recipeNumber);
		return sause;
	}

	@Override
	public List<PrcdVO> selectRecipePrcd(SqlSession session, int recipeNumber) {
		List<PrcdVO> prcd = session.selectList("RecipeMapper.selectRecipePrcd", recipeNumber);
		return prcd;
	}

	@Override
	public List<PrcdImgVO> selectRecipePrcdImg(SqlSession session, int recipeNumber) {
		List<PrcdImgVO> prcdImg = session.selectList("RecipeMapper.selectRecipePrcdImg", recipeNumber);
		return prcdImg;
	}

	@Override
	public int insertComment(SqlSession session, CommentVO comment) {
		int result = session.insert("RecipeMapper.insertComment", comment);
		return result;
	}

	@Override
	public List<CommentVO> selectRecipeComment(SqlSession session, int recipeNumber) {
		List<CommentVO> comment = session.selectList("RecipeMapper.selectRecipeComment", recipeNumber);
		return comment;
	}

	
	
	
	
	//0222 추가 레시피찜 목록 관련
	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("RecipeMapper.selectTotalCount");
		return totalCount;
	}

	@Override
	public List<RecipeVO> selectRecwishList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<RecipeVO> rList 
		= session.selectList("RecipeMapper.selectRecWishList", null, rowBounds);
		return rList;
	}

	@Override
	public void updateHitCount(SqlSession session, int recipeNumber) {
	    session.update("RecipeMapper.updateHitCount", recipeNumber);
	}

	@Override
	public double AverageRating(SqlSession session, int recipeNumber) {
	    Double averageRating = session.selectOne("RecipeMapper.AverageRating", recipeNumber);
	    return averageRating != null ? averageRating : 0;
	}

    public boolean checkIfUserAlreadyCommented(SqlSession session, String writer, int recipeNo) {
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("writer", writer);
        parameters.put("recipeNo", recipeNo);
        return session.selectOne("RecipeMapper.checkIfUserAlreadyCommented", parameters);
    }

	@Override
	public List<RecipeVO> getAllRecipes(SqlSession session) {
		List<RecipeVO> recipe = session.selectList("RecipeMapper.getAllRecipes");
		return recipe;
	}

	@Override
	public double getAverageRating(SqlSession session, int recipeNumber) {
	    Double averageRating = session.selectOne("RecipeMapper.AverageRating", recipeNumber);
	    return averageRating != null ? averageRating : 0;
	}

	@Override
	public TitleImageVO getTitleImageByRecipeNumber(SqlSession session, int recipeNumber) {
		TitleImageVO title = session.selectOne("RecipeMapper.getTitleImageByRecipeNumber", recipeNumber);
		return title;
	}

	@Override
	public int getRecipeCount(SqlSession session) {
		int totalCount = session.selectOne("RecipeMapper.getRecipeCount");
		return totalCount;
	}

	@Override
	public List<RecipeVO> getRecipesByPage(SqlSession session, int page, int pageSize) {
	    int offset = (page - 1) * pageSize;
	    Map<String, Integer> params = new HashMap<>();
	    params.put("offset", offset);
	    params.put("pageSize", pageSize);
	    return session.selectList("RecipeMapper.getRecipesByPage", params);
	}

	@Override
	public List<RecipeVO> getPageInfo(SqlSession session, PageInfoVO pInfo) {
	    int limit = pInfo.getRecordCountPerPage();
	    int offset = (pInfo.getCurrentPage()-1)*limit;
	    RowBounds rowBound = new RowBounds(offset, limit);
	    List<RecipeVO> page = session.selectList("RecipeMapper.selectAllRecipe", null, rowBound);
	    return page;
	}

	@Override
	public int TotalCount(SqlSession session) {
		int totalCount = session.selectOne("RecipeMapper.totalCount");
		return totalCount;
	}

	@Override
	public void deleteRecipe(SqlSession session, int recipeNumber) {
		session.delete("RecipeMapper.deleteRecipe", recipeNumber);
	}
}
