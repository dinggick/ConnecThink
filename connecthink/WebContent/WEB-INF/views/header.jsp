<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
   <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Job Board</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="${contextPath}/img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${contextPath}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${contextPath}/css/themify-icons.css">
    <link rel="stylesheet" href="${contextPath}/css/nice-select.css">
    <link rel="stylesheet" href="${contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/css/gijgo.css">
    <link rel="stylesheet" href="${contextPath}/css/animate.min.css">
    <link rel="stylesheet" href="${contextPath}/css/slicknav.css">

    <link rel="stylesheet" href="${contextPath}/css/style.css">
    </head>
    	<!-- 이메일 찾기 Modal -->
    <div class="modal" id="findEmailModal" tabindex="-1" role="dialog" aria-labelledby="findEmailModalCenterTitle" aria-hidden="true" style="z-index: 1051;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findEmailModalLongTitle">이메일 찾기</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                 <span aria-hidden="true">&times;</span> -->
<!--             </button> -->
                </div>
                <form>
	                <div class="modal-body">
	                    <div class="mt-10">
	                        <input type="text" name="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required class="single-input">
	                    </div>
	                    <div class="mt-10">
	                        <input type="text" name="birthDate" placeholder="생년월일 8자리 ex)19921211" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일 8자리 ex)19921211'" required class="single-input">
	                    </div>
	                    <input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로</button>
	                    <button type="submit" class="btn btn-primary">찾기</button>
	                </div>
                 </form>
            </div>
        </div>
    </div>
    <!-- 비밀번호 찾기 Modal -->
    <div class="modal" id="findPwdModal" tabindex="-1" role="dialog" aria-labelledby="findPwdModalCenterTitle" aria-hidden="true" style="z-index: 1051;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findPwdModalLongTitle">비밀번호 찾기</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                 <span aria-hidden="true">&times;</span> -->
<!--             </button> -->
                </div>
				<form>
					<div class="modal-body">
						<br>
						<div class="row">
							<div class="col-md-5 offset-1">
								<input type="email" name="email" placeholder="이메일"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '이메일'" required class="single-input">
							</div>
							<div class="col-md-5">
								<a href="#verifyModal" data-toggle="modal" data-backdrop="false"
									class="genric-btn info-border">이메일 인증</a>
							</div>
						</div>
						<br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로</button>
						<button type="submit" class="btn btn-primary">찾기</button>
					</div>
				</form>
			</div>
        </div>
    </div>
     <!-- 비밀번호 재설정 Modal -->
    <div class="modal" id="modifyPwdModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalCenterTitle" aria-hidden="true" style="z-index : 1053;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modifyModalLongTitle">비밀번호 재설정</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 		                <span aria-hidden="true">&times;</span> -->
<!-- 		            </button> -->
                </div>
                <form>
				<div class="modal-body">
					<div class="mt-10">
						<input type="password" name="password" placeholder="비밀번호"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '비밀번호'" required class="single-input">
					</div>
					<div class="mt-10">
						<input type="password" name="passwordForCheck" placeholder="비밀번호 확인"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '비밀번호 확인'" required class="single-input">
					</div>
					<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>
				<div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로</button>
	                    <button type="submit" class="btn btn-primary">재설정</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    
        <!-- 로그인 Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLongTitle">로그인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		            </button>
                </div>
                <form>
				<div class="modal-body">
					<div class="mt-10">
						<input type="email" name="username" placeholder="이메일"
							onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'"
							required class="single-input">
					</div>
					<div class="mt-10">
						<input type="password" name="password" placeholder="비밀번호"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '비밀번호'" required class="single-input">
					</div>
					<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>
				<div class="modal-footer">
	                    <a style="text-decoration: underline; color: #367FFF;" href="#findEmailModal" data-toggle="modal" data-backdrop="false">이메일 찾기</a>
	                    <a style="text-decoration: underline; color: #367FFF;" href="#findPwdModal" data-toggle="modal" data-backdrop="false">비밀번호 찾기</a>
	<!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> -->
	                    <button type="submit" class="btn btn-primary">로그인</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 회원가입 Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLongTitle">회원가입</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		            </button>
                </div> 
                <form>
	                <div class="modal-body">
	                        <div class="row">
	                    		<div class="col-md-6">
	                            	<input type="email" name="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'" required class="single-input">
		                        </div>
		                        <div class="col-md-6">
		                            <a id="requestVerifyCodeBtn" href="#verifyModal" class="genric-btn info-border" data-toggle="modal" data-backdrop="false">이메일 인증</a>
		                        </div>
		                    </div>
	                        <div class="mt-10">
	                            <input type="password" name="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required class="single-input">
	                        </div>
	                        <div class="mt-10">
	                            <input type="text" name="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required class="single-input">
	                        </div>
	                        <div class="mt-10">
	                            <input type="text" name="birthDate" placeholder="생년월일 8자리 ex)19980404" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일 8자리 ex)19980404'" required class="single-input">
	                        </div>
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                </div>
	                <div class="modal-footer">
	<!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> -->
	                    <button type="submit" class="btn btn-primary">회원가입</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 이메일 인증 Modal -->
    <div class="modal" id="verifyModal" tabindex="-1" role="dialog" aria-labelledby="verifyModalCenterTitle" aria-hidden="true" style="z-index: 1052;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="verifyModalLongTitle">이메일 인증</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 		                <span aria-hidden="true">&times;</span> -->
<!-- 		            </button> -->
                </div>
				<div class="modal-body">
					<br> <br> <br>
					<div class="row">
						<div class="col-md-12">
							<input type="text" name="verifyCode" placeholder="코드 6자리 ex)123456" onfocus="this.placeholder = ''" onblur="this.placeholder = '코드 6자리 ex)123456'" required class="single-input">
							<input type="hidden" id="isVerified" value="n">
						</div>
					</div>
					<br> <br> <br>
				</div>
				<div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로</button>
	                <button id="verifyBtn" class="btn btn-primary">인증</button> 
	            </div>
	        </div>
        </div>
    </div>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid ">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo">
                                    <a href="/connecthink/index">
                                        <img src="${contextPath}/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-7">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="index.html">메인홈</a></li>
                                            <li><a href="all/mateList">모집중인 멤버</a></li>
                                           
                                            <li><a href="rec">모집중인팀</a></li>
                                            <li><a href="contact.html">진행중인 공모전</a></li>
                                            <li><a href="add_project">팀 등록</a></li>
<!--                                              <li><a href="#"><img class="personicon" src="${contextPath}/img/person.png"><i class="ti-angle-down"></i></a> -->
<!--                                                 <ul class="submenu"> -->
<!--                                                     <li><a href="candidate.html">Candidates </a></li> -->
<!--                                                     <li><a href="job_details.html">job details </a></li> -->
<!--                                                     <li><a href="elements.html">elements</a></li> -->
<!--                                                 </ul> -->
<!--                                             </li> -->
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                                <div class="Appointment">
                                	<div class="personMenu">
                                        <a href="#"><img class="personicon" src="${contextPath}/img/person.png"></a>
                                         	<ul class="submenu">
                                         		<c:choose>
                                         			<c:when test="${empty sessionScope.loginInfo}">
	                                         			<li><a data-toggle="modal" href="#loginModal">로그인</a></li>
		                                            	<li><a data-toggle="modal" href="#registerModal">회원가입</a></li>
                                         			</c:when>
                                         			<c:otherwise>
                                         				<li><a href="${contextPath}/logined/customerInfo">내 정보 보기</a></li>
                                         				<li><a id="logoutBtn" href="">로그아웃</a></li>
                                         			</c:otherwise>
                                         		</c:choose>
                                            </ul>                                                                               
                                         </div>
                                        <a href="#"><img class="personicon" src="${contextPath}/img/bell.png"></a>
							<div class="sidebar">
								<a href="#"><img class="personicon" src="${contextPath}/img/pmenu.png" onclick="openNav()"></a>
								<div id="mySidenav" class="sidenav">
									<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> 
										<h4 style="padding-left: 20px;">나의 프로젝트 스페이스</h4>
										<hr>							
								</div>
							</div>
						</div>
                                
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    <!-- header-end -->
<script>

function openNav() {
		 document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	 document.getElementById("mySidenav").style.width = "0";
}

	

// var wSocket =  new WebSocket("ws://192.168.0.121/connecthink/boardEcho/inbox");
// var wSocket =  new WebSocket("ws://localhost/connecthink/boardEcho/inbox");
//     wSocket.onopen = function(e) { onOpen(e) };
//     wSocket.onclose = function(e) { onClose(e) };
//     wSocket.onmessage = function(e) { onMessage(e) };
//     wSocket.onerror = function(e) { onError(e) };
// //    wSocket.send = function(e) {SendMsg(e) };

// // 웹소켓 테스트용 변수
// var testNo = 101;
// //fxLoadAllPm(testNo);
// // fxLoadNoti(testNo);

// //---------------------- 웹소켓 함수 -------------------------------
//    //연결이 정상적으로 이루어졌을때
//    function onOpen(e) {
// 	wSocket.send(testNo + "가 접속하였습니다.");
//     alert("Welcome, " + testNo + "! WebSocket opened!");
	
//    }
//    //연결이 끊어졌을때
//    function onClose(e) {
//     alert("WebSocket closed!");
//    }
//    //메세지 수신시
//    function onMessage(e) {
// 	   msgContent = e.data;
// 	   if(msgContent == "connecthinksystem : there is no personal msg list") {
// // 		   fxLoadAllPm(testNo);
// 	   }
//     console.log(e);
// 	console.log(msgContent);
//    }
//    //에러 발생시
//    function onError(e) {
//     alert( "오류발생 : " + e.data );
//    }
   //메세지 전송시 = 웹소캣 핸들러로 전달
//    function SendMsg(e){
//  	wSocket.send("보낼 메세지 내용 : "+ e);
//    }

//----------------------- 기능 함수 -------------------------------
//내가 받은 notification 전체를 불러오는 함수
//    function fxLoadNoti(testNo){
//    	$.ajax({
//    		url:"${contextPath}/inbox/allNoti"
//    		,method:"GET"
//    			//{customerNo : ${sessionScope.loginInfo},
//    		,data: {customerNo : testNo,
//    			${_csrf.parameterName} : '${_csrf.token}'}
//    		,success:function(notiesObj){
//    			let noties = JSON.parse(notiesObj);
//    			console.log(typeof(noties));
//    			wSocket.send(noties);
//    		}
//    	});
//    }
//내가 주고 받은 personal message 전체를 불러오는 함수
//    function fxLoadAllPm(testNo){
// 	   	$.ajax({
// 	   		url:"${contextPath}/inbox/allPm"
// 	   		,method:"GET"
// 	   			//{customerNo : ${sessionScope.loginInfo},
// 	   		,data: {customerNo : testNo,
// 	   			${_csrf.parameterName} : '${_csrf.token}'}
// 	   		,success:function(personalMsgsObj){
// 	   			let personalMsgs = JSON.parse(personalMsgsObj);
// 	   			console.log(typeof(personalMsgs));
// 	   			wSocket.send(personalMsgs);
// 	   		}
// 	   	});
// 	}
</script>
</html>