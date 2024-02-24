package kr.co.onecook.rec.store.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.rec.domain.PageInfo;
import kr.co.onecook.rec.domain.RecommendVO;
import kr.co.onecook.rec.domain.TitleImageVO;
import kr.co.onecook.rec.store.RecStore;

@Repository
public class RecStoreImpl implements RecStore{

	@Override
	public List<RecommendVO> selectAllRecipe(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBound = new RowBounds(offset, limit);
		List<RecommendVO> RCPS = session.selectList("RecommendMapper.selectAllRecipe", null, rowBound);
		return RCPS;
	}

	@Override
	public List<RecommendVO> selectAllRecipe2(SqlSession session, PageInfo pInfo) {
		List<RecommendVO> RCPS = session.selectList("RecommendMapper.selectAllRecipe2");
		return RCPS;
	}

	@Override
	public List<TitleImageVO> selectTitleImg(SqlSession session, List<Integer> recipeNumberList) {
		List<TitleImageVO> tImage = session.selectList("RecommendMapper.selectTitleImage", recipeNumberList);
		return tImage;
	}

	@Override
	public int getTotalCount(SqlSession session) {
		int result = session.selectOne("RecommendMapper.seletTotalCount");
		return result;
	}

	@Override
	public List<RecommendVO> foodTypeSelect(SqlSession session, String foodType) {
		List<RecommendVO> foodList = session.selectList("RecommendMapper.foodTypeSelect", foodType);
		return foodList;
	}
}
