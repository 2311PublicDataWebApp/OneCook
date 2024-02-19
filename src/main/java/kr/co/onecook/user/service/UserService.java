package kr.co.onecook.user.service;

import org.springframework.stereotype.Service;

import kr.co.onecook.user.domain.UserVO;

@Service
public interface UserService {

	/**
	 * 회원 정보 등록 Service
	 * @param user
	 * @return result
	 */
	int insertMember(UserVO user);
	
	/**
	 * 로그인 Service
	 * @param user
	 * @return user
	 */
	UserVO checkUserLogin(UserVO user);
	
	/**
	 * 회원 정보 수정 Service
	 * @param user
	 * @return result
	 */
	int updateMember(UserVO user);

	/**
	 * 회원 아이디 검색 Service
	 * @param userId
	 * @return uOne
	 */
	UserVO getOneById(String userId);

}
