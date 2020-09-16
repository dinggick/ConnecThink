package com.connecthink.handler;

import java.util.HashMap;
import java.util.Map;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class webSocketHandler extends TextWebSocketHandler{
//	List<WebSocketSession> sessions = new ArrayList<>();
//	Map<String, Object> user = new HashMap<String, Object>();
	Map<WebSocketSession, Object> logUser = new HashMap<WebSocketSession, Object>();
	
	
	@Override
	//클라이언트 에서 접속을 성공할때 발생
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		//handShakeInterceptor 에서 추가한 Httpsesion 값 가져오기
		String id = (String)session.getAttributes().get("userId");
		
		//접속한 유저의 웹소캣 id & 해당 유저의 HttpSession 에 저장되어 있는 userId
		logUser.put(session,id);
		
		//제대로 가져왔는지 확인
		System.out.println("HttpSession ID : "+id+" webSocketID : "+session.getId()+" 접속");
		
		session.sendMessage(new TextMessage("userid:"+id));
	}
	
	@Override
	//클라이언트 에서 send 메소드를 이용하여 메세지 전송을 한 경우
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		
		//보낸 메세지 내용
		String msg = message.getPayload();
		
		for(WebSocketSession ws : logUser.keySet()) {
			//ws : " + key +" / id : " + ws.get(key));
			
			//보낸 사람 설정
			String sender = getUserId(session);
			
			//작성자를 제외한 모든 클라이언트 에게 메세지 전송
				if(!ws.getId().equals(session.getId()))
					ws.sendMessage(new TextMessage(sender+":"+msg));
		}//for
		
	}//handleTextMessage

	@Override
	//클라이언트 에서 연결을 종료 할 경우
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		logUser.remove(session);
	}
	
	//현재 접속자 ws로 id값 얻기
	private String getUserId(WebSocketSession session) {
		String id = "";
		for(WebSocketSession ws : logUser.keySet()) {
			if(ws.getId().equals(session.getId())) {
				id = (String)logUser.get(ws);
			}
		}
		return id;
	}
	
}
