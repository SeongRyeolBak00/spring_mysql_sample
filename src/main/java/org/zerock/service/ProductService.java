package org.zerock.service;

import java.util.List;

import org.zerock.domain.CateVO;
import org.zerock.domain.ProductVO;


public interface ProductService {
	/* 카테고리 리스트 */
	public List<CateVO> cateList(int cateCode);
	/* 상품 목록*/
	public List<ProductVO> productList(int cateCode);
	/* 상품 조회*/
	public ProductVO productView(int productCode);	
}
