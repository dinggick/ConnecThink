package com.connecthink.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.connecthink.entity.Notification;
import com.connecthink.entity.PersonalMessage;
import com.connecthink.service.NotificationService;

@RestController
public class NotificationController {

	@Autowired
	NotificationService service;	
	
	public Integer countUnreadNoti(Integer customerNo) {
		return service.countUnreadNoti(customerNo);
	}	
	
	public List<Notification> findByCustomerNo(Integer customerNo) {
		return service.findByCustomerNo(customerNo);
	}	

	
	public void insert(Integer CustomerNo, String Content) {
		service.insert(CustomerNo, Content);
	}
}
