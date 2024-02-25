package kr.co.onecook.cs.service.impl;

import java.util.List;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.domain.PageInfo;
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

	//1:1문의 조회
	@Override
	public List<CsVO> selectFaqList(PageInfo pInfo) {
		List<CsVO> cList = cStore.selectFaqList(session, pInfo);
		return cList;
	}

	
	//게시물 전체 갯수
	@Override
	public int getTotalCount() {
		int totalCount = cStore.selectTotalCount(session);
		return totalCount;
	}

	@Override
	public CsVO selectQuestionByNo(int questionNo) {
		CsVO cs = cStore.selectQuestionByNo(session, questionNo);
		return cs;
	}

	@Override
	public int updateQuestion(CsVO cs) {
		int result = cStore.updateQuestion(session, cs);
		return result;
	}

//	//게시물 삭제
//	@Override
//	public int deleteArticle(int questionNo) {
//		int result = cStore.deleteArticle(session, questionNo);
//		return result;
//	}
//	
//	
	
}
