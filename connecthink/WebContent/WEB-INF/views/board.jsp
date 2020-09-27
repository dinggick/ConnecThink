<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${requestScope.list}"/>	
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.min.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">


<style>
body {
  font-family: sans-serif;
  color: #172b4d;
  background-color: #0279bf;
  display: flex;
  align-items: start;
}

div {
  border-radius: 3px;
}

#dashBoard {
  display: flex;
  align-items: start;
}

.title {
  text-align:center;
  font-weight: 1000;
  margin: 2px;
  padding: 5px;
}

.editable {
  user-select: none;
  outline: none;
  margin: 7px;
  padding: 30px;
  cursor: pointer !important;
  display: flex;
  justify-content: space-between;
}
.card {
  background: white;
  border-bottom: 1px solid #aaa;
}

.todo,.doing,.done {
  min-width: 300px;
  margin: 10px 5px;
  position: relative;
  background: #dfe1e6;
}


.add-task {
  width: calc(100% - 35px);
  display: inline-block;
  padding: 10px;
  margin-top: 0px;
  color: gray;
  text-decoration: none;
/*   border-bottom: 1px solid #dfe1e6; */
}

.add-task:hover {
  background-color: rgba(9,30,66,.13);
}

.del {
  font-weight: 600;
  color: gray;
}



/* chat css */
.allUsersList {
	width: 300px;
	margin: 20px;
}

.allUsersList .card-header {
	background: #683db8;
	color: #FFF;
	padding: 10px;
	border-radius: 5px;
}

.allUsersList .image img {
	border-radius: 16px;
}

.usersChatList {
	position: fixed;
	width: 250px;
	bottom: 0;
	margin-bottom: 0;
	right: 360px;
}

.show {
	display: block;
}

.thumb-user-list {
	display: none;
}

.thumb-user-list .image img {
	border-radius: 30px;
}

.usersChatList .card-header {
	border-radius : 5px;
	background: #683db8;
	font-size: 13px;
}

.chatBox {
	position: absolute;
	bottom: 0;
	right: 0;
	width: 400px;
	margin: 60px;
	margin-bottom: 0;
	font-size: 13px;
}

.chat-content {
	overflow: auto;
	height: 300px;
}

.chatBox .ChatCard {
	background-color: #ffffff;
	border-radius: 4px;
}

.chatBox .card-header {
	background: #683db8;
}

.header-title {
	height: 50px;
}

.card-header-title i {
	font-size: 10px;
	color: #32e4cd;
	margin-right: 6px;
}

.card-header .card-header-title {
	color: #FFF;
}

.chat-content small {
	margin: 0;
}

.chat-content p {
	background: #ecf1f8;
	padding: 10px;
	border-radius: 8px;
	margin-bottom: 0;
}

.my-content .media-content {
	width: 80%;
}

.my-content .message {
	float: right;
	background: #683db8;
	color: #FFF;
	text-align: right;
	padding: 10px;
	margin-bottom: 4px;
	font-size: 13px;
}

.my-content .chat-content small {
	float: right;
}

.my-content small {
	display: block;
	float: right;
	width: 100%;
	text-align: right;
}

.chat-textarea {
	font-size: 14px;
	padding: 8px;
	height: 40px;
	width: 100%;
	border: none;
	overflow: auto;
	outline: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	resize: none;
}

.chat-message-group {
	
}

.chat-message-group .chat-thumb {
	float: left;
	width: 18%;
}

.chat-message-group .chat-messages {
	float: left;
	width: 80%;
	margin-bottom: 20px;
}

.chat-message-group .message {
	float: left;
	padding: 10px;
	background: #ecf1f8;
	font-size: 13px;
	border-radius: 5px;
	margin-bottom: 3px;
}

.chat-messages .from {
	float: left;
	display: block;
	width: 100%;
	text-align: left;
	font-size: 11px;
}

.chat-thumb img {
	border-radius: 40px;
}

.writer-user .chat-messages {
	float: right;
	width: 100%;
}

.writer-user .chat-messages .message {
	float: right;
	background: #683db8;
	color: #FFF;
	margin : 10px;
}

.writer-user .chat-messages .from {
	float: left;
	display: block;
	width: 100%;
	text-align: right;
}

.chat-message-group .typing {
	float: left;
}

.chatBox .card-header-icon i {
	color: #FFF;
	font-size: 13px;
}
/* CSSS */
.outside-box {
	height: 100px;
	background: #F8C;
	width: 200px;
	margin: 20px;
	overflow: auto;
}

.outside-box .content-insider {
	height: 300px;
	background: #C9C;
}
/* CSS Spinner */
.spinner {
	margin: 0 30px;
	width: 70px;
	text-align: center;
}

.spinner>div {
	width: 4px;
	height: 4px;
	background-color: #888;
	border-radius: 100%;
	display: inline-block;
	-webkit-animation: sk-bouncedelay 1.4s infinite ease-in-out both;
	animation: sk-bouncedelay 1.4s infinite ease-in-out both;
}

.spinner .bounce1 {
	-webkit-animation-delay: -0.32s;
	animation-delay: -0.32s;
}

.spinner .bounce2 {
	-webkit-animation-delay: -0.16s;
	animation-delay: -0.16s;
}

@
-webkit-keyframes sk-bouncedelay { 0%, 80%, 100% {
	-webkit-transform: scale(0)
}

40


%
{
-webkit-transform


:


scale
(


1
.0


)


}
}
@
keyframes sk-bouncedelay { 0%, 80%, 100% {
	-webkit-transform: scale(0);
	transform: scale(0);
}

40


%
{
-webkit-transform


:


scale
(


1
.0


)
;


transform


:


scale
(


1
.0


)
;


}
}
/* EmojiBox */
.emojiBox {
	width: 150px;
	margin: 30px;
}

.emojiBox .box {
	height: 100px;
	padding: 4px;
}
/* */
.card-header-title img {
	border-radius: 40px;
}

.vueJsCss {
	font-size: 30px;
}

.vueJsCss2 {
	color: gray;
}

.reception{
	margin: 20px -20px
}

/*******************변재영역 css************************ */
#dashBoard{
	padding-top:5%;
	margin-left: 15%;
}

.todo{
	margin-right: 20%;
}
.doing{
	margin-right: 20%;
}
.done{
	margin-right: 20%;
}
	
#wrapper {
    padding-left: 0;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#wrapper.toggled {
    padding-left: 250px;
}

#sidebar-wrapper {
    z-index: 1000;
    position: fixed;
    top:0;
    left: 250px;
    width: 0;
    height: 100%;
    margin-left: -250px;
    overflow-y: auto;
    background: #CEE3F6;
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    transition: all 0.5s ease;
}

#wrapper.toggled #sidebar-wrapper {
    width: 250px;
}

#page-content-wrapper {
    width: 100%;
    position: absolute;
    padding: 15px;
}

#wrapper.toggled #page-content-wrapper {
    position: absolute;
    margin-right: -250px;
}

/* Sidebar Styles */

.sidebar-nav {
    position: absolute;
    top: 0;
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
}

.sidebar-nav>li{
    text-indent: 20px;
    line-height: 20px;
    margin-bottom: 20px;
}

.sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: black;
}

.sidebar-nav li a:hover {
    text-decoration: none;
    color: black;
    background: rgba(255,255,255,0.2);
}

.sidebar-nav li a:active,
.sidebar-nav li a:focus {
    text-decoration: none;
}

.sidebar-nav > .sidebarTeamName {
    height: 65px;
    font-size: 20px;
    line-height: 60px;
}

.sidebar-nav > .sidebarTeamName a {
    color: #999999;
}

.sidebar-nav > .sidebarTeamName a:hover {
    color: #fff;
    background: none;
}

@media(min-width:900px) {
    #wrapper {
        padding-left: 250px;
    }

    #wrapper.toggled {
        padding-left: 0;
    }

    #sidebar-wrapper {
        width: 270px;
    }

    #wrapper.toggled #sidebar-wrapper {
        width: 0;
    }

    #page-content-wrapper {
        padding: 20px;
        position: relative;
    }

    #wrapper.toggled #page-content-wrapper {
        position: relative;
        margin-right: 0;
    }
}

.menutoggle{
	text-decoration: none;
	font-size: 3em;
	color: rgba(0, 0, 0, 0.61);
	-webkit-transition: all 0.15s ease-out 0;
	-moz-transition: all 0.15s ease-out 0;
	transition: all 0.45s ease-out 0;
	position: fixed;
	top: 10px;
	left: 20px;
	z-index: 1;
	cursor: pointer;
}

.usty{
	 list-style:none;
	 padding-left:0px;
}

/* profile */

.friend{
	height:70px;
	border-bottom:1px solid #e7ebee;		
	position:relative;
}
.friend:hover{
	background:#f1f4f6;
	cursor:pointer;
}
.friend img{
	width:40px;
	border-radius:50%;
	margin:15px;
	float:left;
}
.floatingImg{
	width:40px;
	border-radius:50%;
	position:absolute;
	top:0;
	left:12px;
	border:3px solid #fff;
}
.friend p{

}
.friend p strong{
  font-weight:600;
  font-size:15px;
	color:#597a96;  

}
.friend p span{
	font-size:13px;
	font-weight:400;
	color:#aab8c2;
}
.friend .status{
	background:#26c281;
	border-radius:50%;	
	width:9px;
	height:9px;
	position:absolute;
	top:31px;
	right:17px;
}

.friend .status.offline{background:#ffce54;}

</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-draggable@1.0.9/lib/vue-draggable.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<meta charset="UTF-8">
<title>board.jsp</title>
</head>
<body>
	<!-- Sidebar -->
	<a href="#menu-toggle" class="menutoggle" id="menu-toggle">☰</a>

	<div id="sidebar-wrapper" style="display: none">
		<ul class="sidebar-nav" id="haha">
			<li class="sidebarTeamName">
				<a href="#" id="down">This is Team Name</a>
			</li>
			<li v-for="member in memberList">
				<div class="friend">
					<img src="https://cdn.clien.net/web/api/file/F01/9857567/225ef14007e0b0.jpg" />
					<div class="profile">
						<p><strong>{{member.name}}</strong></p>
						<p><span>{{member.position}}</span></p>
					</div>
					<div v-if=msg.isOnline class="status online"></div>
					<div v-else class="status offline"></div>
				</div>
			</li>
			
			<li>
				<div class="friend">
					<img src="https://t1.daumcdn.net/cfile/blog/2559E33B51368FEF02" />
					<div class="profile">
						<p><strong>Modify</strong></p>
						<p><span>Web God</span></p>
					</div>
					<div class="status offline"></div>
				</div>
			</li>

			<li>
				<div class="friend">
					<img src="https://pbs.twimg.com/media/EB5Pq3rVUAAYjxI.jpg" />
					<div class="profile">
						<p><strong>Ggugi</strong></p>
						<p><span>Web Developer</span></p>
					</div>
					<div class="status online"></div>
				</div>
			</li>

			<li>
				<div class="friend">
					<img src="https://t1.daumcdn.net/liveboard/realty/b0516b5193334bd089651b49b52d7655.png" />
					<div class="profile">
						<p><strong>Seo Kang-Joon</strong></p>
						<p><span>git God</span></p>
					</div>
					<div class="status online"></div>
				</div>
			</li>

			<li>
				<div class="friend">
					<img src="https://cphoto.asiae.co.kr/listimglink/6/2020062421493324321_1593002973.png" />
					<div class="profile">
						<p><strong>Dlwlrma</strong></p>
						<p><span>God</span></p>
					</div>
					<div class="status offline"></div>
				</div>
			</li>

			<li>
				<div class="friend">
					<img src="https://pbs.twimg.com/profile_images/1274215735070343168/e0rgTWHp_400x400.jpg" />
					<div class="profile">
						<p><strong>Ji Chu</strong></p>
						<p><span>Buddha</span></p>
					</div>
					<div class="status"></div>
				</div>
			</li>
			<li><a v-on:click="endProject">프로젝트 종료</a></li>
		</ul>
	</div>



	<div id="dashBoard" v-drag-and-drop:options="options">
		<!-- 상세 내용 모달 -->
		<div class="modal fade" id="contentModal" tabindex="-1" role="dialog"
			aria-labelledby="loginModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="mt-10">
							<input id="inputInModal" v-model="updateText" name="text" required class="single-input"> 
							<input type="hidden" id="taskNo" value="">
							<input type="hidden" id="cusNo" value="">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" v-on:click="updateContent" data-dismiss="modal">수정하기</button>
						<button type="button" class="btn btn-secondary" v-on:click="deleteTask" data-dismiss="modal">삭제하기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- 대쉬보드 영역 -->
		<div class="todo" id="do">
			<div class="title">
				TO DO
				<div class="content">
					<ul class="usty section1" id="sectionOneStatus" value="1">
						<li v-for="(item,index) in lists">
							<div class='card editable'>
								<a data-toggle="modal" href="#contentModal" v-on:click="goModal">
									<input type="hidden" :value="item.taskNo"> 
									<input type="hidden" :value="item.cusNo">
									{{item.content}},{{item.taskNo}},{{item.cName}},{{item.cusNo}}
								</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="add-task">
					<input v-model="addName" required class="single-input">
					<button v-on:click="goTask">작업 추가하기</button>
				</div>
			</div>
		</div>

		<div class="doing" id="doing">
			<div class="title">
				Doing
				<div class="content">
					<ul class="usty section2" id="sectionTwoStatus" value="2">
						<li v-for="(item,index) in list2">
							<div class='card editable'>
								<a data-toggle="modal" href="#contentModal" v-on:click="goModal">
									<input type="hidden" :value="item.taskNo"> <input type="hidden" :value="item.cusNo">
									{{item.content}},{{item.taskNo}},{{item.cName}},{{item.cusNo}}
								</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="add-task">
					<input v-model="addName1">
					<button v-on:click="goTask">작업 추가하기</button>
				</div>
			</div>
		</div>

		<div class="done" id="done">
			<div class="title">
				Done
				<div class="content">
					<ul class="usty section3" id="sectionThreeStatus" value="3">
						<li v-for="(item,index) in list3">
							<div class='card editable'>
								<a data-toggle="modal" href="#contentModal" v-on:click="goModal">
									<input type="hidden" :value="item.taskNo"> <input type="hidden" :value="item.cusNo">
									{{item.content}},{{item.taskNo}},{{item.cName}},{{item.cusNo}}
								</a>
							</div>
						</li>
					</ul>
				</div>
				<div class="add-task">
					<input v-model="addName2">
					<button v-on:click="goTask">작업 추가하기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- chat -->
		<div id="chatApp">

			<div class="chatBox" id="chatBox">
				<div class="ChatCard">

					<!-- chat Title -->
					<header class="card-header header-title" @click="toggle = !toggle">
						<p class="card-header-title">
							<i class="fa fa-circle is-online"></i><img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT2s9HDKipReXD4JCwZtvwq21UdaVbif2z2QQ&usqp=CAU"
								style="width: 30px;">&nbsp;{{headUser}}
						</p>
					</header>

					<!-- chat Content -->
					<div  v-show='toggle'>
						<div id="chatbox-area">
							<div class="card-content chat-content" onscroll="chat_on_scroll()" id="chatContent">
								<div class="content">
									
									<!-- 메세지 받을때 -->
									
									<div id="msgs" v-for="msg in msgs">
										<div class="chat-message-group reception" v-if="msg.reception">
											<div class="chat-thumb">
												<figure class="image is-32x32">
													<img
														src="https://www.pinclipart.com/picdir/middle/181-1814767_person-svg-png-icon-free-download-profile-icon.png"
														style="width: 30px;">
												</figure>
											</div>
											
											<div class="chat-messages">
												<div>{{msg.writer}}</div>
												<div class="message">{{msg.content}}</div>
												<div class="from">{{msg.createDate}}</div>
											</div>
										</div>
									
										<!-- 메세지 보낼때 -->
										<div class="chat-message-group writer-user" v-else>
											<div class="chat-messages">
												<div class="message">{{msg.content}}</div>
												<div class="from">{{msg.createDate}}</div>
											</div>
										</div>

									</div>

								</div>

							</div>
						</div>
						<footer class="card-footer" id="chatBox-textbox">
							<div>
								<textarea id="chatTextarea" class="chat-textarea"
									v-model.trim="message" placeholder="메세지를 입력 하세요"
									@keypress.enter="sendMsg">
								</textarea>
								
							</div>
							<div class="has-text-centered" style="width: 33%" id="msgBox">
								<button class="button is-white" @click="sendMsg">
									<img
										src="https://image.flaticon.com/icons/svg/1388/1388910.svg"
										style="width: 30px;"> Send
									</button>
							</div>
						</footer>
					</div>
				</div>
			</div>
		</div>

</body>
<script>
	
	var pre_diffHeight = 0;
	var bottom_flag = true;
	
	var chat_on_scroll = function(){
			var chatDiv = document.getElementById("chatContent");
	        if((chatDiv.scrollTop + chatDiv.clientHeight) == chatDiv.scrollHeight){
	                // 채팅창 전체높이 + 스크롤높이가 스크롤 전체높이와 같다면
	                // 이는 스크롤이 바닥을 향해있다는것이므로
	                // 스크롤 바닥을 유지하도록 플래그 설정
	                bottom_flag = true;
	        }

	 if(pre_diffHeight > chatDiv.scrollTop + chatDiv.clientHeight){
	                // 스크롤이 한번이라도 바닥이 아닌 위로 상승하는 액션이 발생할 경우
	                // 스크롤 바닥유지 플래그 해제
	                bottom_flag = false;  
	 }
	        //
	        pre_diffHeight = chatDiv.scrollTop + chatDiv.clientHeight
	};
	
	//채팅 헤더 토글
	var chat = new Vue({
		 el: '#chatApp'
		 ,data : {
		   toggle: true,
		   headUser: '팀 명이 들어갈 곳 입니다.',
		   message : "",
		   msgs : [],
		   wrts : [],
		   memberList : [],
		   project_no : 0,
		   writer : 0
		  }
		  //chatApp.vue가 생성되면 소캣 연결
		  ,created(ev){
			  console.log('created');
			  this.connect();
			  this.project_no = ${project_no};
    		}//created
		  
		   //변화가 있을경우
		  ,updated(){
			var chatDiv = document.getElementById("chatContent");
			
			if(bottom_flag){
				chatDiv.scrollTop = chatDiv.scrollHeight;
				console.log("if들어옴");
			}
			  
		  }
		  ,methods : {
			  
			  //연결해제
			  disconnect(){
				  alert('연결해제');
				  this.socket.close();
				  this.status = "disconnected";
				  this.logs = [];
			  },
			  
			  //메세지 전송 클릭시 유효성 
			  sendMsg(e) {				
				  if(this.message == ''){
					  alert('메세지를 작성 하세요');  
				  }else{
					  myword = this.message;
					  this.send();
				      this.message = '';
				  }				  
			 },//sendMsg 
			 
			 //메세지 전송
			 send(msg){
				 if(this.status == "Connected"){
					 this.msgs.push({createDate : this.getTime(),content : this.message,reception :false});	 
					 //this.socket.send(this.message);
					 var messageForm = {
							 createDate : this.getTime()
							 ,content : this.message
							 ,reception :false
							 ,project_no : this.project_no
					 }
					 this.socket.send(JSON.stringify(messageForm));
				 }else if(this.status == "ready"){					 
					 this.socket.send(msg);
				 }else{
					alert('연결 상태가 올바르지 않습니다.'); 
				 }
			 },
			  //websocket 연결
			  connect(){
				  this.socket = new WebSocket("ws://172.30.1.7:8080/connecthink/chat/boardChat");
				  
				  //onopen
				  this.socket.onopen = () => {
					  this.status = "ready";
					  this.send("ready:"+this.project_no);
					  
					  console.log('connected');
					  this.status = "Connected";
					  //수신 메세지
					  this.socket.onmessage = ({data}) => {
						  console.log("message도착!");
						var datas = data.split(":");
						console.log(datas);
						if(datas[0] == "userid"){
							this.writer = datas[1];
						}else{
							var user = datas[0];
							var msg = datas[1];
							var receptionTime = datas[2]+":"+datas[3];
							//읽어온 데이터가 내가보낸 메세지 일 경우
							if(this.writer == user){
								 this.msgs.push({createDate : receptionTime, content : msg,reception :false});	 
							}else{
								//전송한 사람이 내가 아닐경우
								this.msgs.push({createDate : receptionTime, content : msg,reception :true,writer : user});
							}
							
						}
												
						
					 };//onmessage	

				  };//onopen
			  },
			 
			  //현재 시간 가져오기
			  getTime(){
				  var date = new Date();
				  var minute = date.getMinutes() <= 9 ? "0"+date.getMinutes() : date.getMinutes();
				  var getTime = date.getHours() + ":" +minute;
				  return getTime;
			  },
				
			  //맴버 정보 가져오기
			  showMember(){
				  axios
				  	.get('board/lookUpMemeber', {
				  	    params: {
				  	      project_no: this.project_no
				  	    }
				  	 })
				  	.then(result => {
						  var memberList = result.data;	   
						  memberList.forEach(msg => 
						  	this.memberList.push({name : msg.name,position : msg.position}) 
						  );
				  })//axios
			  }
		  }//method
		});
	
	////////////////////////////////변재 vue.js////////////////////////////////////////////////////////
	var cc = document.getElementById('menu-toggle');
	var cc1 = document.getElementById('sidebar-wrapper');
	var cc2 = document.getElementById('down');
	
	
	cc.onclick = function() { 
		cc1.style.display='block';
	};
	cc2.onclick = function() { 
		cc1.style.display='none';
	};
	

	Vue.use(VueDraggable.default);
	
	var todo = new Vue({
		el: '#dashBoard',
		data: {
			lists:[],
			list2:[],
			list3:[],
			addName:'',
			addName1:'',
			addName2:'',
			project_no : 0,
			updateText:'',
			options:{
				 onDragend(event){
					 console.log(event);
					 
					 if(event.droptarget == null){
						 
					 }
					 
					 console.log('바뀐 영역입니다' + event.droptarget.attributes[1].nodeValue);
					 var getTaskNo = event.items[0].firstChild.firstChild.firstChild.value;
					 console.log('태스크너버' + getTaskNo);
					 axios.get('/connecthink/updateStatus',{
		                	params:{
		                		taskNo:getTaskNo,
		       					status:event.droptarget.attributes[1].nodeValue
		                	}
		             })
		             .then(response => {	
		                
		             });
					 
				 }
			}
		},
		created(){
			axios.get('/connecthink/taskList',{
				params: {
			  	      project_no: ${project_no}
			  	}
            })
            .then(response => {
            	var taskList = response.data;
            	
            	//console.log(taskList);
            	
            	taskList.forEach(task =>{
            		if(task.taskStatus==1){
            			this.lists.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.customer.name,cusNo:task.customer.customerNo});
            		}else if(task.taskStatus==2){
            			this.list2.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.customer.name,cusNo:task.customer.customerNo});
            		}else{
            			this.list3.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.customer.name,cusNo:task.customer.customerNo});	
            		}
            	})
            })
		},
		methods: {
			goModal(ev){
				var taskNo = ev.target.firstChild.value;
				var inputInModal = document.getElementById('inputInModal');
				inputInModal.value = ev.target.innerText;
				var modalTaskNo = document.getElementById('taskNo');
				modalTaskNo.value=taskNo;
				
				//현재 누른 태스크의 고객번호PK가져오기
				var cusNo = ev.target.childNodes[2].attributes[1].nodeValue;
				//모달창
				var cusNoModal = document.getElementById('cusNo');
				cusNoModal.value = cusNo;
				//console.log(taskNo);
				
				//console.log(cusNoModal);
			},
			//태스크 내용 수정하기
			updateContent(){
				var writeCusNo = document.getElementById('cusNo');
				
				axios.get('/connecthink/updateContent',{
                	params:{
       					content:this.updateText,
       					taskNo:document.getElementById('taskNo').value
                	}
                })
                .then(response => {	
                	var taskNoForUpdate = document.getElementById('taskNo').value;
                	this.lists.forEach(t => {
                		if(t.taskNo == taskNoForUpdate) t.content = this.updateText;
                	});
                	this.list2.forEach(t => {
                		if(t.taskNo == taskNoForUpdate) t.content = this.updateText;
                	});
                	this.list3.forEach(t => {
                		if(t.taskNo == taskNoForUpdate) t.content = this.updateText;
                	});
                	this.$forceUpdate();
                });
				
			},
			//태스크 내용 삭제하기
			deleteTask(){
				axios.get('/connecthink/deleteTask',{
                	params:{
       					taskNo:document.getElementById('taskNo').value
                	}
                })
                .then(response => {
                	var taskNoForDelete = document.getElementById('taskNo').value;
                	this.lists.forEach((t, index) => {
                		if(t.taskNo == taskNoForDelete) {
                			this.lists.splice(index, 1);
                			return true;
                		}
                	});
                	this.list2.forEach((t, index) => {
                		if(t.taskNo == taskNoForDelete) {
                			this.list2.splice(index, 1);
                			return true;
                		}
                	});
                	this.list3.forEach((t, index) => {
                		if(t.taskNo == taskNoForDelete) {
                			this.list3.splice(index, 1);
                			return true;
                		}
                	});
                	
                	this.$forceUpdate();
                });
			},
			//태스크 추가하기
			goTask(ev) {
				var status = 0;
				var evPath = ev.path[3].id;	   
				if(evPath == 'do'){
					status = 1;
					axios.get('/connecthink/addTask',{
	                	params:{
	                		content:this.addName,
	                		status:status,
	                		project_no: ${project_no}
	                	}
	                })
	                .then(response => {	
	                	this.lists.push({content:this.addName});
	                	this.$forceUpdate();
	                });
				}else if(evPath == 'doing'){
					status = 2;
					axios.get('/connecthink/addTask',{
	                	params:{
	                		content:this.addName1,
	                		status:status,
	                		project_no: ${project_no}
	                	}
	                })
	                .then(response => {	
	                	this.list2.push({content:this.addName1});
	                	this.$forceUpdate();
	                });
				}else if(evPath == 'done'){
					status = 3;
					axios.get('/connecthink/addTask',{
	                	params:{
	                		content:this.addName2,
	                		status:status,
	                		project_no: ${project_no}
	                	}
	                })
	                .then(response => {	
	                	this.list3.push({content:this.addName2});
	                	this.$forceUpdate();
	                });
				}
                
              }
		}
	});
	
	var endP = new Vue({
		el:'#haha',
		data:{
			memberList:[]
		},
		methods:{
			endProject(){
				axios.get('/connecthink/endProject',{
                	params:{
                		project_no: ${project_no}
                	}
                })
                .then(response => {	
                	alert('종료완료!')
                	window.close();
                });
			}
		}
	})
</script>
<script src="js/vendor/modernizr-3.5.0.min.js"></script>
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/ajax-form.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/scrollIt.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/nice-select.min.js"></script>
<script src="js/jquery.slicknav.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/gijgo.min.js"></script>
</html>