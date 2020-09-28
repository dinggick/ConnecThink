package com.connecthink.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.connecthink.entity.Experience;
import com.connecthink.entity.PersonalMessage;
import com.connecthink.repository.PersonalMessageRepository;

@Service
public class PersonalMessageService {

	@Autowired
	PersonalMessageRepository repository;
	
	/**
	 * @author 임수정
	 * 나에게 메세지를 보낸 사람들 목록
	 */
	@Transactional(rollbackFor = Exception.class)
	public List<PersonalMessage> findReceiver(Integer customerNo) {
		List<PersonalMessage> PMList = repository.findByReceive(customerNo);
		PMList.forEach(pm -> {
			System.out.println(pm.getSend().getName());
		});
		return PMList;
	}

	/**
	 * @author 임수정
	 * 한 사람과 주고받은 메세지 목록
	 */
	@Transactional(rollbackFor = Exception.class)
	public List<PersonalMessage> findByReceiveAndSend(Integer customerNo, Integer otherNo) {
		List<PersonalMessage> PMList = repository.findByReceiveAndSend(customerNo, otherNo);
		PMList.forEach(pm -> {
			pm.getSend().getName();
		});
		return PMList;
	}

	/**
	 * @author IM CRYSTAL
	 * 내가 주고 받은 모든 메세지 목록
	 */
	@Transactional(rollbackFor = Exception.class)
	public List<PersonalMessage> findByCustomerNo(Integer customerNo) {
		List<PersonalMessage> PMList = repository.findByCustomerNo(customerNo);
		PMList.forEach(pm -> {
			Set<Experience> experiences = pm.getSend().getExperiences();
			experiences.forEach(experience -> {
				System.out.println(experience.getId());
			});
		});
		return PMList;
	}
	
	/**
	 * @author IM CRYSTAL
	 * 퍼스널 메세지 저장하기
	 */
	@Transactional(rollbackFor = Exception.class)
	public void insert(PersonalMessage pm) {
		repository.save(pm);
	}
	
}
