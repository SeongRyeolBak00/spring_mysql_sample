package org.zerock.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.AttachImageVO;
import org.zerock.domain.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTests {

	@Autowired
	private AdminService service;
	/* 상품 등록 & 상품 이미지 등록 테스트 */
	@Test
	public void productRegisterTests() {

		ProductVO product = new ProductVO();
		// 상품 정보
		product.setProductName("나주 배");
		product.setCateCode(1);
		product.setProductPrice(20000);
		product.setStock(300);
		product.setContents("책 목차 ");
		// 이미지 정보
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>(); 
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1311");
		image2.setFileName("test Image 2");
		image2.setUploadPath("test image 2");
		image2.setUuid("test232");
		imageList.add(image1);
		imageList.add(image2);
		
		product.setImageList(imageList);
		service.productRegister(product);
		System.out.println("등록된 VO : " + product);
	}
}
