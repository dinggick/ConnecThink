package com.connecthink.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.connecthink.security.CustomUser;
import com.connecthink.security.CustomUserDetailsService;

public class CustomLogoutSuccessHandler implements LogoutSuccessHandler {
	@Autowired
	private CustomUserDetailsService userDetailService;
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		//userDetailService에서 가지고 있는 로그인 정보를 삭제
		userDetailService.getLoginInfos().remove(((CustomUser)authentication.getPrincipal()).getCustomer().getCustomerNo());
	}

}
