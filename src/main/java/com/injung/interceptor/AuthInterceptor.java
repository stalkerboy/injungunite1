package com.injung.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.injung.vo.UserVO;



public class AuthInterceptor extends HandlerInterceptorAdapter{	

	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler ) throws Exception {
		HttpSession session = request.getSession();
		if( session == null ) { //로그인 안함
			response.sendRedirect( "/" );
			return false;
		}
		
		UserVO authUser = (UserVO)session.getAttribute( "authUser" );
		if( authUser == null ) { //로그인 안함
			response.sendRedirect( "/" );
			return false;
		}
		return true;
	}
}
