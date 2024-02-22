package kr.co.onecook.cs.domain;

public class CsVO {
	private int questionNo;
	private String userId;
	private String userName;
	private String questionWriter;
	private String questionTitle;
	private String questionPhone;
	private String questionEmail;
	private String questionContent;
	private String questionDate;
	private String questionCategory;
	private String questionStatus;
	
	public CsVO() {};
	
	//getters&setters
	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getQuestionWriter() {
		return questionWriter;
	}

	public void setQuestionWriter(String questionWriter) {
		this.questionWriter = questionWriter;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionPhone() {
		return questionPhone;
	}

	public void setQuestionPhone(String questionPhone) {
		this.questionPhone = questionPhone;
	}

	public String getQuestionEmail() {
		return questionEmail;
	}

	public void setQuestionEmail(String questionEmail) {
		this.questionEmail = questionEmail;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}

	public String getQuestionCategory() {
		return questionCategory;
	}

	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}

	public String getQuestionStatus() {
		return questionStatus;
	}

	public void setQuestionStatus(String questionStatus) {
		this.questionStatus = questionStatus;
	}


	//toString
	@Override
	public String toString() {
		return "CsVO [questionNo=" + questionNo + ", userId=" + userId + ", userName=" + userName + ", questionWriter="
				+ questionWriter + ", questionTitle=" + questionTitle + ", questionPhone=" + questionPhone
				+ ", questionEmail=" + questionEmail + ", questionContent=" + questionContent + ", questionDate="
				+ questionDate + ", questionCategory=" + questionCategory + ", questionStatus=" + questionStatus + "]";
	}
	
	
	
 }
