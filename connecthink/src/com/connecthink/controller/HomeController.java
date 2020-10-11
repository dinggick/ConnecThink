package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.entity.Customer;
import com.connecthink.service.CustomerService;
import com.connecthink.service.NotificationService;
import com.connecthink.service.PersonalMessageService;

@Controller
public class HomeController {
	@Autowired
	private CustomerService service;
	@Autowired
	private PersonalMessageService pmservice;
	@Autowired
	private NotificationService ntservice;
	
	@GetMapping(value = "/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/header")
	public String header() {
		return "header";
	}
	

	@RequestMapping("/about")
	public void about() {
		
	}
	
	@RequestMapping("/event")
	public void event() {
		
	}
	
	@RequestMapping("/logined/member_recruit")
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
