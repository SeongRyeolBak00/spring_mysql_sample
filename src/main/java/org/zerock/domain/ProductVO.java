package org.zerock.domain;

import java.util.List;

public class ProductVO {
	/* 상품 id */
	private int productCode;
	
	/* 상품 이름 */
	private String productName;
	
	/* 카테고리 코드 */
	private int cateCode;
	
	/* 카테고리 코드 */
	private String cateName;
	
	/* 상품 내용 */
	private String contents;
	
	/* 상품 가격 */
	private int productPrice;
	
	/* 상품 재고 */
	private int Stock;
	
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;
	/* 경로 */
	private String uploadPath;
	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	/* 파일 이름 */
	private String fileName;

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getCateCode() {
		return cateCode;
	}

	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getStock() {
		return Stock;
	}

	public void setStock(int stock) {
		Stock = stock;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
	@Override
	public String toString() {
		return "ProductVO [productCode=" + productCode + ", productName=" + productName + ", cateCode=" + cateCode
				+ ", cateName=" + cateName + ", contents=" + contents + ", productPrice=" + productPrice + ", Stock="
				+ Stock + ", imageList=" + imageList + ", uploadPath=" + uploadPath + ", fileName=" + fileName + "]";
	}

}
