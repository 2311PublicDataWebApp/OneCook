package kr.co.onecook.recipe.service.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.service.RecipeService;
import kr.co.onecook.recipe.store.RecipeStore;



@Service
public class RecipeServiceImpl implements RecipeService{

	@Autowired
	private RecipeStore rStore;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertRecipe(RecipeVO recipe) {
		int result = rStore.insertRecipe(session, recipe);
		return result;
	}

}
