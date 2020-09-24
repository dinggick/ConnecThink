package test;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.controller.CustomerController;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.Project;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.ProjectRepository;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
@Log4j
class JPATest {
	@Autowired
	private CustomerController controller;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	
//	@Test
	void recDetailTest() {
		Project p = projectRepository.findByRecruits("45R2");
		System.out.println(p.getPurpose());
		System.out.println(p.getProjectNo());
		Set<Recruit> r = p.getRecruits();
		Iterator<Recruit> iter = r.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next().getRecruitNo());
			Set<Member> m = iter.next().getMembers();
			Iterator<Member> iterm = m.iterator();
			System.out.println(m.size());
			while(iterm.hasNext()) {
			System.out.println(iterm.next().getCustomer().getName());
			}
		}
	}
	
	
//	@Test
	public void controllerTest() {
		if(controller == null) fail("controller null");
	}

//	@Test
	public void saveTest() {
		Customer c = new Customer();
		c.setCustomerNo(202);
		c.setEmail("test03@gmail.com");
		controller.add(c);
	}
	
//	@Test
	public void deleteTest() {
		int customerNo = 202;
		controller.remove(customerNo);
	}
	
//	@Test
	public void myProjectsAsLeaderTest() {
		projectRepository.findByManagerNo(2);
	}
	
//	@Test
	public void myProjectAsMemberTest() {
		List<Project> list = projectRepository.test(2);
		list.forEach(p -> {
			System.out.println("----프로젝트 번호 : " + p.getProjectNo());
			System.out.println("팀장 번호 : " + p.getManagerNo());
			p.getRecruits().forEach(r -> {
				System.out.println("----모집 번호 : " + r.getRecruitNo());
				
				r.getMembers().forEach(m -> {
					System.out.println("멤버 번호 : " + m.getCustomer().getCustomerNo());
					
				});
			});
		});
	}
	
//	@Test
	@DisplayName("내가 지원한 프로젝트 목록")
	public void myAppliedProjectTest() {
		int memberNo = 102;
		List<Project> list = projectRepository.findMyApplication(memberNo);
		for(Project p : list) {
			Set<Recruit> recruits = p.getRecruits();
			Iterator<Recruit> iter = recruits.iterator();
			while (iter.hasNext()) {
				Recruit r = iter.next();
				boolean isRightRecruit = false;
				for(Member m : r.getMembers()) {
					if (m.getCustomer().getCustomerNo() == 102) {
						isRightRecruit = true;
					}
				}
				if(isRightRecruit==false) {
					iter.remove();
				}
			}
		}
	}
	
	@Test
	@DisplayName("내가 초대받은 프로젝트 목록")
	public void myInvitedProjectTest() {
		int memberNo = 161;
		List<Project> list = projectRepository.findMyInvitation(memberNo);
		for(Project p : list) {
			System.out.println("프로젝트 명 : " + p.getTitle());
		}
	}



//	@Test
	@DisplayName("내 프로젝트에 지원한 사람 목록")
	public void applicantOfMyProjectTest() {
		int managerNo = 2;
		List<Project> projectList = projectRepository.findByManagerNo(managerNo);
		for(Project p : projectList) {
			System.out.println("프로젝트 명 : " + p.getTitle());
			Set<Recruit> recruitList = p.getRecruits();
			for(Recruit r : recruitList) {
				System.out.println("모집분야 : " + r.getPosition().getName());
				Set<Member> memberList = r.getMembers();
				for(Member m : memberList) {
					if (m.getEnterStatus()==0 && m.getInvited()==0) {
						System.out.println("지원자 : " + m.getCustomer().getName());
					}
				}
			}
		}
	}
	
//	@Test
	@DisplayName("내 프로젝트에 내가 초대한 사람 목록")
	public void guestOfMyProjectTest() {
		int managerNo = 2;
		List<Project> projectList = projectRepository.findByManagerNo(managerNo);
		for(Project p : projectList) {
			System.out.println("프로젝트 명 : " + p.getTitle());
			Set<Recruit> recruitList = p.getRecruits();
			for(Recruit r : recruitList) {
				System.out.println("모집분야 : " + r.getPosition().getName());
				Set<Member> memberList = r.getMembers();
				for(Member m : memberList) {
					if (m.getEnterStatus()==0 && m.getInvited()==1) {
						System.out.println("초대받은 사람 : " + m.getCustomer().getName());
					}
				}
			}
		}
	}
	@Test
	public void findProjectByNo() {
		projectRepository.findProjectByCustomerNo(101);
	}

}
