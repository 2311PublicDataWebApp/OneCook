package kr.co.onecook.user.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.user.domain.UserVO;

public interface UserStore {

	/**
	 * 회원 로그인 Store
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
	 * 회원 아이디 검색 Store
	 * @param session
	 * @param userId
	 * @return uOne
	 */
	UserVO selectOneById(SqlSession session, String userId);
}
