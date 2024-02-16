package kr.co.onecook.user.service;

import org.springframework.stereotype.Service;

import kr.co.onecook.user.domain.UserVO;

@Service
public interface UserService {

	
		
	/**
	 * 로그인 Service
	 * @param user
	 * @return user
	 */
	UserVO checkUserLogin(UserVO user);

}
