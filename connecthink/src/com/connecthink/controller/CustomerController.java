package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/findAll")
	@ResponseBody
	public List<Customer> findAll() {
		return service.findAll();
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
}
