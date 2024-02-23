package kr.co.onecook.notice.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.notice.domain.PageInfo;

public interface NoticeStore {

	/**
	 * 공지사항 등록 Store
	 * @param session
	 * @param notice
	 * @return result
	 */
	int insertNotice(SqlSession session, NoticeVO notice);

	/**
	 * 공지사항 삭제 Store
	 * @param session
	 * @param noticeNo
	 * @return result
	 */
	int deleteNotice(SqlSession session, int noticeNo);

	/**
	 * 공지사항 수정 Store
	 * @param session
	 * @param notice
	 * @return result
	 */
	int updateNotice(SqlSession session, NoticeVO notice);
	
	/**
	 * 번호에 해당하는 공지사항 조회
	 * @param session
	 * @param noticeNo
	 * @return notice
	 */
	NoticeVO selectNoticeByNo(SqlSession session, int noticeNo);

	/**
	 * 페이징 처리된 공지사항 목록 조회 Store
	 * @param session
	 * @param pInfo
	 * @return nList
	 */
	List<NoticeVO> selectNoticeList(SqlSession session, PageInfo pInfo);

	/**
	 * 전체 공지사항 수 반환 Store
	 * @param session
	 * @return
	 */
	int selectTotalCount(SqlSession session, Map<String, String> paramMap);
	
}
