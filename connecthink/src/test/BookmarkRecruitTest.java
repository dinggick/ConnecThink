package test;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.connecthink.repository.BookmarkRecruitRepository;

@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })

class BookmarkRecruitTest {
	@Autowired
	private BookmarkRecruitRepository repository;

//	@Test
	void findAllTest() {
		repository.findAll().forEach(br -> {
			System.out.println("사용자 번호 : " + br.getCustomer().getCustomerNo());
			System.out.println("모집 번호 : " + br.getRecruit().getRecruitNo());
		});
	}
	
	@Test
	void findByIdCustomerNoTest() {
		repository.findByIdCustomerNo(2).forEach(br -> {
			System.out.println("사용자 번호 : " + br.getCustomer().getCustomerNo());
			System.out.println("모집 번호 : " + br.getRecruit().getRecruitNo());
		});
	}

}
