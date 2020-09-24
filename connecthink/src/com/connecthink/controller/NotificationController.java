package com.connecthink.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.connecthink.entity.Notification;
import com.connecthink.service.NotificationService;

@RestController
public class NotificationController {

	@Autowired
	NotificationService service;
	
	@RequestMapping(value="/inbox/unreadNoti")
	public Integer countUnreadNoti(Integer customerNo) {
		return service.countUnreadNoti(customerNo);
	}
	
	@RequestMapping(value="/inbox/allNoti")
	public List<Notification> findByCustomerNo(Integer customerNo) {
		return service.findByCustomerNo(customerNo);
	}
}
