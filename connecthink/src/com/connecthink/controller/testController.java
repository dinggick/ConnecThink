package com.connecthink.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	
	@RequestMapping("/index")
	public void test() {
		System.out.println("jaebaldwera");
	}
	@RequestMapping("/member_recruit")
	public String recruit() {
		return "/member_recruit";
	}
}
