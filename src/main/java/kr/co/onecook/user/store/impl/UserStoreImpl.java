package kr.co.onecook.user.store.impl;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import kr.co.onecook.user.domain.CommentVO;
import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.user.domain.PageInfo;
import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.store.UserStore;

@Repository 
public class UserStoreImpl implements UserStore {

	//로그인
	@Override
	public UserVO checkUserLogin(SqlSession session, UserVO user) {
		UserVO uOne = session.selectOne("UserMapper.checkUserLogin",user);
		return uOne;
	}
	
	//회원가입
	@Override
	public int insertMember(SqlSession session, UserVO user) {
		int result = session.insert("UserMapper.insertMember", user);
		return result;
	}
	
	//회원검색_아이디
	@Override
	public UserVO selectOneById(SqlSession session, String userId) {
		UserVO user 
		= session.selectOne("UserMapper.selectOneById", userId);
		return user;
	}
	
	
	//회원검색_비밀번호
	@Override
	public UserVO selectOneByPw(SqlSession session, String userPw) {
		UserVO user 
		= session.selectOne("UserMapper.selectOneById", userPw);
		return user;
	}
	//회원수정
	@Override
	public int updateMember(SqlSession session, UserVO user) {
		int result = session.update("UserMapper.updateMember", user);
		return result;
	}
	
	//회원탈퇴
	@Override
	public int deleteMember(SqlSession session, String userId) {
		int result = session.delete("UserMapper.deleteMember", userId);
		return result;
	}

	//아이디찾기
	@Override
	public UserVO memberIdSearch(SqlSession session, UserVO userName) {
		UserVO user 
		= session.selectOne("UserMapper.memberIdSearch", userName);
		return user;
		
	}
	//마이_댓글관리

	@Override
	public List<CommentVO> selectCommentList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<CommentVO> uList = session.selectList("UserMapper.selectCommentList", null, rowBounds);
		return uList;
	}

	//전체 게시물 갯수
	@Override
	public int selectTotalCount(SqlSession session) {
		int totalCount = session.selectOne("UserMapper.selectTotalCount");
		return totalCount;
	}
	
	//[어드민]회원검색
	public List<NoticeVO> selectUsersByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<NoticeVO> searchList 
		= session.selectList("UserMapper.selectUsersByKeyword", paramMap, rowBounds);
		return searchList;		
	}

	//[어드민]페이징
	@Override
	public int selectTotalCount(SqlSession session, Map<String, String> paramMap) {
		int totalCount = session.selectOne("UserMapper.searchTotalCount",paramMap);
		return totalCount;
	}

	//[어드민]회원전체 리스트
	@Override
	public List<UserVO> selectAllUser(SqlSession session) {
		 return session.selectList("UserMapper.selectAllUser");		
	}

	//[어드민] 키워드로 회원검색
	@Override
	public List<UserVO> searchUsersByKeyword(SqlSession session, Map<String, String> paramMap) {
		return session.selectList("UserMapper.selectUsersByKeyword", paramMap);
	}
	
	//[어드민]전체 회원 선택
	@Override
	public List<UserVO> selectUserList(SqlSession session, PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<UserVO> uList 
		= session.selectList("UserMapper.selectAllUser", null, rowBounds);
		return uList;
	}

	

	    
	
	
	

}
