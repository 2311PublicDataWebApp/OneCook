package kr.co.onecook.cs.store.impl;

import java.util.List;



import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.domain.PageInfo;
import kr.co.onecook.cs.store.CsStore;

@Repository
public class CsStoreImpl implements CsStore{

	//1:1문의 등록
	@Override
	public int insertFaq(SqlSession session, CsVO cs) {
		int result = session.insert("CsMapper.insertFaq", cs);
		return result;
	}

	
	//1:1문의 조회
	@Override
	public List<CsVO> selectFaqList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<CsVO> cList = session.selectList("CsMapper.selectFaqList", null, rowBounds);
		return cList;
	}

	//게시물 총 갯수
	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("CsMapper.selectTotalCount");
		return totalCount;
	}

//	//게시물 삭제
//	@Override
//	public int deleteArticle(SqlSession session, int questionNo) {
//		int result=session.delete("CsMapper.deleteArticle",questionNo);
//		return result;
//	}

}
