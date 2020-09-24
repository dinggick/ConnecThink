package test;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.entity.Customer;
import com.connecthink.repository.CustomerRepository;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
@Log4j
public class CustomerTest {
	@Autowired
	private CustomerRepository repository;
	
//	@Test
	void projectMemeber() {
		List<Customer> list = repository.findByProject("45R2");
		list.forEach(c->{
			System.out.println(c.getName());
		});
	}
	
//	@Test
	void projectManager() {
		Customer c = repository.findManager("45R2");
		System.out.println(c.getName());
	}
	
	//@Test
	void findAll() {
		List<Customer> list = repository.findAll();
		list.forEach(c -> {
			System.out.println(c.getName());
		});
		
	}
	@Test
	void findByNo() {
		Customer c = repository.findByCustomerNo(1);
		
	}
	
}
