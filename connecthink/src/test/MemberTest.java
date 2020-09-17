package test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.connecthink.repository.MemberRepository;

@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })

class MemberTest {
	@Autowired
	private MemberRepository repository;
	
	@Test
	void findByMemberNoTest() {
		repository.findByIdMemberNo(102).forEach(m -> {
			System.out.println("멤버 번호 : " + m.getCustomer().getCustomerNo());
		});
	}

}
