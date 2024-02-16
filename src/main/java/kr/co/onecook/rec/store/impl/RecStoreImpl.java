package kr.co.onecook.rec.store.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.rec.domain.RecVO;
import kr.co.onecook.rec.store.RecStore;

@Repository
public class RecStoreImpl implements RecStore{

	@Override
	public List<RecVO> selectAllRecipe(SqlSession session) {
		List<RecVO> RCPS = session.selectList("RecMapper.selectAllRecipe");
		return RCPS;
	}

}
