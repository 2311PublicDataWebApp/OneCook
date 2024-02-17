package kr.co.onecook.user.service;

import kr.co.onecook.user.domain.UserVO;

public interface UserService {

	/**
	 * 관리자 로그인 Service
	 * @param user
	 * @return uOne
	 */
	UserVO checkAdminLogin(UserVO user);
	
	/**
	 * 유저 로그인 Service
	 * @param user
	 * @return uOne
	 */
	UserVO checkUserLogin(UserVO user);

}
