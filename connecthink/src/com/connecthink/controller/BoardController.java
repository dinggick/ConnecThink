package com.connecthink.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Task;
import com.connecthink.repository.TaskRepository;
import com.connecthink.service.BoardService;

@Controller
public class BoardController {
//	@Autowired
//	private CustomerService service;
//	
	
	@Autowired
	private BoardService service;
	
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
	
	@RequestMapping("/board/addTask")
	public void insert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("loginInfo");
		
		Integer status = Integer.parseInt(request.getParameter("status"));
		String content = request.getParameter("content");
		
		Task task = new Task();
		task.setTaskStatus(status);
		task.setContent(content);
		service.add(task);
	}
	
}
