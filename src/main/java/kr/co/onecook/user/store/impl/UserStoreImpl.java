package kr.co.onecook.user.store.impl;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.store.UserStore;

public class UserStoreImpl implements UserStore {

	@Override
	public UserVO checkAdminLogin(SqlSession session, UserVO user) {
		UserVO uOne = session.selectOne("UserMapper.checkUserLogin", user);
		return uOne;
	}

	@Override
	public UserVO checkUserLogin(SqlSession session, UserVO user) {
		UserVO uOne = session.selectOne("UserMapper.checkUserLogin", user);
		return uOne;
	}
	
}
