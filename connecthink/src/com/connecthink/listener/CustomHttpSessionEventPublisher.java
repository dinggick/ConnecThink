package com.connecthink.listener;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.FrameworkServlet;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.connecthink.handler.headerWebSocketHandler;

public class CustomHttpSessionEventPublisher extends HttpSessionEventPublisher {
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		super.sessionCreated(event);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		System.out.println("sessionDestroyed 실행~~~~");
		//HttpSession 객체 가져오기
		HttpSession session = event.getSession();
		//ServletRequestAttributes 객체 가져오기
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		//HttpServletRequest 객체 가져오기
		HttpServletRequest request = attr.getRequest();
		//DispatcherServlet으로 로딩된 context 가져오기
		WebApplicationContext wc = RequestContextUtils.findWebApplicationContext(request);
		
		System.out.println("WebApplicationContext : " + wc);
		
		//Spring Bean 가져오기
		headerWebSocketHandler hwsHandler = (headerWebSocketHandler)wc.getBean(headerWebSocketHandler.class);
		
		System.out.println("headerWebSocketHandler : " + hwsHandler);
		
		Integer loginedCustomer = (Integer)session.getAttribute("loginInfo");
		System.out.println("로그인 유저 : " + loginedCustomer);
		System.out.println("PMMAP : " + hwsHandler.getPmMap());
		if(hwsHandler.getLoginUserMap().containsKey(loginedCustomer)) {
			hwsHandler.getLoginUserMap().remove(loginedCustomer);
			System.out.println("★loginUserMap에서 회원 삭제 완료★");
		}
		if(hwsHandler.getPmMap().containsKey(loginedCustomer)) {
			hwsHandler.getPmMap().remove(loginedCustomer);
			System.out.println("★pmMap에서 회원 삭제 완료★");
		}
		if(hwsHandler.getNotiMap().containsKey(loginedCustomer)) {
			hwsHandler.getNotiMap().remove(loginedCustomer);
			System.out.println("★notiMap에서 회원 삭제 완료★");
		}
		super.sessionDestroyed(event);
	}
	
}
