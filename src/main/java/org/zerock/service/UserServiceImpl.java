package org.zerock.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;


@Service
public class UserServiceImpl implements UserService {
	@Inject
	@Autowired
	UserMapper usermapper;

	/* 회원가입 */
	@Override
	public void userJoin(UserVO user) throws Exception {
		usermapper.userJoin(user);
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String userId) throws Exception {
		return usermapper.idCheck(userId);
	}

	/* 로그인 */
	@Override
	public UserVO userLogin(UserVO user) throws Exception {
		return usermapper.userLogin(user);
	}
	
	/*회원 상세*/
	@Override
	public UserVO userDetail(String userId) throws Exception{
		return usermapper.userDetail(userId);
	}
	
	/* 회원 정보 수정*/
	@Override
	public void userUpdate(UserVO user) throws Exception{
		usermapper.userUpdate(user);
	}
	
	/* 회원 탈퇴*/
	@Override
	public int userDelete(String userId) throws Exception {
		return usermapper.userDelete(userId);
	}
}
