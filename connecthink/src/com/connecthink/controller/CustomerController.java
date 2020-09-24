package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Project;
import com.connecthink.service.CustomerService;
import com.connecthink.service.ProjectService;

/**
 * Customer 정보에 대한 요청을 처리할 Controller
 * @author CJK
 *
 */
@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;
	@Autowired
	private ProjectService pservice;
	@RequestMapping("/all/mateList")
	public ModelAndView findAll() {
		System.out.println("matelist test");
		ModelAndView mnv = new ModelAndView();
		List<Customer> list = service.findAll();
		mnv.addObject("customer", list);
		mnv.setViewName("mate");
		
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
		return service.findTopMembers();
	}
	//멤버상세 
	@RequestMapping("/member_detail")	
	public ModelAndView findByNo(Integer customerNo) {
		ModelAndView mnv = new ModelAndView();
		//멤버상세
		Customer c = service.findByCustomerNo(customerNo);		
		mnv.addObject("customer", c);
		
		//컨넥띵크 히스토리
		List<Project> m = pservice.findByCustomerNo(customerNo);
		
		mnv.addObject("project",m);
		
		
		
		mnv.setViewName("member_recruit");
		
		return mnv;
	}
	
}
