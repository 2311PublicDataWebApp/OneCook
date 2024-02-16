package kr.co.onecook.rec.domain;

import java.sql.Date;

public class RecVO {
	private int RECIPE_NUMBER;
	private String USER_ID;
	private String RECIPE_NAME;
	private String RECIPE_DETAIL;
	private String RECIPE_CATEGORY;
	private String RECIPE_TIME;
	private Date RECIPE_DATE;
	private int RECIPE_COUNT;
	
	public RecVO() {}

	
	public RecVO(int rECIPE_NUMBER, String uSER_ID, String rECIPE_NAME, String rECIPE_DETAIL, String rECIPE_CATEGORY,
			String rECIPE_TIME, Date rECIPE_DATE, int rECIPE_COUNT) {
		super();
		RECIPE_NUMBER = rECIPE_NUMBER;
		USER_ID = uSER_ID;
		RECIPE_NAME = rECIPE_NAME;
		RECIPE_DETAIL = rECIPE_DETAIL;
		RECIPE_CATEGORY = rECIPE_CATEGORY;
		RECIPE_TIME = rECIPE_TIME;
		RECIPE_DATE = rECIPE_DATE;
		RECIPE_COUNT = rECIPE_COUNT;
	}


	//
	public int getRECIPE_NUMBER() {
		return RECIPE_NUMBER;
	}

	public void setRECIPE_NUMBER(int rECIPE_NUMBER) {
		RECIPE_NUMBER = rECIPE_NUMBER;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getRECIPE_NAME() {
		return RECIPE_NAME;
	}

	public void setRECIPE_NAME(String rECIPE_NAME) {
		RECIPE_NAME = rECIPE_NAME;
	}

	public String getRECIPE_DETAIL() {
		return RECIPE_DETAIL;
	}

	public void setRECIPE_DETAIL(String rECIPE_DETAIL) {
		RECIPE_DETAIL = rECIPE_DETAIL;
	}

	public String getRECIPE_CATEGORY() {
		return RECIPE_CATEGORY;
	}

	public void setRECIPE_CATEGORY(String rECIPE_CATEGORY) {
		RECIPE_CATEGORY = rECIPE_CATEGORY;
	}

	public String getRECIPE_TIME() {
		return RECIPE_TIME;
	}

	public void setRECIPE_TIME(String rECIPE_TIME) {
		RECIPE_TIME = rECIPE_TIME;
	}

	public Date getRECIPE_DATE() {
		return RECIPE_DATE;
	}

	public void setRECIPE_DATE(Date rECIPE_DATE) {
		RECIPE_DATE = rECIPE_DATE;
	}

	public int getRECIPE_COUNT() {
		return RECIPE_COUNT;
	}

	public void setRECIPE_COUNT(int rECIPE_COUNT) {
		RECIPE_COUNT = rECIPE_COUNT;
	}

	@Override
	public String toString() {
		return "RecVO [RECIPE_NUMBER=" + RECIPE_NUMBER + ", USER_ID=" + USER_ID + ", RECIPE_NAME=" + RECIPE_NAME
				+ ", RECIPE_DETAIL=" + RECIPE_DETAIL + ", RECIPE_CATEGORY=" + RECIPE_CATEGORY + ", RECIPE_TIME="
				+ RECIPE_TIME + ", RECIPE_DATE=" + RECIPE_DATE + ", RECIPE_COUNT=" + RECIPE_COUNT + "]";
	}
	
	
}



