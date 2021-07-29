package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.AttachImageVO;
import org.zerock.domain.CateVO;
import org.zerock.domain.ProductVO;

public interface AdminMapper {
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	/* 상품 등록 */
	public void productRegister(ProductVO product);
	/* 상품 리스트 */
	public List<ProductVO> productList();
	/* 상품 조회  */
	public ProductVO productView(int productCode);
	/* 상품 수정 */
	public int productModify(ProductVO product);
	/* 상품 정보 삭제 */
	public int productDelete(int productCode);
	/* 이미지 등록 */
	public void imageEnroll(AttachImageVO image);
	/* 지정 상품 이미지 전체 삭제 */
	public void deleteImageAll(int productCode);
}
