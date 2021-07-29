package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AttachImageVO;
import org.zerock.domain.ProductVO;

import lombok.extern.log4j.Log4j;
@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {

	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
	//@Test
	public void productRegisterTest() throws Exception{
		
		ProductVO product = new ProductVO();
		
		product.setProductName("빨간 자두");
		product.setCateCode(1);
		product.setContents("노란색");
		product.setProductPrice(20200);
		product.setStock(100);
		System.out.println("Before BookVO :" + product);
		
		mapper.productRegister(product);
		System.out.println("After BookVO :" + product);
	}
	/* 카테고리 리스트 */
	//@Test
	public void cateListTest() throws Exception{
		System.out.println("cateList()..........." + mapper.cateList());
	}
	
	/* 상품 리스트 & 상품 총 개수*/
	//@Test
	public void productListTests() {
		// 상품 리스트 
		mapper.productList().forEach(product -> log.info(product));
	}
	/* 상품 조회 페이지 */
	//@Test
	public void productViewTest() {
		int productCode = 10;
		ProductVO result = mapper.productView(productCode);
		System.out.println("상품 결과 : " + result);
		
	}
	/* 상품 정보 수정 */
	//@Test
	public void productModifyTest() {
		ProductVO product = new ProductVO();
		
		product.setProductCode(11);
		product.setProductName("멜론");
		product.setCateCode(1);
		product.setProductPrice(20000);
		product.setContents("what?");
		product.setStock(80);
		
		mapper.productModify(product);
	}
	/* 상품 정보 삭제 */
	//@Test
	public void productDeleteTest() {
		int productCode = 16;
		int result = mapper.productDelete(productCode);
		if(result == 1) {
			System.out.println("삭제 성공");
		}
	}
	/* 이미지 등록 */
	//@Test
	public void imageEnrollTest() {
		AttachImageVO image = new AttachImageVO();
		image.setProductCode(5);
		image.setFileName("test");
		image.setUploadPath("test");
		image.setUuid("test2");
		mapper.imageEnroll(image);
	}
	/* 지정 상품 이미지 삭제 */
	@Test
	public void deleteImageAllTest() {
		int productCode = 28;
		mapper.deleteImageAll(productCode);
	}
	
}
