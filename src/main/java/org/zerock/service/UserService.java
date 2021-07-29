package org.zerock.service;

import org.zerock.domain.UserVO;


public interface UserService {

	/* 회원가입 */
	public void userJoin(UserVO user) throws Exception;
	
	/* 아이디 중복 검사 */
	public int idCheck(String userId) throws Exception;
	
	/* 로그인 */
	public UserVO userLogin(UserVO user) throws Exception;
	
	/* 회원상세*/
	public UserVO userDetail(String userId) throws Exception;
	
	/* 회원정보 수정*/
	public void userUpdate(UserVO user) throws Exception;
	
	/* 회원 탈퇴*/
	public int userDelete(String userId) throws Exception;

}
