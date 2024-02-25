package kr.co.onecook.cs.service;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.onecook.cs.domain.CsVO;
import kr.co.onecook.cs.domain.PageInfo;

@Service
public interface CsService {
	/**
	 * 1:1문의 등록 Service
	 * @param cs
	 * @return
	 */
	int insertFaq(CsVO cs);

	
	/**
	 * 1:1문의 조회 Service
	 * @param pInfo 
	 * @return List
	 */
	List<CsVO> selectFaqList(PageInfo pInfo);
	
	/**
	 * 전체 게시물 갯수 Service
	 * @return int
	 */

	int getTotalCount();

	/**
	 * 1:1문의 상세 Service
	 * @param questionNo
	 * @return cs
	 */
	CsVO selectQuestionByNo(int questionNo);

	/** 
	 * 1:1문의 수정 Service
	 * @param cs
	 * @return int
	 */
	int updateQuestion(CsVO cs);

//	/**
//	 * 게시물 삭제 Service
//	 * @return int
//	 */
//
//	int deleteArticle(int questionNo);

	
}
