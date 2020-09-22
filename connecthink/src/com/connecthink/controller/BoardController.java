package com.connecthink.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.Message;
import com.connecthink.entity.Task;
import com.connecthink.service.BoardService;

@Controller
public class BoardController {
//	@Autowired
//	private CustomerService service;
//	
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board")
	ModelAndView board(HttpServletRequest req,@RequestParam("project_no") String project_no) {
		ModelAndView mv = new ModelAndView();
		System.out.println("board임");
		System.out.println("project_No : "+project_no);
		req.setAttribute("project_no",project_no);
		int customer_no = 0;
		
		//Http session 에 저장할 userid 대체용
		for(int i = 0; i < 100; i++) {

		    double dValue = Math.random();

		   customer_no = (int)(dValue * 10);
		}
        
        HttpSession session = req.getSession();        
        session.setAttribute("LoginInfo",customer_no);
        mv.setViewName("board");
        mv.addObject("project_no",project_no);
		return mv;
	}
	
	@RequestMapping("/board/lookUpMember")
	ModelAndView lookUpMember(int product_no) {
		ModelAndView mv = new ModelAndView();
		List<Member> members = service.lookUpMember(product_no);
		
		mv.addObject("members",members);
		return mv;
	}
	
	@RequestMapping("/board/lookUpMsg")
	@ResponseBody
	List<Message> readMsg(HttpServletRequest req) {
		int project_no = Integer.parseInt(req.getParameter("project_no"));
		HttpSession session = req.getSession();
		int accessor = (Integer)session.getAttribute("LoginInfo");
		//int accessor = 6;
		List<Message> messageList = service.lookUpMsg(project_no);
		
		for(int i = 0; i < messageList.size(); i++) {
			Message msg = messageList.get(i);
			boolean isReception = (msg.getWriter().getCustomerNo() != accessor) ? true : false;
			msg.setReception(isReception);
		}
		return messageList;
	}
	
	public void sendMsg(int project_no, List<Message> msgs) {
		service.sendMessage(project_no, msgs);
	}
	
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
