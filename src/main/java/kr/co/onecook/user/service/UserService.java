package kr.co.onecook.user.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.onecook.user.domain.CommentVO;
import kr.co.onecook.user.domain.PageInfo;
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

	/**
	 * 회원 정보 삭제 Service
	 * @param userId
	 * @return result
	 */ 
	int deleteMember(String userId);


	/**
	 * ID 찾기
	 * @param user
	 * @return user
	 */
	UserVO memberIdSearch(UserVO user);

	
	/**
	 * 댓글 목록 조회 Service
	 * @param pInfo 
	 * @return List
	 */
	
	List<CommentVO> selectCommentList(PageInfo pInfo);

	/**
	 * 전체 게시물 갯수 Service
	 * @return int
	 */
	int getTotalCount();
	 
}
