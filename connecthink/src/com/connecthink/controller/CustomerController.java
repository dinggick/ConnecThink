package com.connecthink.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.entity.Customer;
import com.connecthink.service.CustomerService;

/**
 * Customer 정보에 대한 요청을 처리할 Controller
 * @author CJK
 *
 */
@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	@RequestMapping("/all/mateList")
	public ModelAndView findAll() {
		System.out.println("matelist test");
		ModelAndView mnv = new ModelAndView();
		List<Customer> list = service.findAll();
		mnv.addObject("customer", list);
		mnv.setViewName("mate");
		
		return mnv; 
	}
	
	@RequestMapping("/logined/findCustomerByNo")
	@ResponseBody
	public Customer findByNo(int customerNo, Authentication auth) {
		System.out.println("principal in findCustomerByNo : " + auth.getPrincipal());
		return service.findByNo(customerNo);
	}
	
	public void add(Customer c) {
		service.add(c);
	}
	
	public void remove(Integer customerNo) {
		service.removeByCustomerNo(customerNo);
	}
	
	@RequestMapping("/customerInfo")
	public String customerInfo(Model model, HttpSession session) {
		model.addAttribute("customerInfo", service.findByNo((Integer)session.getAttribute("loginInfo")));
		
		return "customerInfo";
	}
	
	@RequestMapping("/modifyCustomerInfo")
	public void modifyCustomerInfo() {
		
	}
	@RequestMapping("/memberList")
	public List<Customer> findTopMembers(){
		System.out.println("드러옴");
		return service.findTopMembers();
	}
}
