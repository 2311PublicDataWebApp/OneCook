package kr.co.onecook.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.notice.domain.PageInfo;

public interface NoticeService {

	
	

	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return
	 */
	int insertNotice(NoticeVO notice);

	/**
	 * 공지사항 삭제 Service
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice(int noticeNo);
	
	/**
	 * 공지사항 수정 Service
	 * @param notice
	 * @return
	 */
	int updateNotice(NoticeVO notice);
		
	/**
	 * 해당 번호의 공지사항 조회 Service
	 * @param noticeNo
	 * @return
	 */
	NoticeVO selectNoticeByNo(int noticeNo);

	/**
	 * 페이징 처리된 공지사항 목록 조회
	 * @param pInfo
	 * @return
	 */
	List<NoticeVO> selectNoticeList(PageInfo pInfo);

	/**
	 * 전체 공지사항 수 반환 Service
	 * @return
	 */
	int getTotalCount(Map<String, String> paramMap);




}
