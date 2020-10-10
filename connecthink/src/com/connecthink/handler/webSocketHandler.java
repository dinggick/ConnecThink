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
			
			//접속자의 customer_no 를 클라이언트 에게 전송
			session.sendMessage(new TextMessage("userid:"+customer_no));
	}
	
	@Override
	//클라이언트 에서 send 메소드를 이용하여 메세지 전송을 한 경우
	protected void handleTextMessage(WebSocketSession session,TextMessage message) throws Exception{
			
			int chatCnt = 0;
		
			if(message.getPayload().contains("taskInfo")) {
				String [] tasks  = message.getPayload().split(":");
				String doWhat = tasks[1];
				System.out.println("@@@@@@@@@@@@@@@@@@@");
				System.out.println(doWhat);
				System.out.println(message.getPayload());
				System.out.println(doWhat.equals("update"));
				int projectNo = Integer.parseInt(tasks[2]);
				System.out.println(projectNo);
				for(Map.Entry<WebSocketSession,Integer> ws : logUser.entrySet()) {						
						List<Integer> teamArray = new ArrayList<Integer>();
						for(Map.Entry<Integer,List<Integer>> entry : logMember.entrySet()){
								if(projectNo == entry.getKey()) {
									teamArray = entry.getValue();
								}
						}
						
						//작성자를 제외한 모든 클라이언트 + 작성자와 같은 프로젝트 넘버의 유저에게만 메세지 전송
						for(int member_no : teamArray) {
							if(member_no ==  ws.getValue()&& !ws.getKey().getId().equals(session.getId())) {
								if(doWhat.equals("add")) {
									System.out.println("설마여기들어오는거야?");
									String content = tasks[3];
									int taskNo = Integer.parseInt(tasks[4]);
									int status = Integer.parseInt(tasks[5]);
									String name = tasks[6];
									int taskWriterNo = Integer.parseInt(tasks[7]);
									
									ws.getKey().sendMessage(new TextMessage("taskInfo:add:"+content+":"+taskNo+":"+status+":"+name+":"+taskWriterNo));
								}
								//task Update
								else if(doWhat.equals("update")) {
									System.out.println("update 들어옴@@@@@@@@");
									int taskNoForUpdate = Integer.parseInt(tasks[3]);
									String contentForUpdate = tasks[4];
									ws.getKey().sendMessage(new TextMessage("taskInfo:update:"+taskNoForUpdate+":"+contentForUpdate));
								}
								//task drag & drop
								else if(doWhat.equals("d&d")) {
									System.out.println("drag & drop 들어옴@@@@@@@@");
									int taskNoForDD = Integer.parseInt(tasks[3]);
									int taskStatusForDD = Integer.parseInt(tasks[4]);
									
									ws.getKey().sendMessage(new TextMessage("taskInfo:d&d:"+taskNoForDD+":"+taskStatusForDD));
								}
								//task delete 
								else {
									System.out.println("delete 들어옴@@@@@@@@");
									int taskNoForDelete = Integer.parseInt(tasks[3]);
									ws.getKey().sendMessage(new TextMessage("taskInfo:delete:"+taskNoForDelete));
								}
							}//if
						}//for
					}//for
					
			}//taskMessage
			
			//client 최초 접속시 이전 message log가 배열의 존재하는지 여부를 알기위해
			else if(message.getPayload().contains("ready")) {
				
				String [] logs = message.getPayload().split(":");
				int project_no = Integer.parseInt(logs[1]);
				if(logMember.containsKey(project_no)) {//해당 프로젝트 넘버의 해당하는 배열이 있을경우
					logMember.get(project_no).add(getUserId(session));
					
					//해당 프로젝트 넘버의 자료구조가 있는경우 접속중인 맴버 정보들을 같은 프로젝트 유저들에게 전송
					for(Map.Entry<WebSocketSession,Integer> ws : logUser.entrySet()) {
						for(int member : logMember.get(project_no)) {
							if(ws.getValue() == member) {
								ws.getKey().sendMessage(new TextMessage("loginInfo:"+logMember.get(project_no)));
							}
						}
					}
					
				}else {//없을경우 배열을 생성해서 배열안에 접속중인 customer_no 를 넣고 그 배열을 map 에 넣어준다
					List<Integer> members = new ArrayList<Integer>();
					members.add(getUserId(session));
					logMember.put(project_no,members);
					
					//해당 프로젝트 넘버의 자료구조가 없는 경우 는 최초의 접속 이므로 본인이 접속했다는 걸 알리기 위해 생성한 members List 보냄
					session.sendMessage(new TextMessage("loginInfo:"+members));
				}
				
				
				
				//접속자의 프로젝트 넘버의 해당하는 메세지 배열이 존재하는지 유효성
				for(Map<Integer,List<Message>> msgList : messageList) {
					//존재 할 경우
					if(msgList.containsKey(project_no)) {
						if(msgList.get(project_no).size() != 0 ) {
							int newMsgIndex = msgList.get(project_no).lastIndexOf(diviMsg)+1;
							
							//해당 메세지 리스트 의 작성자 와 글 내용 보내주기
							for(Message msg : msgList.get(project_no)) {
								if(!msg.getContent().equals(DIVISION)) {
									String writerName = getName(msg.getWriter().getCustomerNo());
									session.sendMessage(new TextMessage(msg.getWriter().getCustomerNo()+":"+msg.getContent()+":"+msg.getCreateDate()+":"+writerName));
								}
							}
							//메세지를 클라이언트 에게 모두 보냈음을 구분하는 메세지
							session.sendMessage(new TextMessage("loadingCompleate:"));
						}
						chatCnt++;
					}
				}
				
				//존재하지 않을경우 메세지 배열 생성
				if(chatCnt == 0) {
					
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
					
					//메세지를 클라이언트 에게 모두 보냈음을 구분하는 메세지
					session.sendMessage(new TextMessage("loadingCompleate:"));
					
					
					//담은 메세지를 key -> (프로젝트 번호), value -> (List<Message) 맵
					Map<Integer,List<Message>> msgMap = new HashMap<Integer,List<Message>>();
					msgMap.put(project_no, msgBox);
					messageList.add(msgMap);
					
					for(Map<Integer,List<Message>> map : messageList){
						Set set = map.keySet();

						Iterator iterator = set.iterator();
						while(iterator.hasNext()){
							  int key = (int) iterator.next();
							}
					}
					chatCnt = 0;
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
							ws.getKey().sendMessage(new TextMessage(sender+":"+msgParsing.getContent()+":"+msgParsing.getCreateDate()+":"+msgParsing.getWriter().getName()));
							
						}//if
					}//for
				  	
				}//for
				
				//messageList value -> List<Message> add
				for(Map<Integer,List<Message>> msgList : messageList) {
					if(msgList.containsKey(project_no)) {
						msgList.get(project_no).add(msgParsing);
						chatCnt++;
					}// list add
				}//for - list add
			}
		}//boardChat 동준
	
	@Override
	//클라이언트 에서 연결을 종료 할 경우
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
			int logOutUser = getUserId(session);
			for(Map.Entry<Integer,List<Integer>> entry : logMember.entrySet()){
				for(int ctno : entry.getValue()) {
					if(ctno == logOutUser) {
						
						//접속 해제 전 같은 프로젝트 클라이언트 에게 접속해제 알림
						for(Map.Entry<WebSocketSession,Integer> ws : logUser.entrySet()) {
									//로그아웃 하는 유저와 같은 프로젝트의 유저
									for(int user : entry.getValue()) {
										if(ws.getValue() != logOutUser && ws.getValue() == user) {
											//웹소캣에 저장되어 있는 value(customer_no) 와 로그아웃 하는 유저와 같은 프로젝트의 유저가 같을 경우 = 같은 프로젝트 유저의 ws
											ws.getKey().sendMessage(new TextMessage("logoutInfo:"+logOutUser));
										}
									}
						}
						
						//해당 프로젝트의 마지막 접속자가 나갈경우
						if(entry.getValue().size() == 1) {
							// DB Insert + message list 초기화
							messageList.forEach(map -> {
								//해당 프로젝트의 메세지 리스트가 존재 할 경우 즉 메세지가 있을경우 DB INSERT
								if(map.get(entry.getKey()) != null) {
									int index = map.get(entry.getKey()).lastIndexOf(diviMsg)+1;
									int arrayCnt = map.get(entry.getKey()).size();
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
							
							//접속자 구분을 둔 logUser 에서 접속해제 하려는 클라이언트 정보 삭제
							logUser.remove(session);
							break;
						}//else
					}//if
				}//for			
			}//for
		}//afterConnectionClosed
	
	//현재 접속자 WebSocketSession 로 id값 얻기
	private int getUserId(WebSocketSession session) {
		int customer_no = 0;
		for(WebSocketSession ws : logUser.keySet()) {
			if(ws.getId().equals(session.getId())) {
				customer_no = logUser.get(ws);
			}
		}
		return customer_no;
	}
	
	//접속한 유저의 이름 가져오기
	private String getName(int customer_no) {
		return customerController.findCustomerByNo(customer_no).getName();
	}
}
