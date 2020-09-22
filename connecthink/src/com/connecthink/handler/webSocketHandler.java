package com.connecthink.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.connecthink.controller.BoardController;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Message;
import com.fasterxml.jackson.databind.ObjectMapper;




public class webSocketHandler extends TextWebSocketHandler{
	
	@Autowired
	private BoardController boardController;

	
	Map<WebSocketSession, Integer> logUser = new HashMap<WebSocketSession, Integer>();
	List<Message> messageLog = new ArrayList<Message>();
	List<Map<String,List<Message>>> messageList = new ArrayList<Map<String,List<Message>>>();
	
	
	@Override
	//클라이언트 에서 접속을 성공할때 발생
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		//handShakeInterceptor 에서 추가한 Httpsesion 값 가져오기
		int customer_no = (Integer)session.getAttributes().get("userId");
		
		//접속한 유저의 웹소캣 id & 해당 유저의 HttpSession 에 저장되어 있는 userId
		logUser.put(session,customer_no);
		
		//제대로 가져왔는지 확인
		System.out.println("HttpSession ID : "+customer_no+" webSocketID : "+session.getId()+" 접속");
		
		session.sendMessage(new TextMessage("userid:"+customer_no));
		
	}
	
	@Override
	//클라이언트 에서 send 메소드를 이용하여 메세지 전송을 한 경우
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
	
		
		for(WebSocketSession ws : logUser.keySet()) {
			
			//보낸 사람 설정
			int sender = getUserId(session);
			
			//입력받은 메세지를 message entity json 으로 파싱
			Message msgParsing = mapper.readValue(message.getPayload(), Message.class);
			Customer ct = new Customer();
			
			//작성자 정보를 customer entity 로 파싱
			ct.setCustomerNo(sender);
			
			//파싱한 메세지 객체에 작성자 세팅
			msgParsing.setWriter(ct);
			
			//작성자를 제외한 모든 클라이언트 에게 메세지 전송
			if(!ws.getId().equals(session.getId())) {
					ws.sendMessage(new TextMessage(sender+":"+msgParsing.getContent()));
			}else {
				//한번만 리스트에 추가하기 위해 세션 소캣이 작성자 일때만 리스트에 추가한다.
				//log 를 위해 message list add
				System.out.println("지금 list 에 추가 할 내용"+msgParsing.getContent());
				messageLog.add(msgParsing);
				for(Map<String,List<Message>> msgList : messageList) {
					msgList.get("");
				}
			}
		}//for
		
	}//handleTextMessage

	@Override
	//클라이언트 에서 연결을 종료 할 경우
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("연결 종료");
		if(logUser.size() == 1) {
			System.out.println("DB 실행 할꺼야 !!!!!!");
			for(Message msg : messageLog){
				System.out.println(msg.getWriter().getCustomerNo()+" "+msg.getContent());
			}
			boardController.sendMsg(1,messageLog);
			System.out.println("db에 insert 했어");
		}
		logUser.remove(session);
		//DB Insert
		//boardCt.sendMsg(1, msgJs);
	}
	
	//현재 접속자 ws로 id값 얻기
	private int getUserId(WebSocketSession session) {
		int customer_no = 0;
		for(WebSocketSession ws : logUser.keySet()) {
			if(ws.getId().equals(session.getId())) {
				customer_no = logUser.get(ws);
			}
		}
		return customer_no;
	}
	
}
