package kr.co.onecook.cs.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.cs.domain.CsVO;

public interface CsStore {
	
	/**
	 * 1:1문의 등록
	 * @param session
	 * @param cs
	 * @return result
	 */
	int insertFaq(SqlSession session, CsVO cs);

}
