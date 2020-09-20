package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping("/mateList")
	public ModelAndView findAll() {
		ModelAndView mnv = new ModelAndView();
		List<Customer> list = service.findAll();
		mnv.addObject("customer", list);
		mnv.setViewName("/mate");
		
		return mnv; 
	}
	
	@RequestMapping("/findByEmail")
	@ResponseBody
	public Customer findByEmail(String email) {
		return service.findByEmail(email);
	}
	
	public void add(Customer c) {
		service.add(c);
	}
	
	public void remove(Integer customerNo) {
		service.removeByCustomerNo(customerNo);
	}
	
	@RequestMapping("/customerInfo")
	public void customerInfo() {
		
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
