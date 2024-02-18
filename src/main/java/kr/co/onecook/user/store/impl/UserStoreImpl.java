package kr.co.onecook.user.store.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.store.UserStore;

@Repository // 누락주의 !
public class UserStoreImpl implements UserStore {

	@Override
	public UserVO checkUserLogin(SqlSession session, UserVO user) {
		UserVO uOne = session.selectOne("UserMapper.checkUserLogin", user);
		return uOne;
	}
	
}
