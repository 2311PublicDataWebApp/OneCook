package kr.co.onecook.recipe.store.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.recipe.domain.RecipeVO;
import kr.co.onecook.recipe.store.RecipeStore;

@Repository
public class RecipeStoreImpl implements RecipeStore{

		@Override
		public int insertRecipe(SqlSession session, RecipeVO recipe) {
			int result = session.insert("RecipeMapper.insertRecipe", recipe);
			return result;
		}

	}


