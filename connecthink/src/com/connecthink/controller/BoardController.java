package com.connecthink.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
//	@RequestMapping("/board")
//	void board(HttpServletRequest req) {
//		
//		//Http session 에 저장할 userid 대체용
//        char cValue = 'a';
//        for(int i = 0; i < 100; i++) {
//            double dValue = Math.random();
//            cValue = (char)((dValue * 26) + 65);             
//        }
//        
//        HttpSession session = req.getSession();        
//        session.setAttribute("LoginInfo",String.valueOf(cValue));
//	}
	
	@RequestMapping("/addTask")
	public ModelAndView insert(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		//Integer id = (Integer) session.getAttribute("loginInfo");
		Customer c = new Customer();
		c.setCustomerNo(3);
		Integer status = Integer.parseInt(request.getParameter("status"));
		String content = request.getParameter("content");
		
		
		Task task = new Task();
		
		task.setCustomer(c);
		task.setTaskStatus(status);
		task.setContent(content);
		service.add(task, 3, 2);
		mav.setViewName("board");
		
		return mav;
	}
	
	@RequestMapping("/board")
	public ModelAndView tList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//Integer no = Integer.parseInt(request.getParameter("projectNo"));
		
		List<Task> list = service.lookUpTask(2);
		for(Task d : list) {
			System.out.println("**********************************" + d.getTaskNo());
		}
		mav.addObject("list", list);
		mav.setViewName("board");
		
		return mav;
	}
	
	@RequestMapping("/updateContent")
	public ModelAndView updateContent(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String content = request.getParameter("content");
		Task task = new Task();
		
		task.setContent(content);
		
		service.updateByComment(task);
		mav.setViewName("board");
		
		return mav;
	}
	
	@RequestMapping("/deleteTask")
	public ModelAndView deleteTask(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		//Integer id = (Integer) session.getAttribute("loginInfo");
		
		
		Integer taskNo = Integer.parseInt(request.getParameter("taskNo"));
	
		
		service.removeByTask(3, taskNo);
		return mav;
	}
}
