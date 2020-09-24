package test;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.entity.BookmarkRecruit;
import com.connecthink.entity.BookmarkRecruitId;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.BookmarkRecruitRepository;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.RecruitRepository;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })

class BookmarkRecruitTest {
	@Autowired
	private BookmarkRecruitRepository repository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private RecruitRepository recruitRepository;

//	@Test
	void findAllTest() {
		repository.findAll().forEach(br -> {
			System.out.println("사용자 번호 : " + br.getCustomer().getCustomerNo());
			System.out.println("모집 번호 : " + br.getRecruit().getRecruitNo());
		});
	}
	
//	@Test
	void findByIdCustomerNoTest() {
		repository.findByIdCustomerNo(1).forEach(br -> {
			System.out.println("사용자 번호 : " + br.getCustomer().getCustomerNo());
			System.out.println("모집 번호 : " + br.getRecruit().getRecruitNo());
			System.out.println(br.getRecruit().getPosition().getPositionNo());
		});
	}
	
//	@Test
	void findByIdRecruitNo() {
		int num = repository.findByIdRecruitNo("45R2");
		System.out.println(num);
	}
	
	@Test
	void bminsert() {
		BookmarkRecruit br = new BookmarkRecruit();
		Customer c = customerRepository.findById(1).get();
		Recruit r = recruitRepository.findById("2R1").get();
		
		System.out.println("c : " +c);
		System.out.println("r : " + r);
		
		br.setCustomer(c);
		br.setRecruit(r);
		
		repository.save(br);
	}

}
