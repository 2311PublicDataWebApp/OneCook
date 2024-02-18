package kr.co.onecook.user.domain;

import java.sql.Date;

public class UserVO {
	
	private String userId;
	private String userPw;	
	private String userName;
	private String userEmail;
	private String userNick;
	private String userPhone;
	private String userAddress;
	private Date userDate;
	private String adminYn;
	
	public UserVO() {}

		

	// 유저 로그인용 생성자
	public UserVO(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}
	
	// 관리자 여부 확인 메서드
	public boolean isAdmin() {
	    return "Y".equals(adminYn); // 관리자 여부를 'Y'로 표시하면 true를 반환
	}


	

	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}



	public String getUserPw() {
		return userPw;
	}



	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getUserEmail() {
		return userEmail;
	}



	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}



	public String getUserNick() {
		return userNick;
	}



	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}



	public String getUserPhone() {
		return userPhone;
	}



	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}



	public String getUserAddress() {
		return userAddress;
	}



	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}



	public Date getUserDate() {
		return userDate;
	}



	public void setUserDate(Date userDate) {
		this.userDate = userDate;
	}



	public String getAdminYn() {
		return adminYn;
	}



	public void setAdminYn(String adminYn) {
		this.adminYn = adminYn;
	}



	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail=" + userEmail
				+ ", userNick=" + userNick + ", userPhone=" + userPhone + ", userAddress=" + userAddress + ", userDate="
				+ userDate + ", adminYn=" + adminYn + "]";
	}

	
	

	
	
	
}
