package test;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MemberRepository;
<<<<<<< HEAD
import com.connecthink.repository.RecruitRepository;

=======
@WebAppConfiguration
>>>>>>> origin/hyi
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
@WebAppConfiguration
class MemberTest {
	@Autowired
	private MemberRepository repository;
	
	@Autowired
	private RecruitRepository recruitRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	//@Test
	void findByMemberNoTest() {
		repository.findByIdMemberNo(102).forEach(m -> {
			System.out.println("멤버 번호 : " + m.getCustomer().getCustomerNo());
		});
	}
	
//	@Test
	void findAllMember() {
<<<<<<< HEAD
		repository.findTop8By().forEach(s -> {
			System.out.println("멤버: " + s.getCustomer().getExperiences());
		});
	}
	
	@Test
	void recruit() {
		Member member = new Member();
		MemberId ids = new MemberId();
		
		Customer c = customerRepository.findById(1).get();
		Recruit r = recruitRepository.findById("45R1").get();
		
		ids.setMemberNo(c.getCustomerNo());
		ids.setRecruitNo(r.getRecruitNo());
		
		member.setId(ids);
		member.setCustomer(c);
		member.setRecruit(r);
		member.setEnterStatus(0);
		
=======
		repository.findByIdMemberNo(101);
>>>>>>> origin/hyi
		
		repository.save(member);
	}
}
