package kr.co.onecook.notice.store.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.notice.domain.PageInfo;
import kr.co.onecook.notice.store.NoticeStore;

@Repository 
public class NoticeStoreImpl implements NoticeStore{

	// 공지사항 등록
	@Override
	public int insertNotice(SqlSession session, NoticeVO notice) {
		int result = session.insert("NoticeMapper.insertNotice", notice);
		return result;
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(SqlSession session, int noticeNo) {
		int result = session.delete("NoticeMapper.deleteNotice", noticeNo);
		return result;
	}
	
	// 공지사항 수정
	@Override
	public int updateNotice(SqlSession session, NoticeVO notice) {
		int result = session.update("NoticeMapper.updateNotice", notice);
		return result;
	}
	
	// 번호에 해당하는 공지사항 조회
	@Override
	public NoticeVO selectNoticeByNo(SqlSession session, int noticeNo) {
		NoticeVO notice = session.selectOne("NoticeMapper.selectNoticeByNo", noticeNo);
		return notice;
	}

	// 페이징 처리된 공지사항 목록 조회
	@Override
	public List<NoticeVO> selectNoticeList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBound = new RowBounds(offset, limit);
		List<NoticeVO> nList = session.selectList("NoticeMapper.selectNoticeList", null, rowBound);		
		return nList;
	}

	// 전체 공지사항 수 반환
	@Override
	public int selectTotalCount(SqlSession session, Map<String, String> paramMap) {
		int totalCount = session.selectOne("NoticeMapper.selectTotalCount", paramMap); 
		return totalCount;
	}
	
	
	
}
