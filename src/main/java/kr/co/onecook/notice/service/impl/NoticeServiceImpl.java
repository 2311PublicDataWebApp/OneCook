package kr.co.onecook.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.notice.domain.PageInfo;
import kr.co.onecook.notice.service.NoticeService;
import kr.co.onecook.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeStore nStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int insertNotice(NoticeVO notice) {
		int result = nStore.insertNotice(session, notice);
		return result;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		int result = nStore.deleteNotice(session, noticeNo);
		return result;
	}
	
	@Override
	public int updateNotice(NoticeVO notice) {
		int result = nStore.updateNotice(session, notice);
		return result;
	}
	
	@Override
	public List<NoticeVO> selectNoticeList(PageInfo pInfo) {
		List<NoticeVO> nList = nStore.selectNoticeList(session, pInfo);
		return nList;
	}
	
	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) {
		NoticeVO notice = nStore.selectNoticeByNo(session, noticeNo);
		return notice;
	}
	
	@Override
	public int getTotalCount(Map<String, String> paramMap) {
		int totalCount = nStore.selectTotalCount(session,paramMap);
		return totalCount;
	}



	
}
