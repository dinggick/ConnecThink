 package com.connecthink.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@PostMapping(value = "recruit")
	@ResponseBody
	public String recruit(Integer customerNo, String recruitNo) {
		service.recruit(customerNo, recruitNo);
		return "success";
	}
	
}