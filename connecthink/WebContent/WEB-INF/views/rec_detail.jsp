<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

<style>
.thumb {
	width: 55px !important;
	height: 55px !important;
	display: inline-block;
}

.thumb img {
	width: 100%;
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
								<div class="jobs_conetent mt-1 text-center">
									<h2>${detail.title}</h2>
								</div>
							</div>
							<div class="jobs_right text-right pt-2">
								<div class="apply_now">
									<span class="bm_count">${bmCount}</span> <img
										src="img/bookmark.png" class="bm mr-2" onclick="bookmark();">
									<img src="img/bookmark2.png" class="on mr-2"
										onclick="delmark();"> <span class="rec_no">${recNo}</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 제목 밑 -->
					<div class="descript_wrap white-bg"
						style="border-bottom: 1px solid #EAEAEA;">
						<div class="single_wrap team_info">
							<h4 class="mb-2">소개</h4>
							<ul>
								<li>${detail.about}</li>
							</ul>
							<h4 class="mb-2 mt-2">목적</h4>
							<ul>
								<li>${detail.purpose}</li>
							</ul>
							<div class="team_member mt-2">
								<!-- 팀원 프로필 -->
								<h4 class="mt-3">팀원</h4>
								<c:forEach items="${member}" var="member" varStatus="status">
									<div class="single_candidates mb-4 mr-3"
										style="display: inline-block;">
										<div class="thumb text-center mr-2">
											<img src="img/candiateds/1.png" alt="" onclick="modal(this);">
											<span class="customerNo">${member.customerNo}</span> <span
												style="font-size: 0.9em;">${member.name}</span>
										</div>
									</div>
								</c:forEach>
								<!-- 프로필 끝 -->
							</div>
						</div>
						<div class="single_wrap project_info">
							<h4>모집 소개</h4>
							<ul class="rec_wanna">
								<c:forEach items="${detail.recruits}" var="rec"
									varStatus="status">
									<c:if test="${recNo eq rec.recruitNo}">
										<li>모집직무 : ${rec.position.name}</li>
										<li>모집인원 : ${rec.headCount}</li>
										<li>요구사항 : ${rec.requirement}</li>
										<fmt:formatDate var="dl" value="${rec.deadline}" pattern="yyyy-MM-dd"/>
										<li>모집기한 : ${dl}</li>
										<li>모집상세</li>
											<ul>
										<c:forEach items="${requestScope.fList}" var="fList" varStatus="status">
											<li style="padding-left: 50px;">${fList}</li>
										</c:forEach>
											</ul>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<!-- 컨텐츠 끝 -->
					<div class="single_jobs white-bg d-flex justify-content-between"
						style="height: 160px !important;">
						<div class="rec_foot_left">
							<!-- 팀장 프로필 -->
							<div class="thumb text-center mr-2">
								<span>[팀장]</span> <img src="img/candiateds/1.png" alt="프로필"
									class="mt-1" onclick="modal(this);"> <span
									class="customerNo">${manager.customerNo}</span> <span>${manager.name}</span>
							</div>
						</div>
						<div class="rec_foot_right">
							<button class="boxed-btn mt-4 message" onclick="message(this);">메세지</button>
							<button class="boxed-btn mt-4 rec" onclick="apply();">지원하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 본문 끝 -->
	<!-- footer start -->
	<footer class="footer">
		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
	</footer>
	<!--/ footer end  -->

	<!-- link that opens popup -->
	<!-- JS here -->
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



	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>


	<script src="js/main.js"></script>

	<!-- script -->
	<script>

	let managerNo = "${manager.customerNo}";
	let customerNo = "${sessionScope.loginInfo}";
	<c:forEach items="${detail.recruits}" var="rec" varStatus="status">
		<c:if test="${recNo eq rec.recruitNo}">
			var recName = "${rec.requirement}";
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
		}
	});
	
		//북마크 추가
		function bookmark() {
			let no = $("span.rec_no").text();
			$.ajax({
				url : "${contextPath}/bmToRec",
				method : "POST",
				data : {
					recruitNo : no,
					customerNo : ${sessionScope.loginInfo},
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

		//북마크 삭제
		function delmark() {
			let no = $("span.rec_no").text();
			
			$.ajax({
				url : "${contextPath}/delBmToRec",
				method : "POST",
				data : {
					recruitNo : no,
					customerNo : ${sessionScope.loginInfo},
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

		//팀원 모달
		function modal(e) {
			let $cNo = $(e).siblings("span.customerNo").html();
			alert($cNo);
		}

		//수정하기
		function modify() {
			let recNo = "${recNo}";
			let answer = confirm('"'+recName+'"' + "을(를) 수정하시겠습니까?");
			if(answer == true){
				location.href = "${contextPath}/modify_rec?recNo="+recNo;
			}
			
		}

		//삭제하기
		function del() {
			console.log("버튼 클릭");
			let recNo = "${recNo}";
			let answer = confirm('"'+recName+'"' + "을(를) 삭제하시겠습니까?");
// 			if(answer == true){
// 			$.ajax({
// 				url : "${contextPath}/recruit",
// 				method : "POST",
// 				data : {recruitNo : recNo,
// 						customerNo : ${sessionScope.loginInfo},
// 						${_csrf.parameterName} : '${_csrf.token}'},
// 				success : function(data){
// 					if(data == "success"){
// 						alert("지원 완료");						
// 					}
// 				}
// 			});
// 			} else {
				
// 			}
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
					console.log(data);
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
				url : "${contextPath}/recBm",
				method : "POST",
				data : {recruitNo : recNo,
					customerNo : ${sessionScope.loginInfo},
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
	</script>
</body>

</html>