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

	// 유저 로그인
	@Override
	public UserVO checkUserLogin(UserVO user) {
		UserVO uOne = uStore.checkUserLogin(session, user);
		return uOne;
	}
	
	//회원가입
	@Override
	public int insertMember(UserVO user) {
		int result = uStore.insertMember(session, user);
		return result;
	}
	
	//회원검색(ID로 검색)
	@Override
	public UserVO getOneById(String userId) {
		UserVO user = uStore.selectOneById(session, userId);
		return user;
	}
	//회원검색(PW로 검색)


	//회원수정
	@Override
	public int updateMember(UserVO user) {
		int result = uStore.updateMember(session, user);
		return result;
	}
	
	//회원탈퇴
	@Override
	public int deleteMember(String userId) {
		int result = uStore.deleteMember(session, userId);
		return result;
	}


	//Id찾기
	@Override
	public UserVO memberIdSearch(UserVO userName) {
		UserVO user = uStore.memberIdSearch(session, userName);
		return user;
	}
	

}
