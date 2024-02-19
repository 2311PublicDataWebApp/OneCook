package kr.co.onecook.user.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.service.UserService;
import kr.co.onecook.user.store.UserStore;

@Service
public class UserServiceImpl implements UserService{
	//스토어연결
	@Autowired
	private UserStore uStore;
	//session연결
	@Autowired
	private SqlSession session;
	
	
	@Override
	public UserVO checkUserLogin(UserVO user) {
		UserVO uOne = uStore.checkUserLogin(session, user);
		return uOne;
	}
	
	@Override
	public int insertMember(UserVO user) {
		int result = uStore.insertMember(session, user);
		return result;
	}

	@Override
	public UserVO getOneById(String userId) {
		UserVO user = uStore.selectOneById(session, userId);
		return user;
	}

	@Override
	public int updateMember(UserVO user) {
		int result = uStore.updateMember(session, user);
		return result;
	}
}
