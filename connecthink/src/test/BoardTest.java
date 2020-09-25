package test;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.Message;
import com.connecthink.entity.Project;
import com.connecthink.repository.CustomerRepository;
import com.connecthink.repository.ProjectRepository;
import com.connecthink.service.BoardService;


@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
@WebAppConfiguration
class BoardTest {
	@Autowired
	private BoardService service;
	
	//@Test
	void findAllTest() {
		
		Message msg = new Message();
		Customer ct = new Customer();
		ct.setCustomerNo(1);
		
		msg.setContent("test");
		msg.setCreateDate("09:11");
		msg.setWriter(ct);
		List<Message> msgs = new ArrayList<Message>();
		msgs.add(msg);
		
		service.sendMessage(1,msgs);
	}

	//@Test
	void lookUpMember() {
		List<Member> members = service.lookUpMember(2);
		
		String managerName = members.get(0).getManager().getName();
		
		System.out.println("--------TeamInfo------------");
		
		System.out.println("Team Leader Name : "+managerName);
		for(int i = 1; i < members.size(); i++) {
			System.out.println(members.get(i).getCustomer().getName());
			System.out.println(members.get(i).getRecruit().getPosition().getPositionNo());
			System.out.println(members.get(i).getRecruit().getRecruitNo());
		}
		
	}
	
	@Test
	void lookUpMessage() {
		List<Message> msgs = service.lookUpMsg(1);
		for(Message msg : msgs) {
			System.out.println(msg.getContent());
		}
		
	}
}
