package com.connecthink.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.connecthink.controller.BoardController;
import com.connecthink.controller.CustomerController;
import com.connecthink.entity.Customer;
import com.connecthink.entity.Message;
import com.fasterxml.jackson.databind.ObjectMapper;

public class webSocketHandler extends TextWebSocketHandler{
	
	@Autowired
	private BoardController boardController;
	
	@Autowired
	private CustomerController customerController;

	//key -> websocketID | value -> customer_no (HttpSession)
	Map<WebSocketSession, Integer> logUser = new HashMap<WebSocketSession, Integer>();
	
	//message box
	List<Message> messageLog = new ArrayList<Message>();
	
	//chat room Info
	List<Map<Integer,List<Message>>> messageList = new ArrayList<Map<Integer,List<Message>>>();
	
	//key -> project_no value -> List<customer_no>
	Map<Integer, List<Integer>> logMember = new HashMap<Integer, List<Integer>>();
	
	//메세지 배열 구분자
	final String DIVISION = "NEW MESSAGE";
	Message diviMsg = new Message();
	
	@Override
	//클라이언트 에서 접속을 성공할때 발생
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
			//handShakeInterceptor 에서 추가한 Httpsesion 값 가져오기
			int customer_no = (Integer)session.getAttributes().get("loginInfo");
			
			//접속한 유저의 웹소캣 id & 해당 유저의 HttpSession 에 저장되어 있는 userId
			logUser.put(session,customer_no);
			System.out.println("접속함 : "+customer_no);
			
			//제대로 가져왔는지 확인
			System.out.println("HttpSession ID : "+customer_no+" webSocketID : "+session.getId()+" 접속");
			
			session.sendMessage(new TextMessage("userid:"+customer_no));
		
	}
	
	@Override
	//클라이언트 에서 send 메소드를 이용하여 메세지 전송을 한 경우
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
		
			int chatCnt = 0;
			//client 접속시 이전 message log가 배열의 존재하는지 여부를 알기위해
			if(message.getPayload().contains("ready")) {
				String [] logs = message.getPayload().split(":");
				int project_no = Integer.parseInt(logs[1]);
				
				//접속자의 프로젝트 넘버의 해당하는 메세지 배열이 존재하는지 유효성
				for(Map<Integer,List<Message>> msgList : messageList) {
					//존재 할 경우
					if(msgList.containsKey(project_no)) {
						System.out.println("방존재");
						if(msgList.get(project_no).size() != 0 ) {
							System.out.println("000000000000000000000존재한다");
							int newMsgIndex = msgList.get(project_no).lastIndexOf(diviMsg)+1;
							System.out.println(newMsgIndex);
							//해당 메세지 리스트 의 작성자 와 글 내용 보내주기
							for(Message msg : msgList.get(project_no)) {
								if(!msg.getContent().equals(DIVISION)) {
									String writerName = getName(msg.getWriter().getCustomerNo());
									session.sendMessage(new TextMessage(msg.getWriter().getCustomerNo()+":"+msg.getContent()+":"+msg.getCreateDate()+":"+writerName));
									System.out.println(msg.getWriter().getName());
								}
							}
						}
						chatCnt++;
					}
				}
				
				//존재하지 않을경우 메세지 배열 생성
				if(chatCnt == 0) {
					System.out.println(project_no+"채팅 배열 없음");
					
					//메세지를 담을 리스트
					List<Message> msgBox = new ArrayList<Message>();
					
					//DB에서 해당 프로젝트 메세지 들고오기
					msgBox = boardController.lookUpMsg(project_no);
					if(msgBox.size() != 0) {
						for(Message msg : msgBox) {
							session.sendMessage(new TextMessage(msg.getWriter().getCustomerNo()+":"+msg.getContent()+":"+msg.getCreateDate()+":"+msg.getWriter().getName()));
						}
						//구분자 메세지 넣어주기
						diviMsg.setContent(DIVISION);
						msgBox.add(diviMsg);
					}
					
					//담은 메세지를 key -> (프로젝트 번호), value -> (List<Message) 맵
					Map<Integer,List<Message>> msgMap = new HashMap<Integer,List<Message>>();
					msgMap.put(project_no, msgBox);
					messageList.add(msgMap);
					
					System.out.println(project_no +"채팅 배열 생성");
					System.out.println(messageList.size()+"개 채팅방 있음");
					for(Map<Integer,List<Message>> map : messageList){
						Set set = map.keySet();

						Iterator iterator = set.iterator();
						while(iterator.hasNext()){
							  int key = (int) iterator.next();
							  System.out.println("project_no 방 존재함 : " + key);
							}
					}
					chatCnt = 0;
				}
				if(logMember.containsKey(project_no)) {//해당 프로젝트 넘버의 해당하는 배열이 있을경우
					logMember.get(project_no).add(getUserId(session));
				}else {//없을경우 배열을 생성해서 배열안에 접속중인 customer_no 를 넣고 그 배열을 map 에 넣어준다
					List<Integer> members = new ArrayList<Integer>();
					members.add(getUserId(session));
					logMember.put(project_no,members);
				}
				
			}else {
				ObjectMapper mapper = new ObjectMapper();
				
				//Message Setting
				
				//보낸 사람 설정
				int sender = getUserId(session);
				
				//입력받은 메세지를 message entity json 으로 파싱
				Message msgParsing = mapper.readValue(message.getPayload(), Message.class);
				
				//작성자 정보를 customer entity 로 파싱
				Customer ct = new Customer();
				int project_no = Integer.parseInt(msgParsing.getProject_no());
				ct.setCustomerNo(sender);
				ct.setName(getName(sender));
				
				//파싱한 메세지 객체에 작성자 세팅
				msgParsing.setWriter(ct);
				
				for(Map.Entry<WebSocketSession,Integer> ws : logUser.entrySet()) {
					
					List<Integer> teamArray = new ArrayList<Integer>();
					for(Map.Entry<Integer,List<Integer>> entry : logMember.entrySet()){
							if(project_no == entry.getKey()) {
								teamArray = entry.getValue();
							}
					}
					
					//작성자를 제외한 모든 클라이언트 + 작성자와 같은 프로젝트 넘버의 유저에게만 메세지 전송
					for(int member_no : teamArray) {
						if(member_no ==  ws.getValue()&& !ws.getKey().getId().equals(session.getId())) {
							System.out.println("message send Info----");
							System.out.println(msgParsing.getCreateDate()+"시 분 ");
							System.out.println(msgParsing.getWriter().getName());
							System.out.println(member_no+"에게 "+msgParsing.getContent()+"내용 을"+msgParsing.getWriter().getCustomerNo()+"전송");
							ws.getKey().sendMessage(new TextMessage(sender+":"+msgParsing.getContent()+":"+msgParsing.getCreateDate()+":"+msgParsing.getWriter().getName()));
							
						}//if
					}//for
				  	
				}//for
				
				//messageList value -> List<Message> add
				for(Map<Integer,List<Message>> msgList : messageList) {
					if(msgList.containsKey(project_no)) {
						msgList.get(project_no).add(msgParsing);
						System.out.println(msgParsing.getContent()+"내용이 "+project_no+"방에 저장");
						System.out.println(msgList.get(project_no).size()+"개 대화 있음");
						System.out.println(messageList.size()+"개 채팅방 있음");
						chatCnt++;
					}// list add
				}//for - list add
			}
		}//boardChat 동준
//boardEcho 동준
		//handleTextMessage
	//handleTextMessage

	@Override
	//클라이언트 에서 연결을 종료 할 경우
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
			int logOutUser = getUserId(session);
			System.out.println(logOutUser+"접속 해제");
			for(Map.Entry<Integer,List<Integer>> entry : logMember.entrySet()){
				for(int ctno : entry.getValue()) {
					System.out.println("outInfo");
					System.out.println("ctno : "+ctno);
					System.out.println("logOutUser : "+logOutUser);
					if(ctno == logOutUser) {
						//해당 프로젝트의 마지막 접속자가 나갈경우
						if(entry.getValue().size() == 1) {
							System.out.println("마지막 접속자임");
							Thread.sleep(3000);
							// DB Insert + message list 초기화
							messageList.forEach(map -> {
								//해당 프로젝트의 메세지 리스트가 존재 할 경우 즉 메세지가 있을경우 DB INSERT
								if(map.get(entry.getKey()) != null) {
									System.out.println("db실행할꺼임");
									System.out.println("보낼 메세지 함 리스트 : "+map.get(entry.getKey()).size());
									System.out.println("diviMsg 값이 NEW STRING 이면 초기화 된거임 : "+diviMsg.getContent());
									int index = map.get(entry.getKey()).lastIndexOf(diviMsg)+1;
									int arrayCnt = map.get(entry.getKey()).size();
									System.out.println("구분자 index : "+index);
									List<Message> newMsgs = new ArrayList<Message>();
									for(;index<arrayCnt;index++) {
										newMsgs.add(map.get(entry.getKey()).get(index));
									}
									boardController.sendMsg(entry.getKey(),newMsgs);
								}
								map.remove(entry.getKey());
							});
							//key : project_no, value : List<customer_no> 마지막 유저의 맴버이기 때문에 해당 프로젝트 번호로 data 삭제
							logMember.remove(entry.getKey());
							
							//접속자 구분을 둔 logUser 에서 접속해제 하려는 클라이언트 정보 삭제
							logUser.remove(session);
							break;
						}else {
							//맴버 정보가 담겨있는 리스트에서 현재 접속해제 하려는 클라이언트 정보 index 찾기
							int index = entry.getValue().indexOf(ctno);
							
							//찾은 index 로 접속해제 클라이언트 정보 삭제
							entry.getValue().remove(index);
							
							System.out.println("맴버 정보 배열 삭제 후 사이즈 : "+entry.getValue().size());
							//접속자 구분을 둔 logUser 에서 접속해제 하려는 클라이언트 정보 삭제
							logUser.remove(session);
							System.out.println("session 삭제");
							break;
						}//else
					}//if
				}//for			
			}//for
		}//afterConnectionClosed
	
	//현재 접속자 ws로 id값 얻기
	private int getUserId(WebSocketSession session) {
		int customer_no = 0;
		for(WebSocketSession ws : logUser.keySet()) {
			if(ws.getId().equals(session.getId())) {
				customer_no = logUser.get(ws);
			}
		}
		return customer_no;
	}//getUserId
	
	private String getName(int customer_no) {
		return customerController.findByNo(customer_no).getName();
	}
}
