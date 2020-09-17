package com.connecthink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.connecthink.entity.Member;
import com.connecthink.entity.Message;
import com.connecthink.repository.MemberRepository;
import com.connecthink.repository.MessageRepository;

public class BoardService {
	
	@Autowired
	private MessageRepository msgRpty;
	
	@Autowired
	private MemberRepository memberRpty;
	
	/**
	 * 로그를 위한 사용자가 보낸 메세지 저장
	 * @author DongJun
	 */
	public void sendMessage(Message msg) {
		msgRpty.save(msg);
	}
	
	/**
	 * 해당 프로젝트의 메세지 정보 가져오기
	 * @author DongJun
	 */
	public List<Message> lookUpMsg(Integer project_no){
		return msgRpty.lookUpMsg(project_no);
	}
	
	/**
	 * 해당 프로젝트의 맴버 정보 가져오기
	 * @author DongJun
	 */
	public List<Member> lookUpMember(Integer project_no){
		return memberRpty.lookUpMember(project_no);
		
	}
	
	
	
}
