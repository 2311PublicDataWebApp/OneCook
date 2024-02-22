package kr.co.onecook.cs.store.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.store.CsStore;

@Repository
public class CsStoreImpl implements CsStore{

	//1:1문의 등록
	@Override
	public int insertFaq(SqlSession session, CsVO cs) {
		int result = session.insert("CsMapper.insertFaq", cs);
		return result;
	}

}
