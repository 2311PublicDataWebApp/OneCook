package kr.co.onecook.cs.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.service.CsService;
import kr.co.onecook.cs.store.CsStore;

@Service
public class CsServiceImpl implements CsService{
	
	//스토어연결
	@Autowired
	private CsStore cStore;
	
	//session연결
	@Autowired
	private SqlSession session;
	
	
	//1:1문의 등록
	@Override
	public int insertFaq(CsVO cs) {
		int result = cStore.insertFaq(session, cs);
		return result;
	}
	
}
