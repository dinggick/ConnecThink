package test;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.connecthink.repository.CustomerPositionRepository;
import com.connecthink.repository.CustomerRepository;

@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })

class CustomerPositionTest {
	@Autowired
	private CustomerPositionRepository repository;
	@Autowired
	private CustomerRepository crepository;
	//@Test
	void findAllTest() {
		repository.findAll().forEach(cp -> {
			System.out.println("사용자 번호 : " + cp.getCustomer().getCustomerNo());
			System.out.println("역할군 번호 : " + cp.getPosition().getPositionNo());
		});
	}
	//@Test
	void findTop() {
		crepository.findTop8By().forEach(c ->{
			c.getCustomerPositions().forEach(cp -> {
				System.out.println(cp.getPosition().getName());
			});
			
		});		
	}
	

}
