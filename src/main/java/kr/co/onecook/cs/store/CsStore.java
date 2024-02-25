package kr.co.onecook.cs.store;

import java.util.List;



import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.domain.PageInfo;

public interface CsStore {
	
	/**
	 * 1:1문의 등록
	 * @param session
	 * @param cs
	 * @return result
	 */
	int insertFaq(SqlSession session, CsVO cs);
	
	/**
	 * 1:1문의 조회 Store
	 * @param session
	 * @param pInfo 
	 * @return List
	 */
	List<CsVO> selectFaqList(SqlSession session, PageInfo pInfo);

	/**
	 * 1:1문의 전체 게시물갯수 Store
	 * @param session
	 * @param pInfo 
	 * @return List
	 */

	int selectTotalCount(SqlSession session);

	/**
	 * 1:1문의 상세 Store
	 * @param session
	 * @param questionNo
	 * @return cs
	 */
	CsVO selectQuestionByNo(SqlSession session, int questionNo);

	/**
	 * 1:1문의 정보 수정 Store
	 * @param session
	 * @param cs
	 * @return int
	 */
	int updateQuestion(SqlSession session, CsVO cs);

//	/**
//	 * 게시물 삭제
//	 * @param session
//	 * @param questionNo
//	 * @return
//	 */
//	int deleteArticle(SqlSession session, int questionNo);

}
