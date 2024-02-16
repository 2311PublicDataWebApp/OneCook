package kr.co.onecook.user.domain;

import java.sql.Date;

public class UserVO {
	private String userId;
	private String userPw;
	private String userPwre;
	private String userName;
	private String userEmail;
	private String userNick;
	private String userPhone;	
	private String userAddress;
	private Date userDate;
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
	public String getUserPwre() {
		return userPwre;
	}
	public void setUserPwre(String userPwre) {
		this.userPwre = userPwre;
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
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userPwre=" + userPwre + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userNick=" + userNick + ", userPhone=" + userPhone + ", userAddress="
				+ userAddress + ", userDate=" + userDate + "]";
	}
	
	
	
	
	
	
	
}
