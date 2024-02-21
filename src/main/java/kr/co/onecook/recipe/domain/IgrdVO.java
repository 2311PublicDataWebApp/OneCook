package kr.co.onecook.recipe.domain;

public class IgrdVO {
	private int igrdNum;
	private int recipeNumber;
	private String igrdName;
	private String igrdUnit;
	
	public IgrdVO() {}

	public int getIgrdNum() {
		return igrdNum;
	}

	public void setIgrdNum(int igrdNum) {
		this.igrdNum = igrdNum;
	}

	public int getRecipeNumber() {
		return recipeNumber;
	}

	public void setRecipeNumber(int recipeNumber) {
		this.recipeNumber = recipeNumber;
	}

	public String getIgrdName() {
		return igrdName;
	}

	public void setIgrdName(String igrdName) {
		this.igrdName = igrdName;
	}

	public String getIgrdUnit() {
		return igrdUnit;
	}

	public void setIgrdUnit(String igrdUnit) {
		this.igrdUnit = igrdUnit;
	}

	@Override
	public String toString() {
		return "IgrdVO [igrdNum=" + igrdNum + ", recipeNumber=" + recipeNumber + ", igrdName=" + igrdName
				+ ", igrdUnit=" + igrdUnit + "]";
	}
}
