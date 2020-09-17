<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

.editing {
  background: white;
  color: #172b4d !important;
  box-shadow:inset 0px 0px 0px 2px #0279bf;
}

.editing:hover {
  background: white !important;
}

.card {
  background: white;
  border-bottom: 1px solid #aaa;
}

.todo,.doing,.done {
/*   padding: 7px; */
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
	padding-top:7%;
	margin-left: 35%;
}

.todo{
	margin-right: 25%;
}
.doing{
	margin-right: 25%;
}
.done{
	margin-right: 25%;
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

@media(min-width:768px) {
    #wrapper {
        padding-left: 250px;
    }

    #wrapper.toggled {
        padding-left: 0;
    }

    #sidebar-wrapper {
        width: 250px;
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
<meta charset="UTF-8">
<title>board.jsp</title>
</head>
<body>
	<!-- Sidebar -->
		<a href="#menu-toggle" class="menutoggle" id="menu-toggle">☰</a>
	
        <div id="sidebar-wrapper" style="display: none">
            <ul class="sidebar-nav">
                <li class="sidebarTeamName">
                    <a href="#" id="down">This is Team Name</a>
                </li>
                
            <li>
				<div class="friend">
					<img src="https://cdn.clien.net/web/api/file/F01/9857567/225ef14007e0b0.jpg" />
					<div class="profile">
						<p><strong>Hailey</strong></p> 
						<p><span>Web Master</span></p>
					</div>
					<div class="status offline"></div>
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
                
                <li>
                    <a href="#">프로젝트 종료</a>
                </li>
            </ul>
        </div>
	
		 <div id="app"></div>

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
						<a class="card-header-icon"> <span class="icon"> <i
								class="fa fa-close"></i>
						</span>
						</a>
					</header>

					<!-- chat Content -->
					<div  v-show='toggle'>
						<div id="chatbox-area">
							<div class="card-content chat-content" onscroll="chat_on_scroll()" id="chatContent">
								<div class="content">
									
									<!-- 메세지 받을때 -->
									
									<div id="msgs" v-for="msg in msgs">
										<div class="chat-message-group reception" v-if="msg.isReception">
											<div class="chat-thumb">
												<figure class="image is-32x32">
													<img
														src="https://www.pinclipart.com/picdir/middle/181-1814767_person-svg-png-icon-free-download-profile-icon.png"
														style="width: 30px;">
												</figure>
											</div>
											
											<div class="chat-messages">
												<div>{{msg.writer}}</div>
												<div class="message">{{msg.reception}}</div>
												<div class="from">{{msg.receptionTime}}</div>
											</div>
										</div>
									
										<!-- 메세지 보낼때 -->
										<div class="chat-message-group writer-user" v-else>
											<div class="chat-messages">
												<div class="message">{{msg.reception}}</div>
												<div class="from">{{msg.receptionTime}}</div>
											</div>
										</div>

									</div>

								</div>

							</div>
						</div>
						<footer class="card-footer" id="chatBox-textbox">
							<div style="width: 67%">
								<textarea id="chatTextarea" class="chat-textarea"
									v-model.trim="message" placeholder="메세지를 입력 하세요"
									@keypress.enter="sendMsg"></textarea>
							</div>
							<div class="has-text-centered" style="width: 33%" id="msgBox">
								<button class="button is-white" @click="sendMsg">
									<img
										src="https://image.flaticon.com/icons/svg/1388/1388910.svg"
										style="width: 30px;"> senddd
								</button>
							</div>
						</footer>
					</div>
				</div>
			</div>
		</div>

</body>
<script>
	
	var writer = "";
	
	
	var pre_diffHeight = 0;
	var bottom_flag = true;
	
	var chat_on_scroll = function(){
			console.log("scroll!!!");
			var chatDiv = document.getElementById("chatContent");
	 		console.log(chatDiv.scrollTop);
	        if((chatDiv.scrollTop + chatDiv.clientHeight) == chatDiv.scrollHeight){
	                // 채팅창 전체높이 + 스크롤높이가 스크롤 전체높이와 같다면
	                // 이는 스크롤이 바닥을 향해있다는것이므로
	                // 스크롤 바닥을 유지하도록 플래그 설정
	                bottom_flag = true;
	               console.log("여기");
	        }

	 if(pre_diffHeight > chatDiv.scrollTop + chatDiv.clientHeight){
	                // 스크롤이 한번이라도 바닥이 아닌 위로 상승하는 액션이 발생할 경우
	                // 스크롤 바닥유지 플래그 해제
	                bottom_flag = false;  
	                console.log("요기")
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
		   wrts : []
		  }
		  //chatApp.vue가 생성되면 소캣 연결
		  ,created(){
			  console.log('created');
			  this.connect()
		  }
		   //변화가 있을경우
		  ,updated(){
			console.log("update!");
			console.log(bottom_flag);
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
			 send(){
				 if(this.status == "Connected"){
					 this.msgs.push({receptionTime : this.getTime(),reception : this.message,isReception :false});	 
					 this.socket.send(this.message);
				 }else{
					alert('연결 상태가 올바르지 않습니다.'); 
				 }
			 },
			  //websocket 연결
			  connect(){
				  this.socket = new WebSocket("ws://172.30.1.8:8080/connecthink/boardEcho");
				  console.log(this.socket);
				  //onopen
				  this.socket.onopen = () => {
					  console.log('connected');
					  this.status = "Connected";
					  //수신 메세지
					  this.socket.onmessage = ({data}) => {
						var datas = data.split(":");
						if(datas[0] == "userid"){
							writer = datas[1];
						}else{
							var user = datas[0];
							var msg = datas[1];
							
							//전송한 사람이 내가 아닐경우
							this.msgs.push({receptionTime : this.getTime(),reception : msg,isReception :true,writer : user});
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
	
	
	
	
	Vue.component('my-button2', {
		template: `<div class='card removable editable'>xxxxxxxxx</div>`
	})

	
	
	/*drag&drop시작*/
	Vue.use(VueDraggable.default);
	
	new Vue({
		  template: `
			  <div v-drag-and-drop:options="options" class="drag-wrapper">
			  	<div id="dashBoard">		   
					<div class="todo" id="do">
						<div class="title">TO DO
					  		<div class="content">
			  					<ul class="usty">
			  						<li><div class="card removable editable">This is a card</div></li>
			  						<li><div class="card removable editable" style="">Look, another card!</div></li>
			  						<li><div class="card removable editable" style="">Look, another card!</div></li>
			  						<li><div class="card removable editable" style="">Look, another card!</div></li>
			  						<li><div class="card removable editable" style="">Look, another card!</div></li>
			  						<li><div class="card removable editable" style="">Look, another card!</div></li>
			  						<li><div class="card removable editable" style="">Look, another card!sdfsdfsdf</div></li>
			  					</ul>
							</div>
			    		<div class="add-task" >작업 추가하기</div>
			    		</div>
			    	</div>
			    
			    	<div class="doing" id="doing">
			    		<div class="title">Doing
							<div class="content">
			  					<ul class="usty">
								    <li><div class="card removable editable">This is a card</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!sdfsdfsdf</div></li>
								</ul>
							</div>
					    <div class="add-task" >작업 추가하기</div>
					    </div>
					</div>
			    
			    	<div class="done" id="done">
			    		<div class="title">Done
				  			<div class="content">
							    <ul class="usty">
								    <li><div class="card removable editable">This is a card</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!</div></li>
									<li><div class="card removable editable" style="">Look, another card!sdfsdfsdf</div></li>
							    </ul>
							</div>
						<div class="add-task">작업 추가하기</div>
						</div>
					</div>
			    </div>
			  </div>
		  `,
		  data() {
		    const componentInstance = this;
		    
		    return {
		      options: {
		        onDragend(event) {
		          componentInstance.someDummyMethod();

		          // to detect if draggable element is dropped out
		          if (!event.droptarget) {
		            console.log('event is dropped out');
		          } 
		        }
		      }
		    }
		  },
		  methods: {
			  someDummyMethod() {
				     console.log('Hello from someDummyMethod');
				   }
		  }
		}).$mount("#app");
	
	/* var todo = new Vue({
		el: '#do',
		data: {
			buttons: []
			,task:''
		},
		methods: {
			add () {
				this.buttons.push('my-button2')
			}
		}
	})
	
	var doing = new Vue({
		el: '#doing',
		data: {
			buttons: []
			,task:''
		},
		methods: {
			add () {
				this.buttons.push('my-button2')
			}
		}
	})
	
	var done = new Vue({
		el: '#done',
		data: {
			buttons: []
			,task:''
		},
		methods: {
			add () {
				this.buttons.push('my-button2')
			}
		}
	}) */

</script>
</html>