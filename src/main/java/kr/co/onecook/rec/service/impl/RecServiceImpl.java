package kr.co.onecook.rec.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.onecook.rec.domain.PageInfo;
import kr.co.onecook.rec.domain.RecommendVO;
import kr.co.onecook.rec.domain.TitleImageVO;
import kr.co.onecook.rec.service.RecService;
import kr.co.onecook.rec.store.RecStore;

@Repository
public class RecServiceImpl implements RecService{
	
	@Autowired
	private RecStore rStore;
	@Autowired
	private SqlSession session;

	@Override
	public List<RecommendVO> selectAllRecipe(PageInfo pInfo) {
		List<RecommendVO> RCPS = rStore.selectAllRecipe(session, pInfo);
		return RCPS;
	}

	@Override
	public List<RecommendVO> selectAllRecipe2(PageInfo pInfo) {
		List<RecommendVO> RCPS = rStore.selectAllRecipe2(session, pInfo);
		return RCPS;
	}


	@Override
	public int getTotalCount() {
		int result = rStore.getTotalCount(session);
		return result;
	}

	@Override
	public List<RecommendVO> foodTypeSelect(String foodType) {
		List<RecommendVO> foodList = rStore.foodTypeSelect(session, foodType);
		return foodList;
	}

	@Override
	public List<RecommendVO> selectTitleImg(List<Integer> recipeNumberList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TitleImageVO> selectTitleImgCategory(List<Integer> recipeNumberList) {
		List<TitleImageVO> tImageCategory = rStore.selectTitleImgCategory(session, recipeNumberList);
		return tImageCategory;
	}
	
}
