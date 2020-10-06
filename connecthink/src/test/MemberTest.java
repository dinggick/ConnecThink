package test;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Experience;
import com.connecthink.entity.Member;
import com.connecthink.entity.MemberId;
import com.connecthink.entity.Recruit;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.MemberRepository;
import com.connecthink.repository.RecruitRepository;



import com.connecthink.repository.RecruitRepository;


@WebAppConfiguration
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
	@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\security-context.xml"),
	@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml")
})
class MemberTest {
	@Autowired
	private MemberRepository repository;
	
	@Autowired
	private RecruitRepository recruitRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
//	//@Test
//	void findByMemberNoTest() {
//		repository.findByIdMemberNo(102).forEach(m -> {
//			System.out.println("멤버 번호 : " + m.getCustomer().getCustomerNo());
//		});
//	}
//	
////	@Test
//	void findAllMember() {
//		repository.findTop8By().forEach(s -> {
	//@Test
//	void findByMemberNoTest() {
//		customerRepository.findByIdMemberNo(102).forEach(m -> {
//		repository.findByIdMemberNo(102).forEach(m -> {
//			System.out.println("멤버 번호 : " + m.getCustomer().getCustomerNo());
//		});
//	}
	
//	@Test
//	void findAllMember() {
//		customerRepository.findTop8By().forEach(s -> {
//
//		repository.findTop8By().forEach(s -> {
//			System.out.println("멤버: " + s.getCustomer().getExperiences());
//		});
//	}
	
//	@Test
	@Transactional
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
		

		//repository.findByIdMemberNo(101);

		
		repository.save(member);
	}
	
	@Test
	@Transactional
	@DisplayName("지원자 찾기")
	public void findInvitedTest() {
		List<Member> mList = repository.findAllByRecruitNoAndInvited("9R2", 0);
		for(Member m : mList) {
			Set<Experience> eSet = m.getCustomer().getExperiences();
			System.out.println(m);
		}
	}
}
