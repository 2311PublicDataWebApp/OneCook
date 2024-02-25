package kr.co.onecook.recipe.domain;

public class RecipeDTO {
    private RecipeVO recipeVO;
    private TitleImageVO titleVO;
    private double averageRating;
	public RecipeVO getRecipeVO() {
		return recipeVO;
	}
	public void setRecipeVO(RecipeVO recipeVO) {
		this.recipeVO = recipeVO;
	}
	public TitleImageVO getTitleVO() {
		return titleVO;
	}
	public void setTitleVO(TitleImageVO titleVO) {
		this.titleVO = titleVO;
	}
	public double getAverageRating() {
		return averageRating;
	}
	public void setAverageRating(double averageRating) {
		this.averageRating = averageRating;
	}
	@Override
	public String toString() {
		return "RecipeDTO [recipeVO=" + recipeVO + ", titleVO=" + titleVO + ", averageRating=" + averageRating + "]";
	}
}
