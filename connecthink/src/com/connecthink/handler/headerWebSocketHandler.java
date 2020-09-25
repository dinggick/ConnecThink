package com.connecthink.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.connecthink.controller.NotificationController;
import com.connecthink.controller.PersonalMessageController;
import com.connecthink.entity.Notification;
import com.connecthink.entity.PersonalMessage;

public class headerWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private PersonalMessageController pmController;
	@Autowired
	private NotificationController notiController;
	
	/* PersonalMessage & Notification용 변수 */
	//customerNo에 해당하는 사용자의 PersonalMessage List를 담음
	Map<Integer,List<PersonalMessage>> pmMap = new HashMap<Integer,List<PersonalMessage>>();
	
	//customerNo에 해당하는 사용자의 PersonalMessage List를 담음
	Map<Integer,List<Notification>> notiMap = new HashMap<Integer,List<Notification>>();
	
	@Override
	//클라이언트 에서 접속을 성공할때 발생
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 접속 성공");
		System.out.println("ws info : "+session.getId());
		//handShakeInterceptor 에서 추가한 Httpsesion 값 가져오기
		System.out.println("로그인 한 유저번호는 : " + session.getAttributes().get("LoginInfo"));
		Integer customer_no = 101;//(Integer)session.getAttributes().get("LoginInfo");
			
		//제대로 가져왔는지 확인
		System.out.println("HttpSession ID : "+customer_no+" webSocketID : "+session.getId()+" 접속");
		
		//pmMap에 해당 유저가 없는 경우
		if(!pmMap.containsKey(customer_no)) {
			List<PersonalMessage> pmList = pmController.allPm(customer_no);
			pmMap.put(customer_no, pmList);
		}
		//notiMap에 해당 유저가 없는 경우
		if(!notiMap.containsKey(customer_no)) {
			List<Notification> pmList = notiController.findByCustomerNo(customer_no);
			notiMap.put(customer_no, pmList);
		}
	}

	
	@Override
	//클라이언트 에서 send 메소드를 이용하여 메세지 전송을 한 경우
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		System.out.println("메세지가 도착했습니다.");
		System.out.println(message.getPayload());
	}
	
	@Override
	//클라이언트 에서 연결을 종료 할 경우
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
	}
	
}
