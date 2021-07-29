package org.zerock.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.zerock.domain.UserVO;

public class AdminInterceptor implements HandlerInterceptor  {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO)session.getAttribute("user");
		
		  if(user == null) {
			  response.sendRedirect("/user/login");
			  return false;
		  }
		  
		  if(user.getUserAdmin() != 1) {
			  response.sendRedirect("/main");
			  return false;
		  }

		return true;	// 관리자 계정 로그인 경우(lvo != null && lvo.getAdminCk() == 1)
	}	
	
}
