package kr.co.onecook.notice.domain;

import java.sql.Date;

public class Notice {
	
	private int noticeNo;
	private String noticeSubject;
	private String noticeContent;
	private String noticeWriter;
	private Date noticeDate;
	
	public Notice() {}
	
	public Notice(int noticeNo, String noticeSubject, String noticeContent, String noticeWriter, Date noticeDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeSubject = noticeSubject;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeDate = noticeDate;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeSubject() {
		return noticeSubject;
	}

	public void setNoticeSubject(String noticeSubject) {
		this.noticeSubject = noticeSubject;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeSubject=" + noticeSubject + ", noticeContent=" + noticeContent
				+ ", noticeWriter=" + noticeWriter + ", noticeDate=" + noticeDate + "]";
	}
	
	
	
}
