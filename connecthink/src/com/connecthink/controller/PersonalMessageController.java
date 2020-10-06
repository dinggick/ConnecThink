package com.connecthink.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.connecthink.entity.PersonalMessage;
import com.connecthink.service.PersonalMessageService;

@Controller
public class PersonalMessageController {
	
	@Autowired
	PersonalMessageService service;

	@RequestMapping(value="/logined/inbox")
	public String inbox() {
		return "inbox";
	}
	
	/**
	 * @author 임수정
	 * 한 회원의 번호로 그 회원의 모든 personal message를 가져와서, 상대방별로 분류해 map에 담는다.
	 * map의 key는 상대방 회원번호, value는 그 상대방과 나눈 personal message를 모두 담은 List. 
	 */
	public Map<Integer, List<PersonalMessage>> findByCustomerNoAndSort(Integer customerNo) {
		return service.findByCustomerNoAndSort(customerNo);
	}
	
	/**
	 * @author 임수정
	 * 인박스에서 상대회원과의 메세지함에 들어갔을 때, 상대방이 보낸 메세지를 읽음 처리한다. (=status를 1로 update)
	 */
	public void updateStatus(Integer customerNo, Integer otherNo) {
		service.updateStatus(customerNo, otherNo);
	}
	
	/**
	 * @author IM CRYSTAL
	 * 인박스에서 상대회원과의 메세지함에 들어가 있을 때, 상대가 보낸 메세지를 실시간으로 읽음 처리한다.
	 */
	@RequestMapping("/inbox/updateStatusOne")
	public void updateStatusOne(Integer personalMsgNo) {
		service.updateStatusOne(personalMsgNo);
	}
	
	/**
	 * @author 임수정
	 * personal message를 DB에 insert 혹은 update 한다.
	 */
	public void save(PersonalMessage pm) {
		service.save(pm);
	}

}
