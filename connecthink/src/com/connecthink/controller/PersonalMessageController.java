package com.connecthink.controller;

import java.util.List;
import java.util.Map;

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
	
//	@RequestMapping(value="/inbox/loadPerson")
//	@ResponseBody
//	public List<PersonalMessage> loadInbox(Integer customerNo) {
//		return service.findReceiver(customerNo);
//	}
	
//	@RequestMapping(value="/inbox/loadMSGs")
//	@ResponseBody
//	public List<PersonalMessage> loadMSGs(Integer customerNo, Integer otherNo) {
//		return service.findByReceiveAndSend(customerNo, otherNo);
//	}
	
//	@RequestMapping(value="/inbox/allPm")
//	@ResponseBody
//	public List<PersonalMessage> allPm(Integer customerNo) {
//		return service.findByCustomerNo(customerNo);
//	}
	
	@ResponseBody
	public Map<Integer, List<PersonalMessage>> findByCustomerNoAndSort(Integer customerNo) {
		return service.findByCustomerNoAndSort(customerNo);
	}
	
	public void insert(PersonalMessage pm) {
		service.insert(pm);
	}
}
