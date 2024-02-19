package kr.co.onecook.recipe.domain;

public class IgrdVO {
	private int igrdNum;
	private String igrdName;
	private String igrdUnit;
	
	public IgrdVO() {}
	
	public int getIgrdNum() {
		return igrdNum;
	}
	public void setIgrdNum(int igrdNum) {
		this.igrdNum = igrdNum;
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
		return "IgrdVO [igrdNum=" + igrdNum + ", igrdName=" + igrdName + ", igrdUnit=" + igrdUnit + "]";
	}	
}
