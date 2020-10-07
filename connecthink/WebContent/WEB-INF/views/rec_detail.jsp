<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="detail" value="${requestScope.detail}" />
<c:set var="manager" value="${requestScope.manager}" />
<c:set var="member" value="${requestScope.member}" />
<c:set var="recNo" value="${requestScope.recNo}" />
<c:set var="bmCount" value="${requestScope.bmCount}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>모집상세</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="${contextPath}/img/favicon.png">
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
<!-- <link rel="stylesheet" href="${contextPath}/css/responsive.css"> -->

<style>
.thumb {
	width: 55px !important;
	height: 55px !important;
	display: inline-block;
}

.thumb img {
	width: 55px !important;
	height: 55px !important;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
}

img.bm {
	width: 5%;
	overflow: hidden;
	transition: 0.5s;
	display: inline-block;
}

img.on {
	width: 5%;
	overflow: hidden;
	transition: 0.5s;
	display: none;
}

.boxed-btn {
	width: 140px !important;
}

.rec_no {
	display: none;
}

li::before {
	content: unset !important;
}

li {
	color: black !important;
}

span.customerNo {
	display: none;
}
</style>

</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<jsp:include page="/header"></jsp:include>
	</header>

	<!-- header-end -->

	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_1">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>모집상세</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->
	<!-- 모집상세 내용 -->
	<div class="job_details_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="job_details_header ">
						<div class="single_jobs white-bg d-flex justify-content-between">
							<div class="jobs_left">
								<div class="jobs_conetent mt-1">
									<h3>${detail.title}</h3>
								</div>
							</div>
							<div class="jobs_right text-right pt-2">
								<div class="apply_now">
									<span class="bm_count">${bmCount}</span> <img
										src="${contextPath}/img/bookmark.png" class="bm mr-2"
										onclick="bookmark();"> <img
										src="${contextPath}/img/bookmark2.png" class="on mr-2"
										onclick="delmark();"> <span class="rec_no">${recNo}</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 제목 밑 -->
					<div class="descript_wrap white-bg"
						style="border-bottom: 1px solid #EAEAEA;">
						<div class="single_wrap project_info">
							<h4>우리 프로젝트가 찾고 있는 사람</h4>
							<ul class="rec_wanna">
								<c:forEach items="${detail.recruits}" var="rec"
									varStatus="status">
									<c:if test="${recNo eq rec.recruitNo}">
										<li>모집직무 : ${rec.position.name}</li>
										<li>모집인원 : ${rec.headCount}</li>
										<li>요구사항 : ${rec.requirement}</li>
										<fmt:formatDate var="dl" value="${rec.deadline}"
											pattern="yyyy-MM-dd" />
										<li>모집기한 : ${dl}</li>
										<li>모집상세</li>
										<c:forEach items="${requestScope.fList}" var="fList"
											varStatus="status">
											<span style="padding-left: 50px;">${fList}</span>
											<br>
										</c:forEach>
									</c:if>
								</c:forEach>
							</ul>
						</div>
						<hr>
						<div class="single_wrap team_info mt-2">
							<h4 class="mb-2">우리 프로젝트는요?</h4>
							<ul class="mb-4">
								<li>${detail.about}</li>
							</ul>
							<h4 class="mb-2 mt-2">우리 프로젝트의 주제</h4>
							<ul class="mb-4">
								<li>${detail.theme}</li>
							</ul>
							<h4 class="mb-2 mt-2">우리 프로젝트의 목적</h4>
							<ul class="mb-4">
								<li>${detail.purpose}</li>
							</ul>

							<div class="team_member mt-2">
								<!-- 팀원 프로필 -->
								<h4 class="mt-3">프로젝트를 함께 할 팀원</h4>
								<c:forEach items="${member}" var="member" varStatus="status">
									<div class="single_candidates mb-4 mr-3"
										style="display: inline-block;">
										<div class="thumb text-center mr-2">
											<img
												src="http://localhost/storage/customer/${member.customerNo}.jpg"
												onerror="this.src='${contextPath}/img/d2.jpg'" alt="프로필사진"
												onclick="memberDetail(this);"> <span
												class="customerNo">${member.customerNo}</span> <span
												style="font-size: 0.9em;">${member.name}</span>
										</div>
									</div>
								</c:forEach>
								<!-- 프로필 끝 -->
							</div>
						</div>
					</div>
					<!-- 컨텐츠 끝 -->
					<div class="single_jobs white-bg d-flex justify-content-between"
						style="height: 160px !important;">
						<div class="rec_foot_left">
							<!-- 팀장 프로필 -->
							<div class="thumb text-center mr-2">
								<div style="width: 70px; height: 99px;">
									<div>[팀장]</div>
									<img
										src="http://localhost/storage/customer/${manager.customerNo}.jpg"
										onerror="this.src='${contextPath}/img/d2.jpg'" alt="프로필사진"
										onclick="memberDetail(this);" class="mt-1"> <span
										class="customerNo">${manager.customerNo}</span>
									<div>${manager.name}</div>
								</div>
							</div>
						</div>
						<div class="rec_foot_right">
							<button class="boxed-btn mt-4 message" onclick="openModal();">메세지</button>
							<button class="boxed-btn mt-4 rec" onclick="apply();">지원하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 메세지 모달 -->
	<div class="modal fade" id="msgModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="loginModalLongTitle">메세지</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="col-md-9">
						<textarea id="msg_content" rows="10" cols="50"
							style="border: none; resize: none"></textarea>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="sendButton"
						onclick="sendPersonalMsg()">보내기</button>

				</div>
			</div>

		</div>
	</div>

	<!-- 종료 모달  -->
	<div class="modal fade" id = "ending">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title">종료 된 모집</h4>
				</div>
				<div class="modal-body text-center p-5">
					<h5>모집이 종료 되었습니다 :(</h5>
				</div>
				<div class="modal-footer ending">
					<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/'">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->




	<!-- 본문 끝 -->
	<!-- footer start -->
	<footer class="footer">
		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	</footer>
	<!--/ footer end  -->

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

	<!-- script -->
	<script>

	let managerNo = "${manager.customerNo}";
	let customerNo = "${sessionScope.loginInfo}";
	<c:forEach items="${detail.recruits}" var="rec" varStatus="status">
		<c:if test="${recNo eq rec.recruitNo}">
			var recName = "${rec.requirement}";
			var status = "${rec.recruitStatus}";
		</c:if>
	</c:forEach>
	
	$(function(){
		bookClick();
		if(managerNo == customerNo){
			let $section = $("div.rec_foot_right");
			let data = "";
			data += '<button class="boxed-btn mt-4" onclick="modify();">수정하기</button>';
			data += '<button class="boxed-btn mt-4 ml-2" onclick="del();">삭제하기</button>';
			$section.html(data);
			
			let $mdal = $("div.ending");
			let mdata = "";
			mdata =	'<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>'
			$mdal.html(mdata);
		}
		
		if(status == 2){
			$(".boxed-btn").css("display","none");
			$("#ending").modal("show").css({
				"margin-top" : function(){
					return ($(this).height()/3);
				}
			});
		}
	});
	
		//북마크 추가
		function bookmark() {
			if(customerNo == ""){
				alert("로그인 후 사용 가능합니다");
			}else{
				let no = $("span.rec_no").text();
				$.ajax({
					url : "${contextPath}/logined/bmToRec",
					method : "POST",
					data : {
						recruitNo : no,
						${_csrf.parameterName} : '${_csrf.token}'
					},
					success : function(data) {
						console.log(data);
						
						if (data == "success") {
							count();
							$("img.bm").css("display", "none");
							$("img.on").css("display", "inline-block");
						}
					}
				});
			}
		}

		//북마크 삭제
		function delmark() {
			let no = $("span.rec_no").text();
			
			$.ajax({
				url : "${contextPath}/logined/delBmToRec",
				method : "POST",
				data : {
					recruitNo : no,
					${_csrf.parameterName} : '${_csrf.token}'
				},
				success : function(data) {
					console.log(data);
					if(data == "success") {
						count();
					$("img.bm").css("display", "inline-block");
					$("img.on").css("display", "none");
					}
				}
			});
			
		}

		//팀원 상세
		function memberDetail(e) {
			if(customerNo == ""){
				alert("로그인 후 사용 가능 합니다");
			} else {
				let $cNo = $(e).siblings("span.customerNo").html();
				let url = "${contextPath}/logined/member_detail?customerNo="+$cNo;
				window.open(url,"_blank", "height=800, width=800");
			}
		}

		//수정하기
		function modify() {
			let recNo = "${recNo}";
			let answer = confirm('"'+recName+'"' + "을(를) 수정하시겠습니까?");
			if(answer == true){
				location.href = "${contextPath}/logined/modify_rec?recNo="+recNo;
			}
			
		}
		
		//지원하기
		function apply(){
			let recNo = "${recNo}";
			let managerNo = "${manager.customerNo}";
			var notiContent = "님이" + "${detail.title}" + "에 지원을 하였습니다.";
			console.log(notiContent);
			if(customerNo == ""){
				alert("로그인 후 사용 가능합니다");
			} else {
				let answer = confirm("지원하시겠습니까?");
				if(answer == true){
					$.ajax({
						url : "${contextPath}/logined/recruit",
						method : "POST",
						data :  {
							recruitNo : recNo,
							${_csrf.parameterName} : '${_csrf.token}'
						},
						success: function(response){
							if(response == "success"){
								alert("지원 성공");
								wSocket.send("connecthinksystem:nto:"+ managerNo + ":" + notiContent);
							} else {
								alert("이미 지원했거나 속해있는 프로젝트 입니다");
							}
						}
					});
				}//true / false 비교
			} //customerNo 비교
				
		}
		
		//삭제하기
		function del() {
			let recNo = "${recNo}";
			let answer = confirm('"'+recName+'"' + "을(를) 삭제하시겠습니까?");
			if(answer == true){
			$.ajax({
				url : "${contextPath}/logined/delRec",
				method : "POST",
				data : {recruitNo : recNo,
						${_csrf.parameterName} : '${_csrf.token}'},
				success : function(response){
					if(response.status == "success"){
						alert("삭제 완료");
						location.href="${contextPath}/logined/myProject"
					} else {
						alert(response.msg);
					}
				}
			});
			} else {
				alert("취소");
			}
			return false;
		}
		
		//북마크 카운트
		function count(){
			let recNo = "${recNo}";
			$.ajax({
				url : "${contextPath}/count",
				method:"POST",
				data : {recruitNo : recNo,
						${_csrf.parameterName} : '${_csrf.token}'},
				success : function(data){
					
					let $section = $(".apply_now");
					$sectionReplace = $section.replaceWith($section);
					$sectionReplace.find("span.bm_count").html(data);				
				}
			});
		}
		
		//북마크 한 목록 과 비교
		function bookClick (){
			let recNo = "${recNo}";
			$.ajax({
				url : "${contextPath}/logined/recBm",
				method : "POST",
				data : {recruitNo : recNo,
					${_csrf.parameterName} : '${_csrf.token}'},
				success :  function(list) {
					list.forEach(function(bm, index){
						if(bm.recruit.recruitNo == recNo){
							$("img.bm").css("display", "none");
							$("img.on").css("display", "inline-block");
						}
					});
				}	
			});
		}
		
		//메세지 모달 열기
		function openModal(){
			$("#msgModal").modal("show");
		}
		
		//메세지 보내기
		function sendPersonalMsg(){
			let $msgContent = $("#msg_content");
			let pmContent = $msgContent.val();
			//회원이 전송하려고하는 메세지에 포함되면 안되는 문자가 포함되었을 때 막기
			if(pmContent.includes("connecthinksystem")){
				alert("회원 간 메세지에 connecthinksystem 을 포함할 수 없습니다.");
				$msgContent.val(pmContent.replace("connecthinksystem", ""));
			} else if (pmContent == "") {
				alert("공백을 전송할 수 없습니다.");
			} else {
				//웹소켓으로 메세지 전송
				wSocket.send("connecthinksystem:to:" + managerNo + ":" + pmContent);
				alert("메세지를 전송하였습니다.");
				//입력창 비우고 모달 창 닫기
				$msgContent.val("");
				$("#msgModal").modal("hide");
			}
		}
	</script>
</body>

</html>