package com.connecthink.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
//	@Autowired
//	private CustomerService service;
//	
	@RequestMapping("/board")
	void board(HttpServletRequest req) {
		
		//Http session 에 저장할 userid 대체용
        char cValue = 'a';
        for(int i = 0; i < 100; i++) {
            double dValue = Math.random();
            cValue = (char)((dValue * 26) + 65);             
        }
        
        HttpSession session = req.getSession();        
        session.setAttribute("LoginInfo",String.valueOf(cValue));
	}
}
