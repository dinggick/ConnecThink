<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${requestScope.list}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="manifest" href="site.webmanifest"> -->
   <%--  <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/img/favicon.png"> --%>
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/style.css">

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

.singleInput {
  display: block;
  width: 100%;
  line-height: 30px;
  border: none;
  outline: none;
  background: #f9f9ff;
  padding: 0 20px;
}


.title {
  text-align:center;
  margin: 2px;
  font-weight:1000;
  font-size:24px;
}

.title > .content {
	font-weight:0;
}

.editable {
  user-select: none;
  outline: none;
  margin: 7px;
  padding: 30px;
  cursor: pointer !important;
  display: flex;
  justify-content: space-between;
  font-weight:0;
}
.card {
  background: white;
  border-bottom: 1px solid #aaa;
  font-weight:100;
  font-size:18px;
}

.todo,.doing,.done {
  min-width: 300px;
  margin: 10px 5px;
  position: relative;
  background: #dfe1e6;
}

.editable2 {
  padding-top:20px;
  font-weight:0;
  user-select: none;
  outline: none;
  margin: 7px;
  padding: 5px;
  cursor: pointer !important;
  display: flex;
  justify-content: space-between;
}

.tarea{
	width:100%;
	border: none;
	resize:none;
	overflow:hidden;
	overflow-wrap: break-word;
}

#inputInModal{
	resize:none;
	overflow:hidden;
	overflow-wrap: break-word;
}	

.add-task {
  /* width: calc(100% - 10px); */
  /* display: inline-block; */
  padding: 5px;
  margin-top: 0px;
  color: gray;
  text-decoration: none;
  border-bottom: 1px solid #dfe1e6;
}

.add-task:hover {
  background-color: rgba(9,30,66,.13);
}

.del {
  font-weight: 600;
  color: gray;
}

.buttAdd{
	appearance: none;
	outline: 0;
	background-color: white;
	border: 0;
	padding: 10px 15px;
	color: @prim;
	border-radius: 3px;
	cursor: pointer;
	transition-duration: 0.25s;
}
.buttAdd:hover{
	background-color: rgb(245, 247, 249);
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
	position: fixed;
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
/* 	float: left; */
/* 	padding: 10px; */
/* 	background: #ecf1f8; */
/* 	font-size: 13px; */
/* 	border-radius: 5px; */
/* 	margin-bottom: 3px; */
	  border-radius: 1.15rem;
	  line-height: 1.25;
	  max-width: 75%;
	  padding: 0.5rem .875rem;
	  position: relative;
	  word-wrap: break-word;
}
p.from-me {
  align-self: flex-end;
  background-color: #248bf5;
  color: #fff; 
}

p.from-me::before {
  border-bottom-left-radius: 0.8rem 0.7rem;
  border-right: 1rem solid #248bf5;
  right: -0.35rem;
  transform: translate(0, -0.1rem);
}

p.from-me::after {
  background-color: #fff;
  border-bottom-left-radius: 0.5rem;
  right: -40px;
  transform:translate(-30px, -2px);
  width: 10px;
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
	background: #2196f3;
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
	
.nnnn {
    z-index: 1000;
    position: fixed;
    top:0;
    left:250px;
    width: 0px;
    margin-left: -250px;
    height: 100%;
    background: #CEE3F6;
    overflow-x: hidden;
    transiton:0.5s;
}
.close{
  	top: 0;
  	right: 25px;
  	font-size: 36px;
  	margin-left: 50px;
  	margin-top: 14px;
  	color:#2E2EFE;
  	transiton:0.5s;
}


/* Sidebar Styles */
.sidebar-nav {
    position: absolute;
    top: 0;
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
    transiton:0.5s;
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
    font-size: 24px;
    line-height: 64px;
    font-weight:1000;
	color:black; 
}




.sidebar-nav > .outProject a{
	font-size: 20px;
	
}

@media(min-width:900px) {
    .nnnn {
        width: 270px;
        transiton:0.5s
    }
}

.menutoggle{
	text-decoration: none;
	font-size: 3em;
	color: rgba(0, 0, 0, 0.61);
	position: fixed;
	top: 10px;
	left: 20px;
	z-index: 1;
	cursor: pointer;
	transiton:0.5s;
}

.usty{
	 list-style:none;
	 padding-left:0px;
	 min-height:20px;
	 overflow-y:auto; 
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
	width:50px;
	height: 45px;
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

.friend .status.offline{background:#f74710;}


.position-top {
  position: fixed;
  top: 40px;
  /* width: 100% */
/*   left: 0; */
  right: 20px;
}
.close-icon {
    float: right;
    margin: 5px;
    color: #84817a;
}
.success-icon {
    font-size: 20px;
    color: #218c74;
}
.info-icon {
    font-size: 20px;
    color: #ffb142;
}
.warning-icon {
    font-size: 20px;
    color: #ff5252;
}
.notify-card-success {
    background: #ffffff;
    margin-bottom: 40px;
    width: 400px;
    height: 100px;
    border-radius: 4px;
    border-left: 5px solid #218c74;
    transition: 1s all ease;
}
.notify-card-success:hover {
    cursor: pointer;
    transition: 1s all ease;
    box-shadow: 0px 5px 20px 0px #6767676b;
}
.notify-card-information {
    background: #ffffff;
    margin-bottom: 40px;
    width: 400px;
    height: 100px;
    border-radius: 4px;
    border-left: 5px solid #ffb142;
    transition: 1s all ease;
}
.notify-card-information:hover {
    cursor: pointer;
    transition: 1s all ease;
    box-shadow: 0px 5px 20px 0px #6767676b;
}
.notify-card-warning {
    background: #ffffff;
    margin-bottom: 40px;
    width: 400px;
    height: 100px;
    border-radius: 4px;
    border-left: 5px solid #ff5252;
    transition: 1s all ease;
}
.notify-card-warning:hover {
    cursor: pointer;
    transition: 1s all ease;
    box-shadow: 0px 5px 20px 0px #6767676b;
}
.notify-message {
    display: flex;
    padding-top: 20px;
}
.notify-logo {
    margin: 20px;
}

/* vue js animation */
.bounce-enter-active {
  animation: bounce-in .5s;
}
.bounce-leave-active {
  animation: bounce-in .5s reverse;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.5);
  }
  100% {
    transform: scale(1);
  }
}

/* switch */

  	#toggle{
			width:136px;
			height:41px;
			border-radius:40px;
			position:fixed;
 			-webkit-appearance: none; 
/* 			position:absolute; */
			right:0;
			top:6%;
			z-index:10000;
			/*top:6%;*/
			margin:-39px 0 0 -89px;
			box-shadow: inset 1px 1px 1px rgba(0, 0, 0, 0.4);
			background: -webkit-linear-gradient(#c6c6c6,#e3e3e3);
		}
		#toggle:checked{
			background: -webkit-linear-gradient(#bfe09c,#c8eca0);
			box-shadow: inset 1px 1px 3px rgba(0, 0, 0, 0.4);
		}
		#toggle:before {
			content:"";
			letter-spacing:1px;
			color: rgba(0,0,0,.15);
			font-size:22px;
			font-weight:100;
			text-shadow:1px 1px 1px rgba(255,255,255,1);
			width:26px;
			height:26px;
			padding:13px;
			top:7px;
			left:9px;
			position:absolute;
			border-radius:40px;
			background: -webkit-linear-gradient(#ebebeb,#f1f1f1);
			box-shadow: -2px 2px 8px rgba(0, 0, 0, 0.2), 
						-1px 1px 2px rgba(0, 0, 0, 0.3), 
						inset 1px 1px 1px #ffffff;
			-webkit-transition: all 1s;
			
		}
		#toggle:checked:before {
			left:106px;
			background:#f1f1f1;
		}
		#toggle:after {
			content:"";
			width:14px;
			height:14px;
			top:32px;
			right:-30px;
			position:absolute;
			border-radius:40px;
			background: -webkit-linear-gradient(#fcc4c5,#e12c2d);
			box-shadow: inset -1px -1px 4px #8d0808, 
						inset 1px 1px 2px #bb1313;			
		}
		#toggle:checked:after {
			background: -webkit-linear-gradient(#d8eec4,#5fa718);
			box-shadow: inset -1px -1px 4px #417f0b, 
						inset 1px 1px 2px #5b9f1a;			
		}
/* loading */

.container {
  left: 50%;
  margin: auto -50px;
  position: absolute;
  top: 50%;
}
.swing div {
  border-radius: 50%;
  float: left;
  height: 1em;
  width: 1em;
}
.swing div:nth-of-type(1) {
  background: -webkit-linear-gradient(left, #385c78 0%, #325774 100%);
  background: linear-gradient(to right, #385c78 0%, #325774 100%);
}
.swing div:nth-of-type(2) {
  background: -webkit-linear-gradient(left, #325774 0%, #47536a 100%);
  background: linear-gradient(to right, #325774 0%, #47536a 100%);
}
.swing div:nth-of-type(3) {
  background: -webkit-linear-gradient(left, #4a5369 0%, #6b4d59 100%);
  background: linear-gradient(to right, #4a5369 0%, #6b4d59 100%);
}
.swing div:nth-of-type(4) {
  background: -webkit-linear-gradient(left, #744c55 0%, #954646 100%);
  background: linear-gradient(to right, #744c55 0%, #954646 100%);
}
.swing div:nth-of-type(5) {
  background: -webkit-linear-gradient(left, #9c4543 0%, #bb4034 100%);
  background: linear-gradient(to right, #9c4543 0%, #bb4034 100%);
}
.swing div:nth-of-type(6) {
  background: -webkit-linear-gradient(left, #c33f31 0%, #d83b27 100%);
  background: linear-gradient(to right, #c33f31 0%, #d83b27 100%);
}
.swing div:nth-of-type(7) {
  background: -webkit-linear-gradient(left, #da3b26 0%, #db412c 100%);
  background: linear-gradient(to right, #da3b26 0%, #db412c 100%);
}
.shadow {
  clear: left;
  padding-top: 1.5em;
}
.shadow div {
  -webkit-filter: blur(1px);
  filter: blur(1px);
  float: left;
  width: 1em;
  height: .25em;
  border-radius: 50%;
  background: #e3dbd2;
}
.shadow .shadow-l {
  background: #d5d8d6;
}
.shadow .shadow-r {
  background: #eed3ca;
}
@-webkit-keyframes ball-l {
  0%, 50% {
    -webkit-transform: rotate(0) translateX(0);
    transform: rotate(0) translateX(0);
  }
  100% {
    -webkit-transform: rotate(50deg) translateX(-2.5em);
    transform: rotate(50deg) translateX(-2.5em);
  }
}
@keyframes ball-l {
  0%, 50% {
    -webkit-transform: rotate(0) translate(0);
    transform: rotate(0) translateX(0);
  }
  100% {
    -webkit-transform: rotate(50deg) translateX(-2.5em);
    transform: rotate(50deg) translateX(-2.5em);
  }
}
@-webkit-keyframes ball-r {
  0% {
    -webkit-transform: rotate(-50deg) translateX(2.5em);
    transform: rotate(-50deg) translateX(2.5em);
  }
  50%,
  100% {
    -webkit-transform: rotate(0) translateX(0);
    transform: rotate(0) translateX(0);
  }
}
@keyframes ball-r {
  0% {
    -webkit-transform: rotate(-50deg) translateX(2.5em);
    transform: rotate(-50deg) translateX(2.5em);
  }
  50%,
  100% {
    -webkit-transform: rotate(0) translateX(0);
    transform: rotate(0) translateX(0)
  }
}
@-webkit-keyframes shadow-l-n {
  0%, 50% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
  100% {
    opacity: .125;
    -webkit-transform: translateX(-1.57em);
    transform: translateX(-1.75em);
  }
}
@keyframes shadow-l-n {
  0%, 50% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
  100% {
    opacity: .125;
    -webkit-transform: translateX(-1.75);
    transform: translateX(-1.75em);
  }
}
@-webkit-keyframes shadow-r-n {
  0% {
    opacity: .125;
    -webkit-transform: translateX(1.75em);
    transform: translateX(1.75em);
  }
  50%,
  100% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
}
@keyframes shadow-r-n {
  0% {
    opacity: .125;
    -webkit-transform: translateX(1.75em);
    transform: translateX(1.75em);
  }
  50%,
  100% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
}
.swing-l {
  -webkit-animation: ball-l .425s ease-in-out infinite alternate;
  animation: ball-l .425s ease-in-out infinite alternate;
}
.swing-r {
  -webkit-animation: ball-r .425s ease-in-out infinite alternate;
  animation: ball-r .425s ease-in-out infinite alternate;
}
.shadow-l {
  -webkit-animation: shadow-l-n .425s ease-in-out infinite alternate;
  animation: shadow-l-n .425s ease-in-out infinite alternate;
}
.shadow-r {
  -webkit-animation: shadow-r-n .425s ease-in-out infinite alternate;
  animation: shadow-r-n .425s ease-in-out infinite alternate;
}

/* .fade-enter-active, .fade-leave-active {
  transition: opacity .5s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
} */

.slide-fade-enter-active {
  transition: all .5s ease;
}
.slide-fade-leave-active {
  transition: all .3s cubic-bezier(0.5, 0.5, 0.5, 0.5);
}
.slide-fade-enter, .slide-fade-leave-to {
  transform: translateX(10px);
  opacity: 0;
}

</style>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/vue-draggable@1.0.9/lib/vue-draggable.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<meta charset="UTF-8">
<title>board.jsp</title>
</head>
<body>
	<!-- Sidebar -->
	<div id="sideBar"> 
		<a class="menutoggle" id="menu-toggle" @click="toggle = !toggle">☰</a>
		 <transition name="slide-fade">
		<div id="sidebar-wrapper" class="nnnn" v-show='toggle'>
			<ul class="sidebar-nav" id="sidebar-ul">
				<a href="#" @click="toggle = !toggle" class="close">X</a>
				<li class="sidebarTeamName">
					<a href="#" id="tTitle">{{teamTitle}}</a>	
				</li>	
				<li v-for="member in memberList">
					<div class="friend">
						<img :src="member.imageRoute" @error = "imageNotFound"/>
						<div class="profile">
							<p><strong>{{ member.name }}</strong></p>
							<p><span>{{ member.position }}</span></p>
						</div>
						<div :id=" member.customer_no+'no'" class="status offline" :name=" member.position"></div>
					</div>
				</li>
				<li class="outProject">
					<p v-if="${sessionScope.loginInfo} == ${isManager}"><a v-on:click="endProject">프로젝트 종료</a></p>
					<p v-else><a v-on:click="endMyProject">탈퇴하기</a></p>
				</li>
			</ul>
		</div>
		</transition>
	</div> <!-- SideBar end -->
	
	
	<!-- dash board -->
	<div id="dashBoard" v-drag-and-drop:options="options">
	
		<!-- 상세 내용 모달 -->
		<div class="modal fade" id="contentModal" tabindex="-1" role="dialog"
			aria-labelledby="loginModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header"><input type="text" id="cusName" readonly="readonly" value="" style="border:none; outline:none;">  
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="mt-10">
							<textarea id="inputInModal" maxlength="100" v-model="updateText" name="text" required class="singleInput" onkeyup = "modalkeyup(this)" style="height:120px "></textarea>
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

		<!-- todo 영역 -->
		<div class="todo" id="do">
			<div class="title">
				To Do
				<div class="content">
					<ul class="usty section1" id="sectionOneStatus" value="1">
						<li v-for="(item,index) in lists">
							<a data-toggle="modal" href="#contentModal" v-on:click="goModal">
								<div class='card editable'>
									<input type="hidden" :value="item.taskNo">
									<input type="hidden" :value="item.cusNo">
									<input type="hidden" :value="item.cName">
									{{item.content}}
								</div>
							</a>
						</li>
					</ul>
				</div>
				<div class="add-task card editable2">
					<textarea v-model="addName" class="tarea" maxlength="100" required="required" onkeyup = "keyup(this)"></textarea>
					<button v-on:click="goTask" class="btn btn-primary">ADD</button>
				</div>
			</div>
		</div>
		
		<!-- doing 영역 -->
		<div class="doing" id="doing">
			<div class="title">
				Doing
				<div class="content">
					<ul class="usty section2" id="sectionTwoStatus" value="2">
						<li v-for="(item,index) in list2">
							<a data-toggle="modal" href="#contentModal" v-on:click="goModal">
								<div class='card editable'>
									<input type="hidden" :value="item.taskNo">
									<input type="hidden" :value="item.cusNo">
									<input type="hidden" :value="item.cName">
									{{item.content}}
								</div>
							</a>
						</li>
					</ul>
				</div>
				<div class="add-task card editable2">
					<textarea v-model="addName1" class="tarea" maxlength="100" required="required" onkeyup = "keyup(this)"></textarea>
					<button v-on:click="goTask" class="btn btn-primary">ADD</button>
				</div>
			</div>
		</div>
		
		<!-- done 영역 -->
		<div class="done" id="done">
			<div class="title">
				Done
				<div class="content">
					<ul class="usty section3" id="sectionThreeStatus" value="3">
						<li v-for="(item,index) in list3">
							<a data-toggle="modal" href="#contentModal" v-on:click="goModal">
								<div class='card editable'>
									<input type="hidden" :value="item.taskNo">
									<input type="hidden" :value="item.cusNo">
									<input type="hidden" :value="item.cName">
									{{item.content}}
								</div>
							</a>
						</li>
					</ul>
				</div>
				<div class="add-task card editable2">
					<textarea v-model="addName2" class="tarea" maxlength="100" required="required" onkeyup = "keyup(this)"></textarea>
					<button v-on:click="goTask" class="btn btn-primary">ADD</button>
				</div>
			</div>
		</div>
	</div> <!-- dash board end -->

	<!-- chat -->
		<div id="chatApp">
			<div class="chatBox" id="chatBox">
				<div class="ChatCard">

					<!-- chat Title -->
					<header class="card-header header-title" @click="toggle = !toggle">
						<p class="card-header-title">
							<i class="fa fa-circle is-online"></i><img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT2s9HDKipReXD4JCwZtvwq21UdaVbif2z2QQ&usqp=CAU"
								style="width: 30px;">&nbsp;{{teamTitle}}
						</p>
					</header>

					<!-- chat Content -->
					<div  v-show='toggle'>
						<div id="chatbox-area">
							<div class="card-content chat-content" onscroll="chat_on_scroll()" id="chatContent">
								<div class="content">
									
									<!-- loading -->
									<div aria-busy="true" aria-label="Loading" role="progressbar" class="container" v-show ="isLoadingNow">
									  <div class="swing">
									    <div class="swing-l"></div>
									    <div></div>
									    <div></div>
									    <div></div>
									    <div></div>
									    <div></div>
									    <div class="swing-r"></div>
									  </div>
									  <div class="shadow">
									    <div class="shadow-l"></div>
									    <div></div>
									    <div></div>
									    <div></div>
									    <div></div>
									    <div></div>
									    <div class="shadow-r"></div>
									  </div>
									 </div>
									
									<div id="msgs" v-for="msg in msgs" v-show="!isLoadingNow">
									<!-- 메세지 받을때 -->
										<div class="chat-message-group reception" v-if="msg.reception">
											<div class="chat-thumb">
												<figure class="image is-32x32">
													<img
														@error = "imageNotFound"
														:src="msg.imageRoute"
														style="width: 30px">
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
						</footer>
					</div>
				</div>
			</div>
			
			<!-- switch -->
			<input id="toggle" type="checkbox" checked v-on:click="onOff"/>

			
			<!-- notify -->
		 <transition name="bounce" v-model="notifyMsg">	
			<div class="position-top" v-show='showNotify'  v-on:click="close">
			    <div class="notify-card-success">
			        <i class="fa fa-times close-icon" aria-hidden="false"></i>
			        <div class="notify-message">
			            <div class="notify-logo">
			                <i class="fa fa-check-circle success-icon" aria-hidden="true"></i>              
			            </div>
			            <div class="friend">
			            		<img :src="userImg" @error = "imageNotFound">
			            </div>
			            <div class="notify-data">
								{{ notifyMsg }}			
			            </div>
			        </div>
			    </div>
			</div>
	    </transition>	
	    
	</div> <!-- chat end -->
		
		
</body>
<script>
	//textArea 스크립트 부분(author 변재)
	function keyup(obj) {
		if(obj.value.length > obj.maxLength){
    		alert('100자이내로 작성해주세요!');
    		obj.value = e.value.slice(0, e.maxLength);
        }
    	obj.style.height = '50px';
    	obj.style.height = (obj.scrollHeight) + 'px';
	}
	
	function modalkeyup(obj) {
		if(obj.value.length > obj.maxLength){
    		alert('100자이내로 작성해주세요!');
    		obj.value = e.value.slice(0, e.maxLength);
        }
    	obj.style.height = '120px';
    	obj.style.height = (obj.scrollHeight) + 'px';
	}
	//////////////////////////////////////////////////
	
	
	var pre_diffHeight = 0;
	var bottom_flag = true;
	
	//scroll event 
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
	   
	   pre_diffHeight = chatDiv.scrollTop + chatDiv.clientHeight
	};
	
	//side bar
	var sideBar = new Vue({
		el: '#sideBar'
		,data : {
			memberList : [],
			toggle: false,
			isManager : ${isManager},
			teamTitle :  "${title}",
			defaultImg : "https://www.pinclipart.com/picdir/middle/181-1814767_person-svg-png-icon-free-download-profile-icon.png"
		},created(){
			this.showMemberList();
		}
		,methods : {
			//맴버 정보 가져오기
			showMemberList(){
				axios
			  	.get('/connecthink/lookUpMember', {
			  	    params: {
			  	      project_no: ${project_no}
			  	    }
			  	 })
			  	.then(result => {
					  var memberInfo = result.data;	   			
					  memberInfo.forEach(member => {
						  var memberInfo = member.split(":");
						  this.memberList.push({name : memberInfo[1],position : memberInfo[2],customer_no : memberInfo[0],imageRoute : "http://localhost/storage/customer/"+memberInfo[0]+".jpg"});
						 
					  })//forEach for memberList				  
			  })//axios
			},//showMemberList
			
			//프로젝트 종료
			endProject(){
				var Backlen=history.length;  
				
				var answer = confirm('프로젝트를 종료하시겠습니까?');
				if(answer ==true){
					axios.get('/connecthink/endProject',{
	                	params:{
	                		project_no: ${project_no}
	                	}
	                })
	                .then(response => {	
	                	alert('종료완료!');
	                	history.go(-Backlen); // Return at the beginning
	                	window.location.replace("${contextPath}");
	                });
				}
			},
			
			//프로젝트탈퇴
			endMyProject(){
				var Backlen=history.length;   

				var answer = confirm('정말 탈퇴하시겠습니까? 중도탈퇴시 참여기록이 남지않습니다!');
				if(answer == true){
					axios.get('/connecthink/endMyProject',{
	                	params:{
	                		project_no: ${project_no}
	                	}
	                })
	                .then(response => {	
	                	alert('탈퇴완료!')
	                	history.go(-Backlen); // Return at the beginning
	    				window.location.replace("${contextPath}");	
	                });
				}
			},
			
			//유저의 이미지 없을경우 default image 로 대체
			imageNotFound(event){
				event.target.src = this.defaultImg;
			}
			
		}//method
	});
	
	var loginUsers = new Array();
	
	//채팅 헤더 토글
	var chat = new Vue({
		 el: '#chatApp'
		 ,data : {
		   toggle: true,
		   teamTitle: "${title}",
		   message : "",
		   msgs : [],
		   wrts : [],		   
		   project_no : ${project_no},
		   writer : 0,
		   loginLog : [],
		   notifyMsg : null,
		   onoff : true,
		   showNotify : false,
		   isLoadingNow : true,
		   defaultImg : "https://www.pinclipart.com/picdir/middle/181-1814767_person-svg-png-icon-free-download-profile-icon.png",
		   userImg : "",
		   compleate : false
		  }
		  //chatApp.vue가 생성되면 소캣 연결
		  ,created(ev){
			this.connect();
			}//created
    	  //변화가 있을경우
		  ,updated(ev){
			this.$nextTick(function() {
	  			if(this.compleate){
	  				this.isOnline();	
	  			}
			});
			
			
			var chatDiv = document.getElementById("chatContent");
			
			if(bottom_flag){
				chatDiv.scrollTop = chatDiv.scrollHeight;
			}
			  
		  }
		  ,methods : {
			  
			  //연결해제
			  disconnect(){
				  alert("끊김");
				  const idx = a.findIndex(function(item) {return item.customer_no === 1});
				  if (idx > -1) loginLog.splice(idx, 1);
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
				 this.socket = new WebSocket("ws://172.30.1.5:8080/connecthink/chat/boardChat");
				  
				  //onopen
				  this.socket.onopen = () => {
					  this.status = "ready";
					  this.send("ready:"+this.project_no);
					  
					  this.status = "Connected";
					  //수신 메세지
					  this.socket.onmessage = ({data}) => {
						var datas = data.split(":");
						
						if(datas[0] == 'taskInfo'){
							
								var doWhat = datas[1];
								
								//add 요청시
								if(doWhat == 'add'){
									var Taskcontent = datas[2];
									var taskNo = datas[3];
									var status = datas[4];
									var name = datas[5];
									var customerNo = datas[6];
									if(status == 1){
										todo.lists.push({content:Taskcontent,taskNo:taskNo,status:status,cName:name,cusNo:customerNo});
										console.log('complete');
									}else if(status == 2){
										todo.list2.push({content:Taskcontent,taskNo:taskNo,status:status,cName:name,cusNo:customerNo});
									}else{
										todo.list3.push({content:Taskcontent,taskNo:taskNo,status:status,cName:name,cusNo:customerNo});
									}
								}
								
								//update 요청
								else if(doWhat == 'update'){
									
									var taskNoForUpdate = datas[2];
									var taskContentForUpdate = datas[3];
									
									todo.lists.forEach(t => {
				                		if(t.taskNo == taskNoForUpdate) t.content = taskContentForUpdate;
				                	});
				                	todo.list2.forEach(t => {
				                		if(t.taskNo == taskNoForUpdate) t.content = taskContentForUpdate;
				                	});
				                	todo.list3.forEach(t => {
				                		if(t.taskNo == taskNoForUpdate) t.content = taskContentForUpdate;
				                	});
									
								}
								
								//delete 요청
								else if(doWhat == 'delete'){
					
									var taskNoForDelete = datas[2];
									
									todo.lists.forEach((t, index) => {
				                		if(t.taskNo == taskNoForDelete) {
				                			todo.lists.splice(index, 1);
				                			return true;
				                		}
				                	});
									todo.list2.forEach((t, index) => {
				                		if(t.taskNo == taskNoForDelete) {
				                			todo.list2.splice(index, 1);
				                			return true;
				                		}
				                	});
									todo.list3.forEach((t, index) => {
				                		if(t.taskNo == taskNoForDelete) {
				                			todo.list3.splice(index, 1);
				                			return true;
				                		}
				                	});
								}
								//drag & Drop
								else{									
									var dDTastNo = datas[2];
									var dDTaskStatus = datas[3];
									
									//삭제 하기 전 해당 테스크 임시 저장
									var task;
									
									//1)드래그 드랍 하기 전 영역 찾아서 삭제하기
									todo.lists.forEach((t, index) => {
				                		if(t.taskNo == dDTastNo) {
				                			task = t;
				                			todo.lists.splice(index, 1);
				                			return true;
				                		}
				                	});
									todo.list2.forEach((t, index) => {
				                		if(t.taskNo == dDTastNo) {
				                			task = t;
				                			todo.list2.splice(index, 1);
				                			return true;
				                		}
				                	});
									todo.list3.forEach((t, index) => {
				                		if(t.taskNo == dDTastNo) {
				                			task = t;
				                			todo.list3.splice(index, 1);
				                			return true;
				                		}
				                	});

									//2) 드랍한 영역에 추가해주기
									if(dDTaskStatus == 1){
										todo.lists.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.Cname,cusNo:task.cusNo});
									}else if(dDTaskStatus == 2){
										todo.list2.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.Cname,cusNo:task.cusNo});
									}else{
										todo.list3.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.Cname,cusNo:task.cusNo});
									}
									
								}//drag & drop domain
						}
						
						else if(datas[0] == "userid"){
							this.writer = datas[1];						
						}
						else if(datas[0] == "loginInfo"){
							var loguserArray = datas[1].substring(1,datas[1].length-1).split(",");
							var className = "status online";							
							let cnt = 0;
							loguserArray.forEach(customer_no => {
								var dom = document.getElementById(customer_no.trim()+"no");
								if(dom == null){ // dom rendering X
									loginUsers[cnt] = customer_no;
									cnt++;
								}else{
									dom.setAttribute("class",className);
								}								
							});
							this.compleate = true;
						}else if(datas[0] == "logoutInfo"){
							var logoutUser_no = datas[1];
							var className = "status offline";
							var dc = document.getElementById(logoutUser_no.trim()+"no");
							dc.setAttribute("class",className);
						}else if(datas[0] == "loadingCompleate"){
							this.isLoadingNow = false;
						}else{
							var user = datas[0];
							var msg = datas[1];
							var receptionTime = datas[2]+":"+datas[3];
							var name = datas[4];
							//읽어온 데이터가 내가보낸 메세지 일 경우
							if(this.writer == user){
								 this.msgs.push({createDate : receptionTime, content : msg,reception :false});	 
							}else{
								//가져온 유저의 프로필 사진
								let imageUrl = "http://localhost/storage/customer/"+user+".jpg";
								
								//전송한 사람이 내가 아닐경우
								this.msgs.push({createDate : receptionTime, content : msg,reception :true,writer : name,imageRoute : imageUrl});
								
								//토글이 닫혀있을때 notify show
								if(!this.toggle && this.onoff){
									if(this.showNotify == true){
										this.showNotify = false;	
										this.showNotify = true;
										this.userImg = imageUrl;
										this.notifyMsg = name+" : "+msg;
									}else{
										this.open();
										this.userImg = imageUrl;
										this.notifyMsg = name+" : "+msg;
										setTimeout(this.close, 3000);
									}
								}
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
			  close(){ 
				 this.showNotify = false;
			  },
			  open(){
				this.showNotify = true;  
			  },
			  ChatOn(){
				console.log("notify click!");
				this.showNotify = false;
				this.toggle = true;
			  },
			  onOff(ev){
			  	this.onoff = ev.target.checked;
			  },
			  //유저의 이미지 없을경우 default image 로 대체
			  imageNotFound(event){
				  event.target.src = this.defaultImg;
			  },			  
			  //로그인 한 유저의 li dom 접근하여 class 속성 변경
			  isOnline(){
				  var className = "status online";
					if(loginUsers.length != 0){
						for(let i = 0; i < loginUsers.length; i++){
							var customer_no = loginUsers[i];
							document.getElementById(customer_no.trim()+"no").setAttribute("class",className);
							this.compleate = false;
						}
					}
			  }
		  }//method
		});
	
	////////////////////////////////변재 vue.${contextPath}/js////////////////////////////////////////////////////////
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
					 //console.log(event);
					 var getTaskNo = event.items[0].firstChild.firstChild.firstChild.value;
					 if(event.droptarget == null){
						 event.droptarget = dragover;
					 }
					// console.log('바뀐 영역입니다' + event.droptarget.attributes[1].nodeValue);
					 axios.get('/connecthink/updateStatus',{
		                	params:{
		                		taskNo:getTaskNo,
		       					status:event.droptarget.attributes[1].nodeValue
		                	}
		             })
		             .then(response => {
		            	 chat.socket.send('taskInfo:d&d:'+${project_no}+":"+getTaskNo+":"+event.droptarget.attributes[1].nodeValue);
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
				
				var cusName = ev.target.childNodes[4].attributes[1].nodeValue;
				var nn = document.getElementById('cusName');
				nn.value = cusName;
				//console.log(cusNoModal);
			},
			//태스크 내용 수정하기
			updateContent(){
				var writeCusNo = document.getElementById('cusNo').value;
				
				if(${sessionScope.loginInfo} == writeCusNo){
					axios.get('/connecthink/updateContent',{
	                	params:{
	       					content:this.updateText,
	       					taskNo:document.getElementById('taskNo').value
	                	}
	                })
	                .then(response => {
        				chat.socket.send('taskInfo:update:'+${project_no}+":"+document.getElementById('taskNo').value+":"+this.updateText);
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
				}else{
					alert('작성자가 아닙니다!');
				}
			},
			//태스크 내용 삭제하기
			deleteTask(){
				var writeCusNo = document.getElementById('cusNo').value;
				
				if(${sessionScope.loginInfo} == writeCusNo){
					axios.get('/connecthink/deleteTask',{
	                	params:{
	       					taskNo:document.getElementById('taskNo').value
	                	}
	                })
	                .then(response => {
	                	chat.socket.send('taskInfo:delete:'+${project_no}+":"+document.getElementById('taskNo').value);
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
				}else{
					alert('작성자가 아닙니다!');
				}
			},
			//태스크 추가하기
			goTask(ev) {
				var status = 0;
				var evPath = ev.path[3].id;
				
				
				if(evPath == 'do'){
					if(this.addName == ''){
						alert('내용을 입력해주세요!');
					}else{
						status = 1;
						axios.get('/connecthink/addTask',{
		                	params:{
		                		content:this.addName,
		                		status:status,
		                		project_no: ${project_no}
		                	}
		                })
		                .then(response => {
		                	axios.get('/connecthink/taskList',{
		        				params: {
		        			  	      project_no: ${project_no}
		        			  	}
		                    })
		                    .then(response => {
		                    	var taskList = response.data;
		                    	var cnt = 0;
		                    	this.lists.splice(0);
		                    	
		                    	taskList.forEach(task =>{
		                    		cnt++;
		                    		if(task.taskStatus==1){
		                    			this.lists.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.customer.name,cusNo:task.customer.customerNo});
		                    			if(cnt == taskList.length){
		                    				chat.socket.send('taskInfo:add:'+${project_no}+":"+task.content+":"+task.taskNo+":"+task.taskStatus+":"+task.customer.name+":"+task.customer.customerNo);
		                    			}
		                    		}
		                    	});
		                    	this.addName='';
		                    });  
		                });
					}
					
				}else if(evPath == 'doing'){
					if(this.addName1 == ''){
						alert('내용을 입력해주세요!');
					}else{
						status = 2;
						axios.get('/connecthink/addTask',{
		                	params:{
		                		content:this.addName1,
		                		status:status,
		                		project_no: ${project_no}
		                	}
		                })
		                .then(response => {	
		                	axios.get('/connecthink/taskList',{
		        				params: {
		        			  	      project_no: ${project_no}
		        			  	}
		                    })
		                    .then(response => {
		                    	var taskList = response.data;
		                    	var cnt = 0;
		                    	this.list2.splice(0);
		                    	
		                    	taskList.forEach(task =>{
		                    		cnt++;
		                    		if(task.taskStatus==2){
		                    			this.list2.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.customer.name,cusNo:task.customer.customerNo});
		                    			if(cnt == taskList.length){
		                    				chat.socket.send('taskInfo:add:'+${project_no}+":"+task.content+":"+task.taskNo+":"+task.taskStatus+":"+task.customer.name+":"+task.customer.customerNo);
		                    			}
		                    		}
		                    	});
		                    	this.addName1='';
		                    });  	
		                });
					}
				}else if(evPath == 'done'){
					if(this.addName2 == ''){
						alert('내용을 입력해주세요!');
					}else{
						status = 3;
						axios.get('/connecthink/addTask',{
		                	params:{
		                		content:this.addName2,
		                		status:status,
		                		project_no: ${project_no}
		                	}
		                })
		                .then(response => {	
		                	axios.get('/connecthink/taskList',{
		        				params: {
		        			  	      project_no: ${project_no}
		        			  	}
		                    })
		                    .then(response => {
		                    	var taskList = response.data;
		                    	var cnt = 0;
		                    	this.list3.splice(0);
		                    	
		                    	taskList.forEach(task =>{
		                    		cnt++;
		                    		if(task.taskStatus==3){
		                    			this.list3.push({content:task.content,taskNo:task.taskNo,status:task.taskStatus,cName:task.customer.name,cusNo:task.customer.customerNo});
		                    			if(cnt == taskList.length){
		                    				chat.socket.send('taskInfo:add:'+${project_no}+":"+task.content+":"+task.taskNo+":"+task.taskStatus+":"+task.customer.name+":"+task.customer.customerNo);
		                    			}
		                    		}
		                    	});
		                    	this.addName2='';
		                    });  	
		                });	
					}
				}
                
				this.$forceUpdate();
              }
		}
	});

	
</script>
<script src="${contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
</html>