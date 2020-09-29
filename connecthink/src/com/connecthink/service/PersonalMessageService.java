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
	 * @author 임수정
	 * 나에게 메세지를 보낸 사람들 목록
	 */
//	public List<PersonalMessage> findReceiver(Integer customerNo) {
//		List<PersonalMessage> PMList = repository.findByReceive(customerNo);
//		PMList.forEach(pm -> {
//			System.out.println(pm.getSend().getName());
//		});
//		return PMList;
//	}

	/**
	 * @author 임수정
	 * 한 사람과 주고받은 메세지 목록
	 */
//	public List<PersonalMessage> findByReceiveAndSend(Integer customerNo, Integer otherNo) {
//		List<PersonalMessage> PMList = repository.findByReceiveAndSend(customerNo, otherNo);
//		PMList.forEach(pm -> {
//			pm.getSend().getName();
//		});
//		return PMList;
//	}

	/**
	 * @author IM CRYSTAL
	 * 내가 주고 받은 모든 메세지 목록
	 */
//	public List<PersonalMessage> findByCustomerNo(Integer customerNo) {
//		List<PersonalMessage> PMList = repository.findByCustomerNo(customerNo);
//		PMList.forEach(pm -> {
//			System.out.println("ㅡㅡㅡㅡfor문ㅡㅡㅡㅡ" + pm.getContent());
//			Customer send = pm.getSend();
//			send.getExperiences().forEach(experience -> {
//				experience.getExplain();
//			});
//			send.getNotifications().forEach(noti -> {
//				noti.getContent();
//			});
//			send.getCustomerPositions().forEach(posi -> {
//				posi.getPosition();
//			});
//			Customer receive = pm.getReceive();
//			receive.getExperiences().forEach(experience -> {
//				experience.getExplain();
//			});
//			receive.getNotifications().forEach(noti -> {
//				noti.getContent();
//			});
//			receive.getCustomerPositions().forEach(posi -> {
//				posi.getPosition();
//			});
//		});
//		return PMList;
//	}

	/**
	 * @author IM CRYSTAL
	 * 내가 주고받은 모든 메세지를 상대방 별로 나눠서 반환
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
	 * 퍼스널 메세지 저장하기
	 */
	public void insert(PersonalMessage pm) {
		repository.save(pm);
	}

}
