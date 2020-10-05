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
                                            <li><a href="${contextPath}/all/mateList">모집중인 멤버</a></li>
                                           
                                            <li><a href="${contextPath}/all/rec">모집중인 프로젝트</a></li>
                                            <li><a href="contact.html">진행중인 공모전</a></li>
                                            <li><a href="add_project">프로젝트 등록</a></li>
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
                                         				<li><a href="${contextPath}/myProject">나의 프로젝트</a></li>
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
var loginedCustomer = ${sessionScope.loginInfo};

function openNav() {

       document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
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
//     alert("Welcome, " + loginedCustomer + "! WebSocket opened!");
   }
   //연결이 끊어졌을때
   function onClose(e) {
    alert("WebSocket closed!");
   }
   //메세지 수신시
   function onMessage(e) {

   console.log(e.data);
   //수신한 메세지가 상대방 목록 불러오기인 경우
   if (e.data.includes("connecthinksystem:loadList:")){
      let otherStr = "";
      //처음 항목이 올 때는 리스트를 비운다.
      if(e.data.includes("connecthinksystem:loadList:refresh:")){
         $listSection.html("");
         otherStr = e.data.replace("connecthinksystem:loadList:refresh:","");
      } else {
         otherStr = e.data.replace("connecthinksystem:loadList:","");
      }
      otherObj = JSON.parse(otherStr);
      console.log(otherObj);
      
      let sectionData = $listSection.html();
      sectionData += '<li class="person"><span class="otherNo" id="otherNoInList">' + otherObj.otherNo + '</span>';
      sectionData += '<span class="personName">' + otherObj.otherName + '</span>';
      if(otherObj.newCnt != 0){
         sectionData += '<span class="new">' + otherObj.newCnt + '</span>';
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
      MSGs.forEach(function(msg, index){
         let sendDate = new Date(msg.createDate);
         if(newDate.getFullYear() != sendDate.getFullYear() || newDate.getMonth() != sendDate.getMonth() || newDate.getDate() != sendDate.getDate()){
            sectionData += '<div class="msg_date">' + sendDate.getFullYear()+"."+(sendDate.getMonth()+1)+"."+sendDate.getDate() + "</div>";
            newDate = sendDate;
         }
         if(msg.receive.customerNo == loginedCustomer) {
            sectionData += '<div class="receive_msg">' + msg.content + '</div>';
            sectionData += '<div class="receive_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
            sectionData += '<div style="clear:both;"></div>';
         } else {
            sectionData += '<div class="send_msg">' + msg.content + '</div>';
            sectionData += '<div class="send_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
            sectionData += '<div style="clear:both;"></div>';
         }
      });
      $msgSection.html(sectionData);
   }
   //수신한 메세지가 Personal Message인 경우
   else if (e.data.includes("connecthinksystem:pm:")){
      let pmStr = e.data.replace("connecthinksystem:pm:","");
      pmObj = JSON.parse(pmStr);
      let sectionData = $msgSection.html();
      let sendDate = new Date(pmObj.createDate);
      if(pmObj.receive.customerNo == loginedCustomer) {
         sectionData += '<div class="receive_msg">' + pmObj.content + '</div>';
         sectionData += '<div class="receive_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
         sectionData += '<div style="clear:both;"></div>';
      } else {
         sectionData += '<div class="send_msg">' + pmObj.content + '</div>';
         sectionData += '<div class="send_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
         sectionData += '<div style="clear:both;"></div>';
      }
      $msgSection.html(sectionData);
   }

	//수신한 메세지가 상대방 목록 불러오기인 경우
	if (e.data.includes("connecthinksystem:loadList:")){
		let otherStr = "";
		//처음 항목이 올 때는 리스트를 비운다.
		if(e.data.includes("connecthinksystem:loadList:refresh:")){
			$listSection.html("");
			otherStr = e.data.replace("connecthinksystem:loadList:refresh:","");
		} else {
			otherStr = e.data.replace("connecthinksystem:loadList:","");
		}
		otherObj = JSON.parse(otherStr);
		
		let sectionData = $listSection.html();
		sectionData += '<li class="person"><span class="otherNo" id="otherNoInList">' + otherObj.otherNo + '</span>';
		sectionData += '<span class="personName">' + otherObj.otherName + '</span>';
		if(otherObj.newCnt != 0){
			sectionData += '<span class="new">' + otherObj.newCnt + '</span>';
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
		MSGs.forEach(function(msg, index){
			let sendDate = new Date(msg.createDate);
			if(newDate.getFullYear() != sendDate.getFullYear() || newDate.getMonth() != sendDate.getMonth() || newDate.getDate() != sendDate.getDate()){
				sectionData += '<div class="msg_date">' + sendDate.getFullYear()+"."+(sendDate.getMonth()+1)+"."+sendDate.getDate() + "</div>";
				newDate = sendDate;
			}
			if(msg.receive.customerNo == loginedCustomer) {
				sectionData += '<div class="receive_msg">' + msg.content + '</div>';
				sectionData += '<div class="receive_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
				sectionData += '<div style="clear:both;"></div>';
			} else {
				sectionData += '<div class="send_msg">' + msg.content + '</div>';
				sectionData += '<div class="send_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
				sectionData += '<div style="clear:both;"></div>';
			}
		});
		$msgSection.html(sectionData);
	}
	//수신한 메세지가 Personal Message인 경우
	else if (e.data.includes("connecthinksystem:pm:")){
		let pmStr = e.data.replace("connecthinksystem:pm:","");
		pmObj = JSON.parse(pmStr);
		let sectionData = $msgSection.html();
		let sendDate = new Date(pmObj.createDate);
		if(pmObj.receive.customerNo == loginedCustomer) {
			sectionData += '<div class="receive_msg">' + pmObj.content + '</div>';
			sectionData += '<div class="receive_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
			sectionData += '<div style="clear:both;"></div>';
		} else {
			sectionData += '<div class="send_msg">' + pmObj.content + '</div>';
			sectionData += '<div class="send_time">' + sendDate.getHours() +':'+ sendDate.getMinutes() + '</div>';
			sectionData += '<div style="clear:both;"></div>';
		}
		$msgSection.html(sectionData);
	}

   }
   //에러 발생시
   function onError(e) {
    alert( "오류발생 : " + e.data );
   }
</script>
</html>