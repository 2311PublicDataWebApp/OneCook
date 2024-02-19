package kr.co.onecook.recipe.service.Impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.onecook.recipe.domain.IgrdVO;
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
	public void insertPrcdImgList(PrcdImgVO prcdImg) {
		rStore.insertPrcdImgList(session, prcdImg);
	}
}
