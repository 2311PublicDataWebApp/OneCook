package kr.co.onecook.rec.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.onecook.rec.domain.RecVO;
import kr.co.onecook.rec.service.RecService;
import kr.co.onecook.rec.store.RecStore;

@Repository
public class RecServiceImpl implements RecService{
	
	@Autowired
	private RecStore rStore;
	@Autowired
	private SqlSession session;

	@Override
	public List<RecVO> selectAllRecipe() {
		List<RecVO> RCPS = rStore.selectAllRecipe(session);
		return RCPS;
	}

}
