package com.connecthink.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.ChatRoom;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.Message;
import com.connecthink.entity.Project;
import com.connecthink.entity.Task;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MessageRepository;
import com.connecthink.repository.TaskRepository;
import com.connecthink.repository.ProjectRepository;

@Service
public class BoardService {
	
	@Autowired
	private MessageRepository msgRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private TaskRepository taskRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	/**
	 * 로그를 위한 사용자가 보낸 메세지 저장
	 * @author DongJun
	 */
	public void sendMessage(int project_no,List<Message> messages) {
		System.out.println("sendMessage service 들어옴");
		Project p = projectRepository.findById(project_no).get();
		ChatRoom cr_no = p.getChatRoom();
		List<Message> msgs = cr_no.getMessages();
		messages.forEach(message -> {
			msgs.add(message);
		});
		projectRepository.save(p);
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
		Project pjInfo = projectRepository.findById(2).get();
		
		List<Member> members = new ArrayList<>();
		Member leaderInfo = new Member();
		leaderInfo.setManager(customerRepository.findById(pjInfo.getManagerNo()).get());
		
		members.add(leaderInfo);
		projectRepository.findById(project_no).get().getRecruits().forEach(r -> {
			r.getMembers().forEach(m ->{
				members.add(m);
			});
		});
		return members;
	}
	
	////////////////////변재 영역 
	/*
	 * 해당 프로젝트 포스트잇 전체 조회
	 */
	public List<Task> lookUpTask(Integer project_no){
		List<Task> tasks = new ArrayList<>();
		projectRepository.findById(project_no).get().getTasks().forEach(r ->{
			tasks.add(r);
		});
		return tasks;
	}
	
	/*
	 * 포스트잇 한개 추가
	 * @author 변재
	 */
	public void add(Task task,Integer customerNo,Integer projectNo) {
		Customer c = customerRepository.findById(customerNo).get();
		Project p = projectRepository.findById(projectNo).get();
		task.setCustomer(c);
		p.getTasks().add(task);
		
		projectRepository.save(p);
	}
	
	/*
	 * 포스트잇 내용 수정
	 * @author 변재
	 */
	public void updateByComment(Task task) {
		Task t = taskRepository.findById(task.getTaskNo()).get();
		
		taskRepository.save(t);
	}
	
	/*
	 * 포스트잇 상태 변경(드래그앤 드롭)
	 * @author 변재
	 */
	public void updateByState(Task task) {
		Task t = taskRepository.findById(task.getTaskStatus()).get();
		
		taskRepository.save(t);
	}
	
	/*
	 * 포스트잇 삭제
	 * @author 변재
	 */
	public void removeByTask(Integer customer_no,Integer taskNo) {
		Task t = taskRepository.findById(taskNo).get();
		Customer c = t.getCustomer();
		
		if(c.getCustomerNo() == customer_no) {
			taskRepository.delete(t);
		}
	}
	
	
	
}
