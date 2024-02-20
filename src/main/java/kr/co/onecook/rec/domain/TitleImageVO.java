package kr.co.onecook.rec.domain;

public class TitleImageVO {
	private int imageNo;
	private int recipeNumber;
	private String imageTitle;
	private String imageRename;
	private String imageFilePath;
	private long imageFileLength;
	
	public TitleImageVO() {}
	
	

	public TitleImageVO(int imageNo, int recipeNumber, String imageTitle, String imageRename, String imageFilePath,
			long imageFileLength) {
		super();
		this.imageNo = imageNo;
		this.recipeNumber = recipeNumber;
		this.imageTitle = imageTitle;
		this.imageRename = imageRename;
		this.imageFilePath = imageFilePath;
		this.imageFileLength = imageFileLength;
	}



	//
	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public int getRecipeNumber() {
		return recipeNumber;
	}

	public void setRecipeNumber(int recipeNumber) {
		this.recipeNumber = recipeNumber;
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
		return "TitleImageVO [imageNo=" + imageNo + ", recipeNumber=" + recipeNumber + ", imageTitle=" + imageTitle
				+ ", imageRename=" + imageRename + ", imageFilePath=" + imageFilePath + ", imageFileLength="
				+ imageFileLength + "]";
	}

	
	
}
