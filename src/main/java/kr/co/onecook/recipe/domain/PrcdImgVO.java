package kr.co.onecook.recipe.domain;

public class PrcdImgVO {
	private int fileNo;
	private int recipeNumber;
	private int cookPrcd;
	private String fileName;
	private String fileRename;
	private String filePath;
	private long fileLength;

	public PrcdImgVO() {
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public int getRecipeNumber() {
		return recipeNumber;
	}

	public void setRecipeNumber(int recipeNumber) {
		this.recipeNumber = recipeNumber;
	}

	public int getCookPrcd() {
		return cookPrcd;
	}

	public void setCookPrcd(int cookPrcd) {
		this.cookPrcd = cookPrcd;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRename() {
		return fileRename;
	}

	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public long getFileLength() {
		return fileLength;
	}

	public void setFileLength(long fileLength) {
		this.fileLength = fileLength;
	}

	@Override
	public String toString() {
		return "PrcdImgVO [fileNo=" + fileNo + ", recipeNumber=" + recipeNumber + ", cookPrcd=" + cookPrcd
				+ ", fileName=" + fileName + ", fileRename=" + fileRename + ", filePath=" + filePath + ", fileLength="
				+ fileLength + "]";
	}
}
