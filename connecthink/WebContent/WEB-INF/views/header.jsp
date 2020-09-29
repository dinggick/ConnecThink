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
    	
    <!-- 로그인 Modal -->
    <jsp:include page="/login"></jsp:include>
    
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid ">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo">
                                    <a href="/connecthink/">
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
	                                         			<li><a id="loginBtn" data-toggle="modal" href="#loginModal">로그인</a></li>
		                                            	<li><a data-toggle="modal" href="#registerModal">회원가입</a></li>
                                         			</c:when>
                                         			<c:otherwise>
                                         				<li><a href="${contextPath}/customerInfo">내 정보 보기</a></li>
                                         				<li><a href="${contextPath}/myProject">내가 등록한 팀</a></li>
                                         				<li><a href="${contextPath}/bookmark">북마크</a></li>                                         				
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
        
        <!-- link that opens popup -->
	<!-- JS here -->
	<script src="${contextPath}/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="${contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="${contextPath}/js/popper.min.js"></script>
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script src="${contextPath}/js/owl.carousel.min.js"></script>
	<script src="${contextPath}/js/isotope.pkgd.min.js"></script>
	<script src="${contextPath}/js/ajax-form.js"></script>
	<script src="${contextPath}/js/waypoints.min.js"></script>
	<script src="${contextPath}/js/jquery.counterup.min.js"></script>
	<script src="${contextPath}/js/imagesloaded.pkgd.min.js"></script>
	<script src="${contextPath}/js/scrollIt.js"></script>
	<script src="${contextPath}/js/jquery.scrollUp.min.js"></script>
	<script src="${contextPath}/js/wow.min.js"></script>
	<script src="${contextPath}/js/nice-select.min.js"></script>
	<script src="${contextPath}/js/jquery.slicknav.min.js"></script>
	<script src="${contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/js/plugins.js"></script>
	<script src="${contextPath}/js/gijgo.min.js"></script>



	<!--contact js-->
	<script src="${contextPath}/js/contact.js"></script>
	<script src="${contextPath}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextPath}/js/jquery.form.js"></script>
	<script src="${contextPath}/js/jquery.validate.min.js"></script>
	<script src="${contextPath}/js/mail-script.js"></script>
	<script src="${contextPath}/js/main.js"></script>
	<script src="${contextPath}/js/sidenav.js"></script>

    <!-- header-end -->
<script>



function openNav() {
		 document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	 document.getElementById("mySidenav").style.width = "0";
}

//------------------------ 웹소켓 --------------------------------

//var wSocket =  new WebSocket("ws://192.168.0.121/connecthink/boardEcho/inbox");
//    wSocket.onopen = function(e) { onOpen(e) };
//    wSocket.onclose = function(e) { onClose(e) };
//    wSocket.onmessage = function(e) { onMessage(e) };
//    wSocket.onerror = function(e) { onError(e) };

//---------------------- 웹소켓 함수 -------------------------------
// //연결이 정상적으로 이루어졌을때
//   function onOpen(e) {
// wSocket.send(testNo + "가 접속하였습니다.");
//    alert("Welcome, " + testNo + "! WebSocket opened!");
//   }
// //연결이 끊어졌을때
//   function onClose(e) {
//    alert("WebSocket closed!");
//   }
// //메세지 수신시
//   function onMessage(e) {
// msgContent = e.data;
//    console.log(e);
// console.log(msgContent);
//   }
// //에러 발생시
//   function onError(e) {
//    alert( "오류발생 : " + e.data );
//   }

//----------------------- 기능 함수 -------------------------------
//내가 받은 notification 전체를 불러오는 함수
// function fxLoadNoti(testNo){
//    $.ajax({
//       url:"${contextPath}/inbox/allNoti"
//       ,method:"GET"
//          //{customerNo : ${sessionScope.loginInfo},
//       ,data: {customerNo : testNo,
//          ${_csrf.parameterName} : '${_csrf.token}'}
//       ,success:function(notiesObj){
//          let noties = JSON.parse(notiesObj);
//          console.log(typeof(noties));
//          wSocket.send(noties);
//       }
//    });
// }
//내가 주고 받은 personal message 전체를 불러오는 함수
// function fxLoadAllPm(testNo){
//       $.ajax({
//          url:"${contextPath}/inbox/allPm"
//          ,method:"GET"
//             //{customerNo : ${sessionScope.loginInfo},
//          ,data: {customerNo : testNo,
//             ${_csrf.parameterName} : '${_csrf.token}'}
//          ,success:function(personalMsgsObj){
//             let personalMsgs = JSON.parse(personalMsgsObj);
//             console.log(typeof(personalMsgs));
//             wSocket.send(personalMsgs);
//          }
//       });
// }


</script>
</html>