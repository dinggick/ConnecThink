package com.connecthink.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.connecthink.entity.ChatRoom;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.Message;
import com.connecthink.entity.Project;
import com.connecthink.entity.Task;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MemberRepository;
import com.connecthink.repository.PositionRepository;
import com.connecthink.repository.TaskRepository;
import com.connecthink.repository.ProjectRepository;

@Service
@Transactional
public class BoardService {
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private TaskRepository taskRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private PositionRepository positionRepository;

	/**
	 * 로그를 위한 사용자가 보낸 메세지 저장
	 * @author DongJun
	 */
	
	public void sendMessage(int project_no,List<Message> messageList) {
		System.out.println("sendMessage service 들어옴");
		System.out.println("websocket 에게 받은 메세지 리스트 사이즈 : "+messageList.size());
		Project p = projectRepository.findById(project_no).get();
		ChatRoom cr_no = p.getChatRoom();
		List<Message> msgs = cr_no.getMessages();
		messageList.forEach(message -> {
			System.out.println("In service message Info : "+message);
			msgs.add(message);
		});
		System.out.println("size : "+messageList.size());
		System.out.println("save 진행 직전");
		projectRepository.save(p);
	}
	
	/**
	 * 해당 프로젝트의 메세지 정보 가져오기
	 * @author DongJun
	 */	
	
	public List<Message> lookUpMsg(Integer project_no){
		Project p = projectRepository.findById(project_no).get();
		ChatRoom cr_no = p.getChatRoom();
		if(cr_no.getMessages() != null) {
			cr_no.getMessages().forEach(msg -> {
				msg.getContent();
			});
		}
		return cr_no.getMessages();
	}
	
	/**
	 * 해당 프로젝트의 맴버 정보 가져오기
	 * @author DongJun
	 */
	public List<String> lookUpMember(Integer project_no){
		Project pjInfo = projectRepository.findById(project_no).get();
		
		List<Member> members = new ArrayList<>();
		List<String> memberInfo = new ArrayList<>();
		Member leaderInfo = new Member();
		leaderInfo.setCustomer(customerRepository.findById(pjInfo.getManagerNo()).get());
		members.add(leaderInfo);
		memberInfo.add(pjInfo.getManagerNo()+":"+customerRepository.findById(pjInfo.getManagerNo()).get().getName()+":"+"teamLeader");
		projectRepository.findById(project_no).get().getRecruits().forEach(r -> {
			r.getMembers().forEach(m ->{
				m.setPosition(positionRepository.findById(m.getRecruit().getPosition().getPositionNo()).get().getName());
				members.add(m);
				memberInfo.add(m.getCustomer().getCustomerNo()+":"+m.getCustomer().getName()+":"+positionRepository.findById(m.getRecruit().getPosition().getPositionNo()).get().getName());
			});
		});
		return memberInfo;
	}
	
	////////////////////변재 영역 
	/*
	 * 해당 프로젝트 포스트잇 전체 조회
	 */
	@Transactional
	public List<Task> lookUpTask(Integer project_no){
		List<Task> tasks = new ArrayList<>();

		Project p = projectRepository.findById(project_no).get();

		tasks.addAll(p.getTasks());
		
		return tasks;
		
		
	}
	
	/*
	 * 포스트잇 한개 추가
	 * @author 변재
	 */
	@Transactional
	public void add(Task task,Integer projectNo) {
		
		Project p = projectRepository.findById(projectNo).get();
		p.getTasks().add(task);
		
		
		projectRepository.save(p);
	}
	
	/*
	 * 포스트잇 내용 수정
	 * @author 변재
	 */
	@Transactional
	public void updateByComment(Task task) {
		Task t = taskRepository.findById(task.getTaskNo()).get();
		
		t.setContent(task.getContent());
		taskRepository.save(t);
	}
	
	/*
	 * 포스트잇 상태 변경(드래그앤 드롭)
	 * @author 변재
	 */
	@Transactional
	public void updateByState(Task task) {
		Task t = taskRepository.findById(task.getTaskNo()).get();
		
		t.setTaskStatus(task.getTaskStatus());
		
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
	
	/*
	 * 프로젝트 종료
	 * @author 변재
	 */
	public void updateProject(Integer projectNo) {
		Project p =projectRepository.findById(projectNo).get();
		
		p.setProjectStatus(2);
		
		projectRepository.save(p);
	}
	
	/*
	 * 프로젝트 탈퇴
	 * @author 변재
	 */
	public void exitProject(Integer customerNo) {
		
	}
	
}
