package org.zerock.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.AttachImageVO;
import org.zerock.domain.CateVO;
import org.zerock.domain.ProductVO;
import org.zerock.mapper.AttachMapper;
import org.zerock.service.AdminService;
import org.zerock.service.AttachService;
import org.zerock.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.sf.json.JSONArray;

@Controller
@RequestMapping
@Log4j
@AllArgsConstructor
public class ProductController {
	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private ProductService productService;
	@Autowired
	private AttachService attachService;
	
	//메인 페이지 이동
	@GetMapping("/main")
	public void list(Model model) {
	log.info("main page");
	//model.addAttribute("main", service.getMain());
	}
	//메인 페이지 이동
	@GetMapping("/product/shop")
	public void list1(Model model) {
		log.info("main page");
		//model.addAttribute("main", service.getMain());
	}
	/* 이미지 출력 */
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getImage(String fileName){
		log.info("fileName: " + fileName);
		File file = new File("c:\\bak\\upload\\" + fileName);
		log.info("file: " + file);
		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	/* 이미지 정보 반환 
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(@RequestParam("n") int productCode, Model model){
		log.info("getAttachList.........." + productCode);
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(productCode), HttpStatus.OK);
		model.addAttribute("result",result);
		return result;
	
	}*/
	
	/* 이미지 정보 반환 */
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int productCode){
		log.info("getAttachList.........." + productCode);
		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(productCode), HttpStatus.OK);
	}
	
	 /*  카테고리별 상품 리스트  */
	 @GetMapping("/product/list")
	 public void productList(@RequestParam("c") int cateCode, Model model) {
		log.info("get llist");
		List<ProductVO> list = productService.productList(cateCode);
	 
		model.addAttribute("list",  list);
	 }
	 /* 상품 조회 */
	 @GetMapping("/product/view")
	 public void productView(@RequestParam("n") int productCode, Model model) throws Exception {
		 log.info("get view");
		 ProductVO product = productService.productView(productCode);
		 model.addAttribute("product", product);
	}
}
