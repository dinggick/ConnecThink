package com.connecthink.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.connecthink.entity.Member;
import com.connecthink.entity.Message;
import com.connecthink.repository.MessageRepository;
import com.connecthink.repository.ProjectRepository;

public class BoardService {
	
	@Autowired
	private MessageRepository msgRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	/**
	 * 로그를 위한 사용자가 보낸 메세지 저장
	 * @author DongJun
	 */
	public void sendMessage(Message msg) {
		msgRepository.save(msg);
	}
	
	/**
	 * 해당 프로젝트의 메세지 정보 가져오기
	 * @author DongJun
	 */
	public List<Message> lookUpMsg(Integer project_no){
		return msgRepository.lookUpMsg(project_no);
	}
	
	/**
	 * 해당 프로젝트의 맴버 정보 가져오기
	 * @author DongJun
	 */
	public List<Member> lookUpMember(Integer project_no){
		List<Member> members = new ArrayList<>();
		projectRepository.findById(project_no).get().getRecruits().forEach(r -> {
			r.getMembers().forEach(m ->{
				members.add(m);
			});
		});
		return members;
	}
	
	
	
}
