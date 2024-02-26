package kr.co.onecook.rec.domain;

import java.sql.Date;

public class RecommendVO {
	private int recipeNumber; 
	private String userId; 
	private String recipeName; 
	private String recipeDetail; 
	private String recipeCategory; 
	private String recipeTime; 
	private Date recipeDate; 
	private int recipeCount; 
	private TitleImageVO titleImage;
	
	public RecommendVO() {}

	//
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

	public String getRecipeName() {
		return recipeName;
	}

	public void setRecipeName(String recipeName) {
		this.recipeName = recipeName;
	}

	public String getRecipeDetail() {
		return recipeDetail;
	}

	public void setRecipeDetail(String recipeDetail) {
		this.recipeDetail = recipeDetail;
	}

	public String getRecipeCategory() {
		return recipeCategory;
	}

	public void setRecipeCategory(String recipeCategory) {
		this.recipeCategory = recipeCategory;
	}

	public String getRecipeTime() {
		return recipeTime;
	}

	public void setRecipeTime(String recipeTime) {
		this.recipeTime = recipeTime;
	}

	public Date getRecipeDate() {
		return recipeDate;
	}

	public void setRecipeDate(Date recipeDate) {
		this.recipeDate = recipeDate;
	}

	public int getRecipeCount() {
		return recipeCount;
	}

	public void setRecipeCount(int recipeCount) {
		this.recipeCount = recipeCount;
	}

	public TitleImageVO getTitleImage() {
		return titleImage;
	}

	public void setTitleImage(TitleImageVO titleImage) {
		this.titleImage = titleImage;
	}

	@Override
	public String toString() {
		return "RecommendVO [recipeNumber=" + recipeNumber + ", userId=" + userId + ", recipeName=" + recipeName
				+ ", recipeDetail=" + recipeDetail + ", recipeCategory=" + recipeCategory + ", recipeTime=" + recipeTime
				+ ", recipeDate=" + recipeDate + ", recipeCount=" + recipeCount + ", titleImage=" + titleImage + "]";
	}
	
}



