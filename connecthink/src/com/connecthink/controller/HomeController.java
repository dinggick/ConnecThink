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
	public void test() {
		
	}
	
	@RequestMapping("/add_project")
	public void addp() {
		System.out.println("프로젝트 등록");
	}
	
	@RequestMapping("/add_rec")
	public void addr() {
		System.out.println("모집 등록");
	}
	
	@RequestMapping("/bookmark")
	public void bookmark() {
		System.out.println("북마크");
	}
	
	@RequestMapping("/mate")
	public void mate() {
		System.out.println("메이트 리스트");
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
