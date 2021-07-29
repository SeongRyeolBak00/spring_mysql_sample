package org.zerock.domain;

public class CateVO {
	private int cateCode;
	private String cateName;
	public int getCateCode() {
		return cateCode;
	}
	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	@Override
	public String toString() {
		return "CateVO [cateCode=" + cateCode + ", cateName=" + cateName + "]";
	}
}
