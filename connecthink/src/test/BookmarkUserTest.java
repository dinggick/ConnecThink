package test;

import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.connecthink.repository.BookmarkUserRepository;

@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })

class BookmarkUserTest {
	@Autowired
	private BookmarkUserRepository repository;
	
//	@Test
	void findAllTest() {
		repository.findAll().forEach(bu -> {
			System.out.println("관심 등록한 사용자 번호 : " + bu.getSend().getCustomerNo());
			System.out.println("관심 등록 대상자 번호 : " + bu.getReceive().getCustomerNo());
		});
	}

	@Test
	void findByIdSendTest() {
		repository.findByIdSend(2).forEach(bu -> {
			System.out.println("관심 등록한 사용자 번호 : " + bu.getSend().getCustomerNo());
			System.out.println("관심 등록 대상자 번호 : " + bu.getReceive().getCustomerNo());
		});
	}
}
