<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%-- <c:set var="notification" value="${request.notification }"/> --%>
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
                                            <li><a href="${contextPath}/about">서비스 소개</a></li>
                                            <li><a href="${contextPath}/all/customerList">모집중인 회원</a></li>
                                            <li><a href="${contextPath}/all/rec">모집중인 프로젝트</a></li>
                                            <li><a href="contact.html">진행중인 공모전</a></li>
                                            <li><a href="${contextPath}/logined/add_project">프로젝트 등록</a></li>                                           
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
                                         				<li><a href="${contextPath}/logined/customerInfo">내 정보 보기</a></li>
                                         				<li><a href="${contextPath}/logined/myProject">나의 프로젝트</a></li>
                                         				<li><a href="${contextPath}/logined/bookmark">북마크</a></li>                                         				
                                         				<li><a id="logoutBtn" href="">로그아웃</a></li>
                                         			</c:otherwise>
                                         		</c:choose>
                                            </ul>                                                                               
                                         </div>
                                        <a href="#" onclick="inbox()"><img class="personicon" id ="bell" src="${contextPath}/img/bell.png"></a>
                                        <a href="#" onclick="inbox()"><img class="personicon" id ="notibell" style="display:none" src="${contextPath}/img/notification.png"></a>
                                        
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
// $(document).ready(function(){
// 	if ('${notification}' =="n") {
// 		$('#bell').show();
// 	$('#notibell').hide();	
// 	} else {
// 		$('#bell').hide();
// 		$('#notibell').show();	
// 	}
	
// });
var loginedCustomer = ${sessionScope.loginInfo};

function openNav() {

       document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
}
function inbox(){
	$('#bell').show();
	$('#notibell').hide();	
	let url = "${contextPath}/logined/inbox" ;
	location.href = url;	
}

//------------------------ 웹소켓 --------------------------------

var wSocket =  new WebSocket("ws://localhost/connecthink/header/inbox");
    wSocket.onopen = function(e) { onOpen(e) };
    wSocket.onclose = function(e) { onClose(e) };
    wSocket.onmessage = function(e) { onMessage(e) };
    wSocket.onerror = function(e) { onError(e) };

//---------------------- 웹소켓 함수 -------------------------------
   //연결이 정상적으로 이루어졌을때
   function onOpen(e) {
	///------------메인화면에서 노티아이콘 보여줄지 결정-----------------
	wSocket.send("connecthinksystem:checkNoti:");
   }
   //연결이 끊어졌을때
   function onClose(e) {
    alert("WebSocket closed!");
   }
   //메세지 수신시
   function onMessage(e) {	
	   console.log(e.data);
	if (e.data.includes("connecthinksystem:checkNoti:true")){
		$('#bell').hide();
		$('#notibell').show();	
	}
	//수신한 메세지가 상대방 목록 불러오기인 경우
	if (e.data.includes("connecthinksystem:loadList:")){
		let otherStr = "";
		if(e.data.includes("connecthinksystem:loadList:refresh:")){
			//처음 항목이 올 때는 리스트를 비운다.
			$listSection.html("");
			otherStr = e.data.replace("connecthinksystem:loadList:refresh:","");
		} else {
			otherStr = e.data.replace("connecthinksystem:loadList:","");
		}
		//상대방 정보를 JSON 객체로 파싱한다.
		otherObj = JSON.parse(otherStr);

		//list 영역의 html을 바꾼다.
		let sectionData = $listSection.html();
		sectionData += '<li class="person" id="otherNo' + otherObj.otherNo + '"><span class="otherNoInList">' + otherObj.otherNo + '</span>';
		sectionData += '<span class="personName">' + otherObj.otherName + '</span>';
		if(otherObj.newCnt != 0){
			sectionData += '<span class="new">' + otherObj.newCnt + '</span>';
		} else {
			//새로운 메세지가 없을 경우 새 메세지 카운트 딱지 안 보이게 하기
			sectionData += '<span class="new" style="display:none;">' + otherObj.newCnt + '</span>';
		}
		sectionData += '<br><span class="msgPreview">' + otherObj.content + '</span></li>';
		$listSection.html(sectionData);
	}
	//수신한 메세지가 특정 회원과 주고받은 메세지 전체를 불러오기인 경우
	else if (e.data.includes("connecthinksystem:loadPms:")){
		let pmsStr = e.data.replace("connecthinksystem:loadPms:","");
		MSGs = JSON.parse(pmsStr);
		let sectionData = "";
		let newDate = new Date(0);
		let isFirstUnreadMsg = true;
		MSGs.forEach(function(msg, index){
			let sendDate = new Date(msg.createDate);
			//날짜가 바뀔 때마다 날짜 써주기.
			if(newDate.getFullYear() != sendDate.getFullYear() || newDate.getMonth() != sendDate.getMonth() || newDate.getDate() != sendDate.getDate()){
				sectionData += '<div class="msg_date">' + sendDate.getFullYear()+'.';
				if( (sendDate.getMonth()+1) < 10 ){
					sectionData += '0' + (sendDate.getMonth()+1) + '.';
				} else {
					sectionData += (sendDate.getMonth()+1) + '.';
				}
				if( sendDate.getDate() < 10 ) {
					sectionData += '0' + sendDate.getDate() + "</div>";
				} else {
					sectionData += sendDate.getDate() + "</div>";
				}
				newDate = sendDate;
			}
			if(msg.receive.customerNo == loginedCustomer) {
				//내가 받은 사람일 경우
				//아직 읽지 않은 메세지 중 첫번째 메세지의 위에 여기까지 읽었다고 표시해주기.
				if(msg.status==0 && isFirstUnreadMsg==true) {
				sectionData += '<div id="firstUnreadMsg">여기까지 읽으셨습니다</div>';
				isFirstUnreadMsg = false;
				}
				sectionData += '<div class="receive_msg">' + msg.content + '</div>';
				if( sendDate.getHours() < 10 ) {
					sectionData += '<div class="receive_time">' + '0' + sendDate.getHours() +':';
				} else {
					sectionData += '<div class="receive_time">' + sendDate.getHours() +':';
				}
				if( sendDate.getMinutes() < 10 ) {
					sectionData += '0' + sendDate.getMinutes() + '</div>';
				} else {
					sectionData += sendDate.getMinutes() + '</div>';
				}
				sectionData += '<div style="clear:both;"></div>';
			} else {
				//내가 보낸 사람일 경우
				sectionData += '<div class="send_msg">' + msg.content + '</div>';
				if( sendDate.getHours() < 10 ) {
					sectionData += '<div class="send_time">' + '0' + sendDate.getHours() +':';
				} else {
					sectionData += '<div class="send_time">' + sendDate.getHours() +':';
				}
				if( sendDate.getMinutes() < 10 ) {
					sectionData += '0' + sendDate.getMinutes() + '</div>';
				} else {
					sectionData += sendDate.getMinutes() + '</div>';
				}
				sectionData += '<div style="clear:both;"></div>';
			}
		});
		$msgSection.html(sectionData);
		//'여기까지 읽으셨습니다' 표시로 스크롤 이동시키기
		if ($("#firstUnreadMsg").length > 0){
			//표시가 있을 경우
	 		let scrollLocation = document.querySelector("#firstUnreadMsg").offsetTop - 107;
	 		$msgSection.scrollTop(scrollLocation);
		}else{
			//표시가 없을 경우 메세지를 전부 읽은 것이므로 바닥으로 이동
			let scrollLocation = $msgSection.prop('scrollHeight');
			$msgSection.scrollTop(scrollLocation);
		}
	}
	  else if (e.data.includes("connecthinksystem:loadNotis:")){		 
		   $('#notinew').hide();
		   let pmStr = e.data.replace("connecthinksystem:loadNotis:", "");	  
		   MSGs = JSON.parse(pmStr);
		   console.log(MSGs);
		      let sectionData = "";
		      let newDate = new Date(0);
		      MSGs.forEach(function(msg, index){
		         let sendDate = new Date(msg.notifyDate);
		         if(newDate.getFullYear() != sendDate.getFullYear() || newDate.getMonth() != sendDate.getMonth() || newDate.getDate() != sendDate.getDate()){
		            sectionData += '<div class="msg_date">' + sendDate.getFullYear()+"."+(sendDate.getMonth()+1)+"."+sendDate.getDate() + "</div>";
		            newDate = sendDate;
		         }
		        	sectionData += '<div class="receive_msg">' + msg.content + '</div>';
		            sectionData += '<div class="receive_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
		            sectionData += '<div style="clear:both;"></div>';
		      });
		      $msgSection.html(sectionData);
		   }
	//수신한 메세지가 Personal Message인 경우
	else if (e.data.includes("connecthinksystem:pm:")){
		let pmStr = e.data.replace("connecthinksystem:pm:","");
		pmObj = JSON.parse(pmStr);
		console.log(pmObj);
		//inbox에 들어와있을 때 할 작업.
		if(window.location.href.includes("inbox")) {
			let otherNo = "";
			let otherName = "";
			if(pmObj.receive.customerNo == loginedCustomer) {
				otherNo = pmObj.send.customerNo;
				otherName = pmObj.send.name;
			} else {
				otherNo = pmObj.receive.customerNo;
				otherName = pmObj.receive.name;
			}
			if( $(".otherNoInBox").html().trim()==otherNo ){
				//pm을 보낸 상대방과의 메세지함에 들어와있을 경우, 메세지박스 안의 화면을 바꿔준다.
				let sectionData = $msgSection.html();
				let sendDate = new Date(pmObj.createDate);
				if(pmObj.receive.customerNo == loginedCustomer) {
					sectionData += '<div class="receive_msg">' + pmObj.content + '</div>';
					sectionData += '<div class="receive_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
					sectionData += '<div style="clear:both;"></div>';
					//메세지를 읽은 것이므로 읽음 상태를 변경함.
 					updateStatus(pmObj.personalMsgNo);
				} else {
					sectionData += '<div class="send_msg">' + pmObj.content + '</div>';
					sectionData += '<div class="send_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
					sectionData += '<div style="clear:both;"></div>';
				}
				$msgSection.html(sectionData);
				//스크롤을 바닥으로 이동
				let scrollLocation = $msgSection.prop('scrollHeight');
				$msgSection.scrollTop(scrollLocation);
			} else {
				//다른 메세지함이나 알림을 보고있을 경우, 리스트에서 pm을 보낸 상대방을 찾아서 알림표시를 붙인다. 상대방이 없을 경우 상대방을 추가한다.
				let $otherLi = $("ul.personList").find("#otherNo"+otherNo);
				if($otherLi.length > 0){
					//리스트에 해당 회원이 존재하는 경우 : 새 메세지 카운트 딱지를 새로 붙이거나 카운트+1을 해준다.
					$otherLi.find(".new").html( ($otherLi.find(".new").html()*1) +1 );
					$otherLi.find(".new").css("display", "inline");
					$otherLi.find(".msgPreview").html(pmObj.content);
				} else{
					//리스트에 해당 회원이 존재하지 않은 경우 : 리스트에 해당 회원을 추가한다.
					let sectionData = $listSection.html();
					sectionData += '<li class="person" id="otherNo' + otherNo + '"><span class="otherNoInList">' + otherNo + '</span>';
					sectionData += '<span class="personName">' + otherName + '</span>';
					sectionData += '<span class="new">' + 1 + '</span>';
					sectionData += '<br><span class="msgPreview">' + pmObj.content + '</span></li>';
					$listSection.html(sectionData);
				}
			}
		} else {
			$('#bell').hide();
			$('#notibell').show();
		}
	}
   }
   
   //에러 발생시
   function onError(e) {
    alert( "오류발생 : " + e.data );
   }
   
//------------------------ Ajax ------------------------------
//메세지 함에 들어와있을 때 전송된 메세지를 읽음 처리
function updateStatus(personalMsgNo) {
	$.ajax({
		url:"${contextPath}/inbox/updateStatusOne"
		,data: {'personalMsgNo' : personalMsgNo}
	});
}
</script>
</html>