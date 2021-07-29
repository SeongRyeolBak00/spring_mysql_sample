package org.zerock.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController  {
	@Autowired
	private UserService service;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	//회원가입 페이지 이동
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinGET() {
		log.info("join page");		
	}
	//회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinPOST(UserVO user,RedirectAttributes rttr) throws Exception {
		log.info("register: "+user);
		String rawPw = "";			// 인코딩 전 비밀번호
		String encodePw = "";		// 인코딩 후 비밀번호
		
		rawPw = user.getUserPw();			// 비밀번호 데이터 얻음
		encodePw = pwEncoder.encode(rawPw);		// 비밀번호 인코딩
		user.setUserPw(encodePw);			// 인코딩된 비밀번호 user객체에 다시 저장
		service.userJoin(user);
		//rttr.addFlashAttribute("result", user.getUserId());
		return "redirect:/main";
	}
		
	
	//로그인 페이지 이동
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public void loginGET() {
		log.info("login page");		
	}
	
	// 아이디 중복 검사
	@RequestMapping(value = "/userIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String userIdChk(@RequestParam("userId") String userId) throws Exception{
		int result=service.idCheck(userId);
		//log.info("결과값: "+result);
		if(result !=0) {
			return "fail";
		}
		else {
			return "success"; //중복아이디x
		}	
	} 
	// Email check
	@RequestMapping(value="/mailCheck", method=RequestMethod.GET)
	@ResponseBody
	public String mailCheck(@RequestParam("email") String email) throws Exception{
		log.info("email data check");
		log.info("인증번호: "+email);
		/* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        log.info("인증번호: "+checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "PPAS <gkzb01@naver.com>";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "PPAS 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요."+
        		"감사합니다."+
        		"<br>" + 
        		"<img src=\"https://t1.daumcdn.net/cfile/tistory/214DCD42594CC40625\">";
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }

        String num=Integer.toString(checkNum);
        return num;
	} 
//	@PostMapping
//	public String login(UserVO user,RedirectAttributes rttr) {
//		
//		log.info("register: "+user);
//		//service.join(user);
//		//rttr.addFlashAttribute("result", user.getUserid());
//		return "redirect:/list";
//	}
	/* 로그인 */
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO user, RedirectAttributes rttr) throws Exception{	
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		UserVO lvo = service.userLogin(user);	// 제출한아이디와 일치하는 아이디 있는지 
		
		if(lvo != null) {			// 일치하는 아이디 존재시
			rawPw = user.getUserPw();		// 사용자가 제출한 비밀번호
			encodePw = lvo.getUserPw();		// 데이터베이스에 저장한 인코딩된 비밀번호
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {		// 비밀번호 일치여부 판단
				
				lvo.setUserPw("");					// 인코딩된 비밀번호 정보 지움
				session.setAttribute("user", lvo); 	// session에 사용자의 정보 저장
				return "redirect:/main";		// 메인페이지 이동
			} else {
				rttr.addFlashAttribute("result", 0);			
				return "redirect:/user/login";	// 로그인 페이지로 이동	
			}
		} else {					// 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			rttr.addFlashAttribute("result", 0);			
			return "redirect:/user/login";	// 로그인 페이지로 이동
		}	
	}
	
	/* 메인페이지 로그아웃 */
    @RequestMapping(value="logout.do", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();      
        session.invalidate();      
        return "redirect:/main";        
        
    }	
	
	/* 비동기방식 로그아웃 메서드 */
    @RequestMapping(value="logout.do", method=RequestMethod.POST)
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws Exception{
    	
    	HttpSession session = request.getSession();	
    	session.invalidate();
    	
    }
    
    //회원찾기 페이지 이동
  		@RequestMapping(value="/userfind", method=RequestMethod.GET)
  		public void userFindGET() {
  			log.info("회원찾기 페이지");
  		}
  		

  		
  	//회원정보, 회원정보수정 페이지 이동
  		@RequestMapping(value={"/userinfo", "/usermodify"}, method=RequestMethod.GET)
  		public void userModifyGET(HttpSession session, Model model, String userId) throws Exception {	
  			model.addAttribute("userInfo", service.userDetail(userId));
  			
  		}	
  	//회원정보수정 
  		@RequestMapping(value="usermodify.do", method=RequestMethod.POST)
  		public String userModifyPOST(UserVO user, HttpSession session) throws Exception {				
  			
  			
  			service.userUpdate(user);
  			session.invalidate();
  			return "redirect:/main";
  		}	
  	//회원탈퇴 페이지 이동
  		@RequestMapping(value="/userdelete", method=RequestMethod.GET)
  		public void userDeleteGET() {					
  			log.info("회원탈퇴 페이지");					
  		}
  	//회원탈퇴 
  		@RequestMapping(value="/userdelete", method=RequestMethod.POST)
  		public String userDeletePOST(HttpSession session, String userId, RedirectAttributes rttr) {
  			
  			log.info("authorDeletePOST..........");
  			int result = 0;
  			try {
  				result = service.userDelete(userId);
  				session.invalidate();
  			} catch (Exception e) {
  				e.printStackTrace();
  				result = 2;
  				rttr.addFlashAttribute("delete_result", result);
  				return "redirect:/user/userdelete";
  			}
  			rttr.addFlashAttribute("delete_result", result);
  			return "redirect:/main";
  		}
}
