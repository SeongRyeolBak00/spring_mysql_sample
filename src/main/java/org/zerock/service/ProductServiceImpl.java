package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CateVO;
import org.zerock.domain.ProductVO;
import org.zerock.domain.ReplyVO;
import org.zerock.mapper.AdminMapper;
import org.zerock.mapper.AttachMapper;
import org.zerock.mapper.ProductMapper;

import lombok.extern.log4j.Log4j;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private AttachMapper attachMapper;
	
	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList(int cateCode) {
		return productMapper.cateList();
	}
	/* 상품 목록 */
	@Transactional
	@Override
	public List<ProductVO> productList(int cateCode) {
//		ProductVO product=new ProductVO();
		List<ProductVO> result= productMapper.productList(cateCode);
		for (ProductVO product : result) {
			product.setImageList(attachMapper.getAttachList(product.getProductCode()));
		}
		return result;
	}
	/* 상품 조회 */
	@Override
	public ProductVO productView(int productCode) {
		return productMapper.productView(productCode);
	}
	/* 리뷰  작성 */
	@Override
	public void replyRegister(ReplyVO reply) {
		productMapper.replyRegister(reply);
	}
	/* 카테고리 리스트 */
	@Override
	public List<ReplyVO> replyList(int productCode) {
		return productMapper.replyList(productCode);
	}
}
