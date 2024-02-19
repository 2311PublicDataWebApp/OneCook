package kr.co.onecook.notice.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.notice.domain.NoticeVO;

public interface NoticeStore {

	/**
	 * 공지사항 등록 Store
	 * @param session
	 * @param notice
	 * @return result
	 */
	int insertNotice(SqlSession session, NoticeVO notice);
	
}
