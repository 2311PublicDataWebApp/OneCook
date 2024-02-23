package kr.co.onecook.user.domain;

import java.util.Date;

public class CommentVO {
		private int commentNo;
		private String commentContent;
		private Date commentDate;
	

		public CommentVO() {
		}


		public int getCommentNo() {
			return commentNo;
		}


		public void setCommentNo(int commentNo) {
			this.commentNo = commentNo;
		}


		public String getCommentContent() {
			return commentContent;
		}


		public void setCommentContent(String commentContent) {
			this.commentContent = commentContent;
		}


		public Date getCommentDate() {
			return commentDate;
		}


		public void setCommentDate(Date commentDate) {
			this.commentDate = commentDate;
		}


		@Override
		public String toString() {
			return "CommentVO [commentNo=" + commentNo + ", commentContent=" + commentContent + ", commentDate="
					+ commentDate + ", getCommentNo()=" + getCommentNo() + ", getCommentContent()="
					+ getCommentContent() + ", getCommentDate()=" + getCommentDate() + ", getClass()=" + getClass()
					+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
		}


}
