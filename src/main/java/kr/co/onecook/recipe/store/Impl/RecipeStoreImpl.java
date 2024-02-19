package kr.co.onecook.recipe.store.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.recipe.domain.IgrdVO;
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
	public void insertPrcdImgList(SqlSession session, PrcdImgVO prcdImg) {
		session.insert("RecipeMapper.insertPrcdImgList", prcdImg);	
	}
}
