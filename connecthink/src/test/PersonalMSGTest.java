package test;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;

import com.connecthink.repository.PersonalMessageRepository;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })
@Log4j
public class PersonalMSGTest {

	@Autowired
	PersonalMessageRepository repository;
	
	@Test
	@DisplayName("수신자 발신자로 검색")
	void findByReceiveAndSendTest() {
		repository.findByReceiveAndSend(101, 1).forEach(m -> {
			System.out.println("발신자 : " + m.getSend().getName() + " / 메세지 내용 : " + m.getContent());
		});
	}
}
