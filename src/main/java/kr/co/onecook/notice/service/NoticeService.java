package kr.co.onecook.notice.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.notice.domain.PageInfo;

public interface NoticeService {

	NoticeVO selectNoticeByNo(int noticeNo);

	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return
	 */
	int insertNotice(NoticeVO notice);

	int getTotalCount();

	List<NoticeVO> selectNoticeList(PageInfo pInfo);

	/**
	 * 공지사항 삭제 Service
	 * @param noticeNo
	 * @return
	 */
	int deleteNotice(int noticeNo);

	int updateNotice(NoticeVO notice);


}
