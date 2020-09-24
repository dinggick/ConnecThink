package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.connecthink.entity.Customer;
import com.connecthink.entity.PersonalMessage;
import com.connecthink.service.PersonalMessageService;

@Controller
public class PersonalMessageController {
	
	@Autowired
	PersonalMessageService service;

	@RequestMapping(value="/inbox")
	public void inbox() {
		
	}
	
	@RequestMapping(value="/inbox/loadPerson")
	@ResponseBody
	public List<PersonalMessage> loadInbox(Integer customerNo) {
		return service.findReceiver(customerNo);
	}
	
	@RequestMapping(value="/inbox/loadMSGs")
	@ResponseBody
	public List<PersonalMessage> loadMSGs(Integer customerNo, Integer otherNo) {
		return service.findByReceiveAndSend(customerNo, otherNo);
	}
}
