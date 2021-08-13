package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CateVO;
import org.zerock.domain.ProductVO;
import org.zerock.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper adminMapper;
	
	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		return adminMapper.cateList();
	}
	/* 상품 등록 */
	@Transactional
	@Override
	public void productRegister(ProductVO product) {
		adminMapper.productRegister(product);
		if(product.getImageList() == null || product.getImageList().size() <= 0) {
			return;
		}
		product.getImageList().forEach(attach ->{
			attach.setProductCode(product.getProductCode());
			adminMapper.imageEnroll(attach);
		});
	}
	/* 상품 목록 */
	@Override
	public List<ProductVO> productList() {
		return adminMapper.productList();
	}
	/* 상품 조회 */
	@Override
	public ProductVO productView(int productCode) {
		return adminMapper.productView(productCode);
	}
	/* 상품 수정*/
	@Transactional
	@Override
	public int productModify(ProductVO product) {
		int result = adminMapper.productModify(product);
		if(result == 1 && product.getImageList() != null && product.getImageList().size() > 0) {
			adminMapper.deleteImageAll(product.getProductCode());
			product.getImageList().forEach(attach -> {
				attach.setProductCode(product.getProductCode());
				adminMapper.imageEnroll(attach);
			});
		}
		return result;
	}
	/* 상품 삭제 */	
	@Override
	public int productDelete(int productCode) {
		adminMapper.deleteImageAll(productCode);
		return adminMapper.productDelete(productCode);
	}


}
