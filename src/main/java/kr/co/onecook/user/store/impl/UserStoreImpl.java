package kr.co.onecook.user.store.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.onecook.user.domain.UserVO;
import kr.co.onecook.user.store.UserStore;

@Repository // 누락주의 !
public class UserStoreImpl implements UserStore {

	//로그인
	@Override
	public UserVO checkUserLogin(SqlSession session, UserVO user) {
		UserVO uOne = session.selectOne("UserMapper.checkMemberLogin",user);
		return uOne;
	}
	
	//회원가입
	@Override
	public int insertMember(SqlSession session, UserVO user) {
		int result = session.insert("UserMapper.insertMember", user);
		return result;
	}
	
	//회원검색
	@Override
	public UserVO selectOneById(SqlSession session, String userId) {
		UserVO user 
		= session.selectOne("UserMapper.selectOneById", userId);
		return user;
	}
	//회원수정
	@Override
	public int updateMember(SqlSession session, UserVO user) {
		int result = session.update("UserMapper.updateMember", user);
		return result;
	}

}
