package kr.co.onecook.recipe.domain;

public class TitleImageVO {
	private int imageNo;
	private int recipeNo;
	private String imageTitle;
	private String imageRename;
	private String imageFilePath;
	private long imageFileLength;
	
	public TitleImageVO() {
		
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getRecipeNo() {
		return recipeNo;
	}

	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}

	public String getImageTitle() {
		return imageTitle;
	}

	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}

	public String getImageRename() {
		return imageRename;
	}

	public void setImageRename(String imageRename) {
		this.imageRename = imageRename;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath(String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}

	public long getImageFileLength() {
		return imageFileLength;
	}

	public void setImageFileLength(long imageFileLength) {
		this.imageFileLength = imageFileLength;
	}

	@Override
	public String toString() {
		return "TitleImageVO [imageNo=" + imageNo + ", recipeNo=" + recipeNo + ", imageTitle=" + imageTitle
				+ ", imageRename=" + imageRename + ", imageFilePath=" + imageFilePath + ", imageFileLength="
				+ imageFileLength + "]";
	}

}
