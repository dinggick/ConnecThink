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
import com.connecthink.dto.LatestPersonalMessageDTO;
import com.connecthink.entity.Customer;
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
	//현재 접속중인 사용자들과 세션 정보를 담음
	Map<Integer, WebSocketSession> loginUserMap = new HashMap<Integer, WebSocketSession>();

	//현재 접속중인 사용자들의 메세지를 상대별로 나눠서 담음
	Map<Integer, Map<Integer, List<PersonalMessage>>> pmMap = new HashMap<Integer, Map<Integer, List<PersonalMessage>>>();

	//customerNo에 해당하는 사용자의 Notifcation List를 담음
	Map<Integer,List<Notification>> notiMap = new HashMap<Integer,List<Notification>>();

	//접속한 회원 객체
	Customer thisCustomer = new Customer();

	//상대 회원 객체
	Customer otherCustomer = new Customer();

	//parsing mapper
	ObjectMapper mapper = new ObjectMapper();

	@Override
	//클라이언트에서 접속을 성공할때 발생
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 접속 성공");
		
		//handShakeInterceptor 에서 추가한 Httpsesion 값 가져오기
		Integer customer_no = (Integer)session.getAttributes().get("loginInfo");

		//제대로 가져왔는지 확인
		System.out.println("HttpSession ID : "+customer_no+" webSocketID : "+session.getId()+" 접속");

		//map에 회원번호와 세션 담기
		loginUserMap.put(customer_no, session);
	}


	@Override
	//클라이언트에서 send 메소드를 이용하여 메세지 전송을 한 경우
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		Integer customer_no = (Integer)session.getAttributes().get("loginInfo");
		String gotMessage = message.getPayload();
		PersonalMessage newPm = new PersonalMessage();
		Notification newNoti = new Notification();

		System.out.println("클라이언트로부터 메세지가 도착했습니다 : " + gotMessage);

		//Personal Message 처리
		//0. pmMap에 해당 유저가 없는 경우 pmMap에 유저 추가
		if(!pmMap.containsKey(customer_no)) {
			System.out.println("★ pmMap에 해당 유저가 없어 해당 유저를 추가했습니다. ★");
			Map<Integer, List<PersonalMessage>> pmSortMap = pmController.findByCustomerNoAndSort(customer_no);
			pmMap.put(customer_no, pmSortMap);
			System.out.println("PMMAP IN HANDLER : " + pmMap);
		}
		// notiMap에 해당 유저가 없는 경우
		if (!notiMap.containsKey(customer_no)) {
			List<Notification> pmList = notiController.findByCustomerNo(customer_no);
			notiMap.put(customer_no, pmList);
		}

		// 1. 나와 메세지를 주고받는 사람들의 리스트
		if (gotMessage.contains("connecthinksystem:loadList")) {
			System.out.println("★ 유저와 메세지를 주고받는 사람들의 리스트를 전송하겠습니다.★");
			System.out.println("PMMAP IN HANDLER : " + pmMap);
			Map<Integer, List<PersonalMessage>> pmSortMap = pmMap.get(customer_no);

			//상대방 번호를 iterator로 가져온다.
			Iterator<Integer> otherIter = pmSortMap.keySet().iterator();
			//처음으로 보내는 상대인지 찾기
			int count = 0;
			//상대방 별로 가장 최신 personal message와, 아직 읽지 않은 메세지의 개수를 찾아 클라이언트로 보낸다.
			while(otherIter.hasNext()) {
				Integer newCnt = 0;
				//상대방 회원 번호
				Integer otherNo = otherIter.next();
				//상대방과 주고받은 personal message Lists
				List<PersonalMessage> pmListFromOther = pmSortMap.get(otherNo);
				//가장 최신 personal message를 담을 객체
				PersonalMessage latestPm = null;
				//반복문을 돌면서 가장 최신 personal message를 찾고, 아직 읽지 않은 메세지의 개수 세기
				for(PersonalMessage pm : pmListFromOther) {
					//내가 받은 메세지 중 아직 읽지 않은 메세지 개수 세기
					if((int)pm.getReceive().getCustomerNo() == (int)customer_no && pm.getStatus() == 0) {
						newCnt += 1;
					}
					//최신 pm 찾기
					if(latestPm == null || pm.getCreateDate().getTime() > latestPm.getCreateDate().getTime()) {
						latestPm = pm;
					}
				}
				//클라이언트로 보낼 정보를 준비
				String loadListMsg = "";
				if(count==0) {
					loadListMsg += "connecthinksystem:loadList:refresh:";
				}else {
					loadListMsg += "connecthinksystem:loadList:";
				}
				LatestPersonalMessageDTO pmDTO = new LatestPersonalMessageDTO();
				pmDTO.setOtherNo(otherNo); pmDTO.setOtherName(customerController.findCustomerByNo(otherNo).getName());
				pmDTO.setContent(latestPm.getContent()); pmDTO.setCreateDate(latestPm.getCreateDate());
				pmDTO.setStatus(latestPm.getStatus()); pmDTO.setNewCnt(newCnt);
				loadListMsg += mapper.writeValueAsString(pmDTO);
				//클라이언트로 보내기
				session.sendMessage(new TextMessage(loadListMsg));
				count ++;
			}
		}
		
		//2. 특정 회원과 주고받은 메세지를 화면에 보여주기
		if(gotMessage.contains("connecthinksystem:loadPms:")) {
			String[] contentArr = gotMessage.split(":");
			Integer otherNo = Integer.parseInt(contentArr[2]);
			List<PersonalMessage> pms = pmMap.get(customer_no).get(otherNo);
			//클라이언트로 보내기
			String loadPmsMsg = "connecthinksystem:loadPms:";
			loadPmsMsg += mapper.writeValueAsString(pms);
			session.sendMessage(new TextMessage(loadPmsMsg));
			System.out.println("★" + contentArr[2] + "번 회원과 주고받은 메세지를 전송했습니다.★");
			//읽음상태 읽음으로 바꾸기
			pms.forEach(pm -> {
				if((int)pm.getReceive().getCustomerNo() == (int)customer_no) {
					pm.setStatus(1);
					pmController.save(pm);
				}
			});
		}
		//2.1 회원의 노티 화면에 보여주기
		if(gotMessage.contains("connecthinksystem:loadNotis:")) {			
			List<Notification> nts = notiMap.get(customer_no);
			//클라이언트로 보내기
			String loadPmsMsg = "connecthinksystem:loadNotis:";
			loadPmsMsg += mapper.writeValueAsString(nts);
			session.sendMessage(new TextMessage(loadPmsMsg));
			//System.out.println("★" + contentArr[2] + "번 회원과 주고받은 메세지를 전송했습니다.★");
			//읽음상태 읽음으로 바꾸기
			nts.forEach(pm -> {				
					System.out.println("읽음상태를 바꿉니다잉");
					pm.setRead_status(1);
					notiController.save(pm);				
			});
		}

		//3. 내가 메세지를 보낼 경우
		if(gotMessage.contains("connecthinksystem:to:")) {
			String[] contentArr = gotMessage.split(":");
			Integer otherNo = Integer.parseInt(contentArr[2]);
			String pmContent = contentArr[3];
			System.out.println("★" + customer_no + "번 회원이 " + otherNo + " 번 회원에게 메세지를 보냅니다. ★");
			thisCustomer = customerController.findCustomerByNo(customer_no);
			otherCustomer = customerController.findCustomerByNo(otherNo);
			newPm.setSend(thisCustomer); newPm.setReceive(otherCustomer);
			newPm.setContent(pmContent); newPm.setStatus(0);
			newPm.setCreateDate(new Timestamp(System.currentTimeMillis()));
			//repository에 인서트
			pmController.save(newPm);
			System.out.println("★새로 전송한 personal message를 디비에 insert 했습니다. ★");
			//상대방에게 메세지 전송
			WebSocketSession receiveSession = loginUserMap.get(otherNo);
			String sendPmJson = "connecthinksystem:pm:";
			sendPmJson += mapper.writeValueAsString(newPm);
			System.out.println("이 메세지를 보낼거예요 : " + sendPmJson);
			if(receiveSession!=null) {
				//접속 중일 때 상대방에게 실시간으로 전송하고 상대방의 pmList에 추가
				receiveSession.sendMessage(new TextMessage(sendPmJson));
				if(!pmMap.get(otherNo).containsKey(customer_no)) {
					pmMap.get(otherNo).put(customer_no, new ArrayList<PersonalMessage>());
				}
				pmMap.get(otherNo).get(customer_no).add(newPm);
				System.out.println("★ 상대방이 접속 중이라 실시간으로 메세지 전송 완료. ★");
			}
			session.sendMessage(new TextMessage(sendPmJson));
			//해당 유저의 pmList에 메세지 추가
			if(!pmMap.get(customer_no).containsKey(otherNo)) {
				pmMap.get(customer_no).put(otherNo, new ArrayList<PersonalMessage>());
			}
			pmMap.get(customer_no).get(otherNo).add(newPm);
		}
		//4. 노티 보내기
		if(gotMessage.contains("connecthinksystem:nto:")) {
			String[] contentArr = gotMessage.split(":");
			Integer otherNo = Integer.parseInt(contentArr[2]);
			String pmContent = contentArr[3];
			thisCustomer = customerController.findCustomerByNo(customer_no);
			otherCustomer = customerController.findCustomerByNo(otherNo);
			pmContent = thisCustomer.getName() + pmContent;
			newNoti.setCustomer(otherCustomer); newNoti.setContent(pmContent);
			newNoti.setRead_status(0);
			newNoti.setNotifyDate((new Timestamp(System.currentTimeMillis())));
			//repository에 인서트
			notiController.save(newNoti);
			WebSocketSession receiveSession = loginUserMap.get(otherNo);			
			String sendPmJson = "connecthinksystem:pm:";
			sendPmJson += mapper.writeValueAsString(newNoti);
			if(receiveSession!=null) {
				//접속 중일 때 실시간 전송
				receiveSession.sendMessage(new TextMessage(sendPmJson));
				System.out.println("★ 상대방이 접속 중이라 실시간으로 메세지 전송 완료. ★");
			}
			session.sendMessage(new TextMessage(sendPmJson));
			notiMap.get(otherNo).add(newNoti);			
		}
	}

	@Override
	//클라이언트에서 연결을 종료 할 경우
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		Integer customer_no = (Integer)session.getAttributes().get("loginInfo");
		loginUserMap.remove(customer_no);
	}

	//get 메소드
	public Map<Integer, WebSocketSession> getLoginUserMap() {
		return loginUserMap;
	}


	public Map<Integer, Map<Integer, List<PersonalMessage>>> getPmMap() {
		return pmMap;
	}


	public Map<Integer, List<Notification>> getNotiMap() {
		return notiMap;
	}
	
}
