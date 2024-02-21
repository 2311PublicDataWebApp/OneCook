package kr.co.onecook.user.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.notice.domain.NoticeVO;
import kr.co.onecook.user.domain.PageInfo;
import kr.co.onecook.user.domain.UserVO;

public interface UserStore {

	/**
	 * 회원 로그인 Store
	 * @param session
	 * @param user
	 * @return uOne
	 */
	UserVO checkUserLogin(SqlSession session, UserVO user);

	/**
	 * 회원 정보 등록 Store
	 * @param session
	 * @param user
	 * @return result
	 */
	
	int insertMember(SqlSession session, UserVO user);
	/**
	 * 회원 정보 수정 Store
	 * @param session
	 * @param user
	 * @return result
	 */
	int updateMember(SqlSession session, UserVO user);
	
	/**
	 * 회원 정보 검색(by ID) Store
	 * @param session
	 * @param userId
	 * @return uOne
	 */
	UserVO selectOneById(SqlSession session, String userId);

	/**
	 * 회원 정보 삭제 Store
	 * @param session
	 * @param userId
	 * @return result
	 */
	int deleteMember(SqlSession session, String userId);

	
	/**
	 * 회원 정보 검색(by PW) 스토어
	 * @param session
	 * @param userPw
	 * @return
	 */
	UserVO selectOneByPw(SqlSession session, String userPw);
	/**
	 * 회원 정보 검색(by Id) 스토어
	 * @param session
	 * @param userName
	 * @return
	 */
	
	UserVO memberIdSearch(SqlSession session, UserVO userName);

	List<NoticeVO> selectUsersByKeyword(SqlSession session, PageInfo pInfo, Map<String, String> paramMap);

	int selectTotalCount(SqlSession session, Map<String, String> paramMap);







}
