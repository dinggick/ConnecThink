package test;



import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.ContextHierarchy;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.connecthink.entity.Customer;
import com.connecthink.entity.Member;
import com.connecthink.entity.Message;
import com.connecthink.service.BoardService;


@ExtendWith(SpringExtension.class)
//@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\mvc-servlet.xml")
@ContextHierarchy({ @ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\root-context.xml"),
		@ContextConfiguration(locations = "file:WebContent\\WEB-INF\\spring\\appservlet\\servlet-context.xml") })

class BoardTest {
	@Autowired
	private BoardService service;
	//@Test
	void findAllTest() {
		
		List<String> msg_contents = new ArrayList<>();
		
		msg_contents.add(" 다 푸는 걸걸?");
		msg_contents.add(" ㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("다 푸는거야");
		msg_contents.add("선넘네");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add(" ㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("아~~~");
		msg_contents.add("네이버 가자 얘들아");
		msg_contents.add("어떻게 해가 넘어갈수록 코테가 더 빡세지냐 ㅋㅋ");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 첫번째 문제 읽고 껐어");
		msg_contents.add("미친놈들이네");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("아이디를 왜 추천해 그렇게 귀찮아?");
		msg_contents.add("도리도리...");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("카카오 코테 문자열 관련 많이 나온다더니 1번 부터 문자열 이네...");
		msg_contents.add("내 집중력 5시간 안돼서 탈락");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("문제읽는데에 집중력 다씀");
		msg_contents.add("전 1번 얽고 전투력 상실 탈락");
		msg_contents.add("ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ");
		msg_contents.add("컨넥띵크나 하자..");
		int i = 16;
		//103, 104, 105, 106, 107, 108 
		for(String content : msg_contents) {
			System.out.println("-------------------------------"+content);
			Message msg = new Message();
			msg.setContent(content);
			msg.setCreateDate("sysdate");
			msg.setMessageNo(i);
			Customer writer = new Customer();
			if(i < 20) {
				writer.setCustomerNo(103);
			}else if(i < 24) {
				writer.setCustomerNo(104);
			}else if (i < 28) {
				writer.setCustomerNo(105);
			}else if (i < 32) {
				writer.setCustomerNo(106);
			}else if (i < 36) {
				writer.setCustomerNo(107);
			}else {
				writer.setCustomerNo(108);
			}
			
			msg.setWriter(writer);
			service.sendMessage(msg);
			i++;
		}
	}

	@Test
	void lookUpMember() {
		List<Member> members = service.lookUpMember(2);
		for(Member m : members) {
			System.out.println(m.getCustomer().getCustomerNo());
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
