package com.connecthink.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.Customer;
import com.connecthink.entity.PersonalMessage;
import com.connecthink.repository.PersonalMessageRepository;

@Service
@Transactional
public class PersonalMessageService {

	@Autowired
	PersonalMessageRepository repository;

	/**
	 * @author IM CRYSTAL
	 * 한 회원의 번호로 그 회원의 모든 personal message를 가져와서, 상대방별로 분류해 map에 담는다.
	 * map의 key는 상대방 회원번호, value는 그 상대방과 나눈 personal message를 모두 담은 List. 
	 */
	public Map<Integer, List<PersonalMessage>> findByCustomerNoAndSort(Integer customerNo){
		//상대방 번호 별로 sort해서 메세지를 저장할 Map
		Map<Integer, List<PersonalMessage>> pmSortMap = new HashMap<Integer, List<PersonalMessage>>();
		List<PersonalMessage> pmList = repository.findByCustomerNo(customerNo);
		for(PersonalMessage pm : pmList) {
			//lazy loading을 위해 값 가져오기...
			Customer send = pm.getSend();
			send.getExperiences().forEach(experience -> {
				experience.getExplain();
			});
			send.getNotifications().forEach(noti -> {
				noti.getContent();
			});
			send.getCustomerPositions().forEach(posi -> {
				posi.getPosition();
			});
			Customer receive = pm.getReceive();
			receive.getExperiences().forEach(experience -> {
				experience.getExplain();
			});
			receive.getNotifications().forEach(noti -> {
				noti.getContent();
			});
			receive.getCustomerPositions().forEach(posi -> {
				posi.getPosition();
			});
			
			//상대방 번호를 담을 Integer 객체
			Integer otherNo;
			//sender가 로그인 유저라면 상대방은 receiver이다.
			if(send.getCustomerNo().equals(customerNo)) {
				otherNo = receive.getCustomerNo();
			//sender가 로그인 유저가 아니라면 상대방은 sender이다.
			} else {
				otherNo = send.getCustomerNo();
			}
			//pmSortMap에 상대방 정보가 없는 경우
			if(!pmSortMap.containsKey(otherNo)) {
				pmSortMap.put(otherNo, new ArrayList<PersonalMessage>());
			}
			//pmListMap에 personal message 추가
			pmSortMap.get(otherNo).add(pm);
		}
		return pmSortMap;
	}
	
	/**
	 * @author IM CRYSTAL
	 * 인박스에서 상대회원과의 메세지함에 들어갔을 때, 상대방이 보낸 메세지를 읽음 처리한다. (=status를 1로 update)
	 */
	public void updateStatus(Integer customerNo, Integer otherNo) {
		repository.updateStatus(customerNo, otherNo);
	}

	/**
	 * @author IM CRYSTAL
	 * personal message를 DB에 insert 혹은 update 한다.
	 */
	public void save(PersonalMessage pm) {
		repository.save(pm);
	}

}
