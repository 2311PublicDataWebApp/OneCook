package kr.co.onecook.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;
import kr.co.onecook.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserStore uStore;
	@Autowired
	private SqlSession session;

	// 유저 로그인
	@Override
	public UserVO checkUserLogin(UserVO user) {
		UserVO uOne = uStore.checkUserLogin(session, user);
		return uOne;
	}

}
