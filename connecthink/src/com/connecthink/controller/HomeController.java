package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.entity.Customer;
import com.connecthink.service.CustomerService;

@Controller
public class HomeController {
	@Autowired
	private CustomerService service;
	@RequestMapping("/index")
	public void home() {
	}
	
	@RequestMapping("/header")
	public String header() {
		return "header";
	}
	
	@RequestMapping("/member_recruit")
	public void recruit() {
		System.out.println("멤버 상세");
	}
	@RequestMapping("/customerList")
	@ResponseBody
	public List<Customer> findList(){
		System.out.println("들어옴");
		return service.findTopMembers();
	}
}
