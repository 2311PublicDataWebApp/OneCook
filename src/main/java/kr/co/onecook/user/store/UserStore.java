package kr.co.onecook.user.store;

import org.apache.ibatis.session.SqlSession;

import kr.co.onecook.user.domain.UserVO;

public interface UserStore {

	UserVO checkAdminLogin(SqlSession session, UserVO user);

}
