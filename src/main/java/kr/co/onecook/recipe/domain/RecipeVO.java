package kr.co.onecook.recipe.domain;

import java.sql.Date;

public class RecipeVO {
	private int recipeNumber;
	private String recipeName;
	private String recipeDetail;
	private String recipeCategory;
	private String recipeTime;
	private Date recipeDate;
	private int recipeCount;
	
	public RecipeVO() {
		
	}
	
	public RecipeVO(int recipeNumber, String recipeName, String recipeDetail, String recipeCategory, String recipeTime,
			Date recipeDate, int recipeCount) {
		super();
		this.recipeNumber = recipeNumber;
		this.recipeName = recipeName;
		this.recipeDetail = recipeDetail;
		this.recipeCategory = recipeCategory;
		this.recipeTime = recipeTime;
		this.recipeDate = recipeDate;
		this.recipeCount = recipeCount;
	}

	public int getRecipeNumber() {
		return recipeNumber;
	}
	public void setRecipeNumber(int recipeNumber) {
		this.recipeNumber = recipeNumber;
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
	@Override
	public String toString() {
		return "RecipeVO [recipeNumber=" + recipeNumber + ", recipeName=" + recipeName + ", recipeDetail="
				+ recipeDetail + ", recipeCategory=" + recipeCategory + ", recipeTime=" + recipeTime + ", recipeDate="
				+ recipeDate + ", recipeCount=" + recipeCount + "]";
	}
	
	
}