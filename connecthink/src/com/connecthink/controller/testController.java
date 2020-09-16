package com.connecthink.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	
	@RequestMapping("/index")
	public void test() {
		System.out.println("jaebaldwera");
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
	
	@RequestMapping("/rec")
	public void rec() {
		System.out.println("모집리스트");
	}
	
	@RequestMapping("/rec_detail")
	public void rec_detail() {
		System.out.println("모집 상세");
	}
}
