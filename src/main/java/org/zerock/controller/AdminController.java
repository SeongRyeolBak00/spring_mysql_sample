package org.zerock.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AttachImageVO;
import org.zerock.domain.CateVO;
import org.zerock.domain.ProductVO;
import org.zerock.service.AdminService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import net.sf.json.JSONArray;
@Log4j
@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	/* 관리자 메인 페이지 이동 */
	@GetMapping(value="main")
	public void adminMain() throws Exception{
		log.info("관리자 페이지 이동");
	}
	/* 상품 등록 */
	@GetMapping("/register")
	public void productRegister(Model model) throws Exception {
		log.info("등록 페이지 이동");
		
		List<CateVO> category = null;
		category = adminService.cateList();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	/* 상품 등록 */
	@PostMapping("/register")
	public String productRegister(ProductVO product, RedirectAttributes rttr) throws Exception {
		log.info("product......" + product);
		adminService.productRegister(product);
		rttr.addFlashAttribute("enroll_result", product.getProductName());
		return "redirect:/admin/list";	 
	}
	/* 상품 목록 */
	@GetMapping("/list")
	public void productList(Model model) throws Exception{
		log.info("목록 페이지 이동");
		List<ProductVO> list=adminService.productList();
		model.addAttribute("list", list);
	}
	/* 상품 조회 */
	@GetMapping({"/view","/modify"})
	public void productView(@RequestParam("n") int productCode, Model model) throws Exception {
		ProductVO product = adminService.productView(productCode);
		model.addAttribute("product", product);
		log.info(productCode);
		List<CateVO> category = null;
		category = adminService.cateList();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	/* 상품 정보 수정 */
	@PostMapping("/modify")
	public String productModify(ProductVO product, RedirectAttributes rttr) {
		log.info("ModifyPOST.........." + product);
		int result = adminService.productModify(product);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/list";		
	}
	/* 상품 정보 삭제 */
	@PostMapping("/delete")
	public String productDelete(int productCode, RedirectAttributes rttr) {
		int result = adminService.productDelete(productCode);
		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/admin/list";
	}
	/* 첨부 파일 업로드 */
	@PostMapping(value="/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxAction(MultipartFile[] uploadFile) {
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			try {
				type = Files.probeContentType(checkfile.toPath());
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(!type.startsWith("image")) {
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
		}
		String uploadFolder = "C:\\bak\\upload";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		for(MultipartFile multipartFile : uploadFile) {
			/* 이미지 정복 객채 */
			AttachImageVO vo=new AttachImageVO();
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);	
				BufferedImage bo_image = ImageIO.read(saveFile);
					double ratio = 3;
					int width = (int) (bo_image.getWidth() / ratio);
					int height = (int) (bo_image.getHeight() / ratio);					
				Thumbnails.of(saveFile)
		        .size(width, height)
		        .toFile(thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(vo);
		}
		return new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
	}
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		File file=null;
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\bak\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			file = new File(originFileName);
			file.delete();
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
