package test;

import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.repository.RecruitRepository;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
class RecruitTest {
	@Autowired
	
	private RecruitRepository repository;
//	@Test
	void findByCustomerNoTest() {
		repository.findByCustomerNo(2).forEach(r -> {
			System.out.println("모집 번호 : " + r.getRecruitNo());
		});
	}
	
//	@Test 
	void findAll() {
		repository.findAll().forEach(r -> {
			System.out.println("모집번호 : " + r.getRecruitNo());
		});
	}

}
