package kr.co.onecook.rec.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.rec.domain.RecVO;

public interface RecStore {

	/**
	 * RECIPE_TBL 모든 요소 셀렉트 Store
	 * @param session
	 * @return RCPS
	 */
	List<RecVO> selectAllRecipe(SqlSession session);

}
