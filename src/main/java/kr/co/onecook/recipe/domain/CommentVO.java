package kr.co.onecook.recipe.domain;

import java.sql.Date;

public class CommentVO {
	private int commentNo;
	private int recipeNumber;
	private String userId;
	private String commentWriter;
	private String commentContent;
	private Date commentDate;
	private int recipeScore;
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getRecipeNumber() {
		return recipeNumber;
	}
	public void setRecipeNumber(int recipeNumber) {
		this.recipeNumber = recipeNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentWriter() {
		return commentWriter;
	}
	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
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
	public int getRecipeScore() {
		return recipeScore;
	}
	public void setRecipeScore(int recipeScore) {
		this.recipeScore = recipeScore;
	}
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", recipeNumber=" + recipeNumber + ", userId=" + userId
				+ ", commentWriter=" + commentWriter + ", commentContent=" + commentContent + ", commentDate="
				+ commentDate + ", recipeScore=" + recipeScore + "]";
	}


}
