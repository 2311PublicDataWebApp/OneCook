package kr.co.onecook.recipe.domain;

public class PrcdVO {
	private int cookPrcd;
	private int recipeNumber;
	private String cookDetail;

	public PrcdVO() {
	}

	public int getCookPrcd() {
		return cookPrcd;
	}

	public void setCookPrcd(int cookPrcd) {
		this.cookPrcd = cookPrcd;
	}

	public int getRecipeNumber() {
		return recipeNumber;
	}

	public void setRecipeNumber(int recipeNumber) {
		this.recipeNumber = recipeNumber;
	}

	public String getCookDetail() {
		return cookDetail;
	}

	public void setCookDetail(String cookDetail) {
		this.cookDetail = cookDetail;
	}

	@Override
	public String toString() {
		return "PrcdVO [cookPrcd=" + cookPrcd + ", recipeNumber=" + recipeNumber + ", cookDetail=" + cookDetail + "]";
	}

}
