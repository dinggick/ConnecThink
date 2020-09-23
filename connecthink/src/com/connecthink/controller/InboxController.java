package com.connecthink.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.entity.Customer;

@Controller
public class InboxController {

	@RequestMapping("/inbox")
	public void inbox() {
		
	}
	
//	@RequestMapping("/loadInbox")
//	@ResponseBody
//	public List<Customer> loadInbox() {
//		return 
//	}
}
