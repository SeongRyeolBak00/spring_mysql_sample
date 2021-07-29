package org.zerock.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserMapperTests {

	@Autowired
	private UserMapper usermapper;	
	
	//회원가입 쿼리 테스트 메서드
//	@Test
	public void memberJoin() throws Exception{
		UserVO user = new UserVO();
		
		user.setUserId("test");			//회원 id
		user.setUserPw("test");			//회원 비밀번호
		user.setUserName("test");		//회원 이름
		user.setUserMail("test");		//회원 메일
		user.setUserPhone("test");		//회원 메일
		user.setUserAddr1("test");		//회원 우편번호
		user.setUserAddr2("test");		//회원 주소
		user.setUserAddr3("test");		//회원 상세주소
		
		usermapper.userJoin(user);			//쿼리 메서드 실행	
	}
	// 아이디 중복검사 @Test
	public void userIdChk() throws Exception{
		String id = "admin";	
		String id2 = "test123";
		usermapper.idCheck(id);
		usermapper.idCheck(id2);
	}
    /* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void userLogin() throws Exception{
        
        UserVO user = new UserVO(); 
        /* 올바른 아이디 비번 입력경우 */
        user.setUserId("test1");
        user.setUserPw("1");
        usermapper.userLogin(user);
        System.out.println("결과 값 : " + usermapper.userLogin(user));
    }	

}
