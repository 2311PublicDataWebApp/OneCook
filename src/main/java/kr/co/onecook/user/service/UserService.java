package kr.co.onecook.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.onecook.notice.domain.NoticeVO;
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
	 * 검색 게시물 전체 갯수
	 * @param pInfo
	 * @param paramMap
	 * @return List
	 */
	List<NoticeVO> searchUsersByKeyword(PageInfo pInfo, Map<String, String> paramMap);

	/**
	 * 검색 게시물 전체 갯수
	 * @param paramMap
	 * @return
	 */
	int getTotalCount(Map<String, String> paramMap);

	
	/**
	 * 회원 조회
	 * @return
	 */
	List<UserVO> getAllUsers(); // 모든 회원 정보 조회
	List<UserVO> searchUsersByKeyword(String searchCondition, String searchKeyword); // 특정 조건에 따른 회원 검색
	List<UserVO> selectUserList(PageInfo pInfo);
	
}
