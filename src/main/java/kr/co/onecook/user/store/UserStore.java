package kr.co.onecook.user.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.user.domain.UserVO;

public interface UserStore {

	/**
	 * 회원 로그인 Store
	 * @param session
	 * @param user
	 * @return uOne
	 */
	UserVO checkUserLogin(SqlSession session, UserVO user);

}
