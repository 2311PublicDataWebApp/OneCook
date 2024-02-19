package kr.co.onecook.notice.store.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.notice.domain.PageInfo;
import kr.co.onecook.notice.service.NoticeService;
import kr.co.onecook.notice.store.NoticeStore;

@Repository 
public class NoticeStoreImpl implements NoticeService{

	@Override
	public NoticeVO selectNoticeByNo(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insertNotice(SqlSession session, NoticeVO notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeVO> selectNoticeList(PageInfo pInfo) {
		// TODO Auto-generated method stub
		return null;
	}



	
	
	
	
}
