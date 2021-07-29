package org.zerock.mapper;

import org.zerock.domain.UserVO;

public interface UserMapper {

	/* 회원가입 */
	public void userJoin(UserVO user);

	/* 아이디 중복 검사 */
	public int idCheck(String UserId);
	
	/* 로그인 */
	public UserVO userLogin(UserVO user);
	
	/* 회원 상세 */
	public UserVO userDetail(String userId);
	
	/* 회원 정보 수정*/
	public void userUpdate(UserVO user);
	
	/* 회원 탈퇴*/
	public int userDelete(String userId);
}
