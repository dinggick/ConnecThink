package test;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.connecthink.controller.CustomerController;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Project;
import com.connecthink.repository.ProjectRepository;

import lombok.extern.log4j.Log4j;

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
	public void controllerTest() {
		if(controller == null) fail("controller null");
	}
	
//	@Test
	public void findByEmailTest() {
		Customer c = controller.findByEmail("user2@naver.com");
	}

//	@Test
	public void saveTest() {
		Customer c = new Customer();
		c.setCustomerNo(202);
		c.setEmail("test03@gmail.com");
		controller.insert(c);
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
			
			p.getRecruits().forEach(r -> {
				System.out.println("----모집 번호 : " + r.getRecruitNo());
				
				r.getMembers().forEach(m -> {
					System.out.println("멤버 번호 : " + m.getCustomer().getCustomerNo());
					
				});
			});
		});
	}
}
