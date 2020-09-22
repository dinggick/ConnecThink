package com.connecthink.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;
import javax.transaction.Transactional.TxType;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
@Transactional
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
	
	////////////////////변재 영역 
	/*
	 * 해당 프로젝트 포스트잇 전체 조회
	 */
//	@Transactional
	public List<Task> lookUpTask(Integer project_no){
		System.out.println("--------------test01");
		List<Task> tasks = new ArrayList<>();
//		projectRepository.findById(project_no).get().getTasks().forEach(r ->{
//			tasks.add(r);
//		});
		Project p = projectRepository.findById(project_no).get();
		System.out.println("--------------test02");
//		p.getTasks().get(0).getTaskNo();
//		Hibernate.initialize(p.getTasks());
		tasks.addAll(p.getTasks());
		System.out.println("--------------test03");
		
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
