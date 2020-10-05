	package test;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.controller.BoardController;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.entity.Task;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MemberRepository;
import com.connecthink.repository.ProjectRepository;
import com.connecthink.repository.RecruitRepository;
import com.connecthink.repository.TaskRepository;
import com.connecthink.service.BoardService;

@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
@WebAppConfiguration
class TaskTest {
	@Autowired
	private TaskRepository repository;
	@Autowired
	private CustomerRepository customerRepository;
	@Autowired
	private RecruitRepository recruitRepository;
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private CustomerRepository crpo;
	
	@Autowired
	private MemberRepository memberRepository;
	
	@Autowired
	private BoardController con;
	//@Test
	void findAllTest() {
		repository.findAll();
	}
	
	//@Transactional
	//@Test
	public void lists(){
		List<Task> list = con.tList(2);
		System.out.println("사이즈으으으응" + list.size());
	
	}
	
	//@Test
	public void insert() {
		Task t = new Task();
		//Customer c = projectRepository.findById(2).get().getRecruits().iterator().next().getMembers().iterator().next().getCustomer();
		Customer c = crpo.findById(3).get();
		Project p = projectRepository.findById(2).get();
//		c.setCustomerNo(3);
		t.setContent("오늘 날짜의 할일");
		t.setCustomer(c);
		t.setTaskStatus(2);
		p.getTasks().add(t);
		
		projectRepository.save(p);
	}
	
//	@Test
	public void delete() {
		//현재 사용자 아이디가져오기
		
		
		Task t = repository.findById(12).get();
		
		Customer c = t.getCustomer();
		
		if(c.getCustomerNo() == 3) {
			repository.delete(t);
		}
		
	}
	
	//상태변경
//	@Test
	public void update() {
		Task t = repository.findById(11).get();
		
		t.setTaskStatus(3);
		
		repository.save(t);
	}
	
	//내용수정
	@Test
	public void updateContent() {
		Task t = repository.findById(1).get();
		
		t.setContent("쏼라쏼라~");
		repository.save(t);
	}
	
//	@Test
	public void tt() {
		Project p =projectRepository.findById(24).get();
		
		p.setProjectStatus(0);
		
		projectRepository.save(p);
	}
	
//	@Test
//	@Transactional
	public void ttt() {
//		Project p = projectRepository.findById(1).get();
//		Iterator rIter = p.getRecruits().iterator();
//		while(rIter.hasNext()) {
//			Set<Member> memberSet = ((Recruit)rIter.next()).getMembers();
//			Iterator mIter = memberSet.iterator();
//			while(mIter.hasNext()) {
//				Member m = (Member) mIter.next();
//				if(m.getCustomer().getCustomerNo() == 101) {
//					memberSet.remove(m);
//					projectRepository.saveAndFlush(p);
//					return;
//				}
//			}
//		}
		Project p = projectRepository.findById(1).get();
		p.getRecruits().forEach(r -> {
			r.getMembers().forEach(m -> {
				if(m.getId().getMemberNo() == 101) {
					Member memberToRemove = new Member();
					MemberId ids = new MemberId();
					
					ids.setMemberNo(101);
					ids.setRecruitNo(r.getRecruitNo());
					
					memberToRemove.setId(ids);
					memberToRemove.setCustomer(customerRepository.findById(101).get());
					memberToRemove.setRecruit(recruitRepository.findById("1R1").get());
					
					memberRepository.delete(memberToRemove);
					return;
				}
			});
		});
	}
	
}
