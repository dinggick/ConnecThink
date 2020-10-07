package com.connecthink.listener;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.context.ApplicationContext;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.connecthink.handler.headerWebSocketHandler;

public class CustomHttpSessionEventPublisher extends HttpSessionEventPublisher {
	
	@Override
	public void sessionCreated(HttpSessionEvent event) {
		super.sessionCreated(event);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		super.sessionDestroyed(event);
		
		System.out.println("sessionDestroyed 실행~~~~");
		
		//HttpSession 객체 가져오기
		HttpSession session = event.getSession();
		
		//ServletRequestAttributes 객체 가져오기
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		//HttpServletRequest 객체 가져오기
		HttpServletRequest request = attr.getRequest();
		
		//DispatcherServlet으로 로딩된 context 가져오기
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext(), "org.springframework.web.servlet.FrameworkServlet.CONTEXT.connecthink");

		//Spring Bean 가져오기
		headerWebSocketHandler hwsHandler = (headerWebSocketHandler)ac.getBean("headerWebSocketHandler",headerWebSocketHandler.class);
		
		//사라질 session에서 로그아웃 할 유저 정보 가져오기
		Integer loginedCustomer = (Integer)session.getAttribute("loginInfo");

		//헤더웹소켓 핸들러의 pmMap에 해당 유저의 정보가 남아있다면 지우기
		if(hwsHandler.getPmMap().containsKey(loginedCustomer)) {
			hwsHandler.getPmMap().remove(loginedCustomer);
			System.out.println("★pmMap에서 회원 삭제 완료★");
		}
		//헤더웹소켓 핸들러의 notiMap에 해당 유저의 정보가 남아있다면 지우기
		if(hwsHandler.getNotiMap().containsKey(loginedCustomer)) {
			hwsHandler.getNotiMap().remove(loginedCustomer);
			System.out.println("★notiMap에서 회원 삭제 완료★");
		}
		
	}
	
}
