package kr.co.onecook.user.service;

import kr.co.onecook.user.domain.UserVO;

public interface UserService {

	/**
	 * 관리자 로그인 Service
	 * @param user
	 * @return
	 */
	UserVO checkAdminLogin(UserVO user);

}
