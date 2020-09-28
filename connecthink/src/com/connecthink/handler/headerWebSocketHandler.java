package com.connecthink.handler;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.connecthink.controller.CustomerController;
import com.connecthink.controller.NotificationController;
import com.connecthink.controller.PersonalMessageController;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Message;
import com.connecthink.entity.Notification;
import com.connecthink.entity.PersonalMessage;
import com.fasterxml.jackson.databind.ObjectMapper;

public class headerWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	private PersonalMessageController pmController;
	@Autowired
	private NotificationController notiController;
	@Autowired
	private CustomerController customerController;

	/* PersonalMessage & Notification용 변수 */
	//현재 접속 중인 사용자들과 세션 정보를 담음
	Map<Integer, WebSocketSession> loginUser = new HashMap<Integer, WebSocketSession>();

	//customerNo에 해당하는 사용자의 PersonalMessage List를 담음
	Map<Integer,List<PersonalMessage>> pmMap = new HashMap<Integer,List<PersonalMessage>>();

	//customerNo에 해당하는 사용자의 PersonalMessage List를 담음
	Map<Integer,List<Notification>> notiMap = new HashMap<Integer,List<Notification>>();

	//접속한 유저
	Customer sender = new Customer();

	//상대 유저
	Customer receiver = new Customer();

	//parsing mapper
	ObjectMapper mapper = new ObjectMapper();

	@Override
	//클라이언트에서 접속을 성공할때 발생
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 접속 성공");
		//handShakeInterceptor 에서 추가한 Httpsesion 값 가져오기
		System.out.println("로그인 한 유저번호는 : " + session.getAttributes().get("loginInfo"));
		Integer customer_no = (Integer)session.getAttributes().get("loginInfo");

		//제대로 가져왔는지 확인
		System.out.println("HttpSession ID : "+customer_no+" webSocketID : "+session.getId()+" 접속");

		//map에 회원번호와 세션 담기
		loginUser.put(customer_no, session);
	}


	@Override
	//클라이언트에서 send 메소드를 이용하여 메세지 전송을 한 경우
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		Integer customer_no = (Integer)session.getAttributes().get("loginInfo");
		String gotMessage = message.getPayload();
		PersonalMessage newPm = new PersonalMessage();

		System.out.println("메세지가 도착했습니다.");
		System.out.println("도착한 메세지 : " + gotMessage);

		//Personal Message 처리
		//0. pmMap에 해당 유저가 없는 경우 pmMap에 유저 추가
		if(!pmMap.containsKey(customer_no)) {
			System.out.println("★ pmMap에 유저를 추가했습니다. ★");
			List<PersonalMessage> pmList = pmController.allPm(customer_no);
			pmMap.put(customer_no, pmList);
		}
		
		//1. 나와 메세지를 주고받는 사람들의 리스트
		if(gotMessage.contains("connecthinksystem:loadList")) {
			System.out.println("★ 나와 메세지를 주고받는 사람들의 리스트 ★");
			List<PersonalMessage> pmList = new ArrayList<PersonalMessage>();
			Map<Integer, PersonalMessage> pmListMap = new HashMap<Integer, PersonalMessage>();
			for(PersonalMessage pm : pmMap.get(customer_no)) {
				Integer otherNo;
				if(pm.getSend().getCustomerNo().equals(customer_no)) {
					otherNo = pm.getReceive().getCustomerNo();
				} else {
					otherNo = pm.getSend().getCustomerNo();
				}
				//pmListMap에 상대방 정보가 없는 경우
				if(!pmListMap.containsKey(otherNo)) {
					pmListMap.put(otherNo, pm);
				} else {
					if (pm.getCreateDate().getTime() > pmListMap.get(otherNo).getCreateDate().getTime()) {
						pmListMap.remove(otherNo);
						pmListMap.put(otherNo, pm);
					}
				}
			}
			Iterator<PersonalMessage> pmIter = pmListMap.values().iterator();
			while(pmIter.hasNext()) {
				pmList.add(pmIter.next());
			}
			String sendListJson = "connecthinksystem:loadList:";
			sendListJson += mapper.writeValueAsString(pmList);
			session.sendMessage(new TextMessage(sendListJson));
		}

		//2. 내가 메세지를 보낼 경우
		if(gotMessage.contains("connecthinksystem:to:")) {
			System.out.println("★내가 메세지를 보낼 때 ★");
			String[] contentArr = gotMessage.split(":");
			System.out.println("보낼 사람은 여기 : " + contentArr[2]);
			Integer otherNo = Integer.parseInt(contentArr[2]);
			System.out.println(otherNo);
			String pmContent = contentArr[3];
			sender = customerController.findCustomerByNo(customer_no);
			receiver = customerController.findCustomerByNo(otherNo);
			newPm.setSend(sender); newPm.setReceive(receiver);
			newPm.setContent(pmContent);
			newPm.setCreateDate(new Timestamp(System.currentTimeMillis()));
			//repository에 인서트
			pmController.insert(newPm);
			System.out.println("★ 디비 인서트 완료. ★");
			//상대방에게 메세지 전송
			WebSocketSession receiveSession = loginUser.get(otherNo);
			String sendPmJson = "connecthinksystem:pm:";
			sendPmJson += mapper.writeValueAsString(newPm);
			System.out.println("이 메세지를 보낼거예요 : " + sendPmJson);
			if(receiveSession==null || receiveSession.equals(null)) {
				System.out.println("사용자가 접속 중이지 않습니다.");
			}else {
				//접속 중일 때 실시간 전송
				receiveSession.sendMessage(new TextMessage(sendPmJson));
			}
			session.sendMessage(new TextMessage(sendPmJson));
			System.out.println("★ 상대방에게 메세지 전송 완료. ★");
			//해당 유저의 pmList에 메세지 추가
			pmMap.get(customer_no).add(newPm);
		}

		//notiMap에 해당 유저가 없는 경우
		if(!notiMap.containsKey(customer_no)) {
			List<Notification> pmList = notiController.findByCustomerNo(customer_no);
			notiMap.put(customer_no, pmList);
		}

	}

	@Override
	//클라이언트에서 연결을 종료 할 경우
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		Integer customer_no = (Integer)session.getAttributes().get("loginInfo");
		notiMap.remove(customer_no);
	}

}
