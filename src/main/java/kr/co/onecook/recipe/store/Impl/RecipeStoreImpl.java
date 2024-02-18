package kr.co.onecook.recipe.store.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.recipe.domain.IgrdVO;
import kr.co.onecook.recipe.domain.RecipeVO;
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

}
