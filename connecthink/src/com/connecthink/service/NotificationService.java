package com.connecthink.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Notification;
import com.connecthink.entity.PersonalMessage;
import com.connecthink.repository.NotificationRepository;

@Service
@Transactional
public class NotificationService {

	@Autowired
	NotificationRepository repository;
	
	public Integer countUnreadNoti(Integer CustomerNo) {
		return repository.countUnreadNoti(CustomerNo);
	}	
	
	public List<Notification> findByCustomerNo(Integer CustomerNo) {
		return repository.findByCustomerNo(CustomerNo);
	}
	public void save(Notification nt) {
		repository.save(nt);
	}
	public void insert(Integer CustomerNo, String Content) {
		repository.insert(CustomerNo, Content);
	}
}
