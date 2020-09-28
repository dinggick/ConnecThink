<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="detail" value="${requestScope.detail}" />
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>팀상세</title>
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
li::before {
	content: unset !important;
}

li {
	color: black !important;
}

span.customerNo {
	display: none;
}

.project_foot_left ul li {
	padding-left: 25px;
}

.recTitle:hover{
	color: #00D363 !important;
	font-weight: bold;
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
						<h3>팀상세</h3>
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
							<div class="jobs_right">
								<div class="jobs_conetent mt-1 text-center">
									<fmt:formatDate var="cdt" value="${detail.createDate}"
										pattern="yyyy-MM-dd" />
									<span>${cdt}</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 제목 밑 -->
					<div class="descript_wrap white-bg"
						style="border-bottom: 1px solid #EAEAEA;">
						<div class="single_wrap team_info">
							<h4 class="mb-2">한줄소개</h4>
							<ul>
								<li>${detail.about}</li>
							</ul>
							<h4 class="mb-2 mt-2">주제</h4>
							<ul>
								<li>${detail.theme}</li>
							</ul>
							<h4 class="mb-2 mt-2">목적</h4>
							<ul>
								<li>${detail.purpose}</li>
							</ul>
						</div>
					</div>
					<!-- 컨텐츠 끝 -->
					<div class="single_jobs white-bg d-flex justify-content-between">
						<div class="project_foot_left">
							<div>
								<h4 class="mb-3">모집 목록</h4>
							</div>
							<ul>
								<c:forEach items="${detail.recruits}" var="rec"
									varStatus="status">
									<li class="mb-1 recTitle" onclick="recDetail(this);"> ${rec.requirement}
										<ul>	
											<li class="recNo" style="display : none">${rec.recruitNo}</li>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="col-md-12 mt-3">
						<div class="submit_btn text-center">
							<button class="boxed-btn3 mr-4" onclick="rec_add();">모집추가</button>
							<button class="boxed-btn3 mr-4" onclick="modify();">수정하기</button>
							<button class="boxed-btn3" onclick="del();">삭제하기</button>
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
		let projectNo = "${detail.projectNo}";
		let managerNo = "${detail.managerNo}";
		let customerNo = "${sessionScope.loginInfo}";
		
		//로드 시 customerNo와 projectNo 비교
		$(function(){
			if(managerNo != customerNo){
				location.href = "${contextPath}/index";
			}
		});

		//모집 등록
		function rec_add() {
			let answer = confirm("${detail.title}" + " 에 모집을 추가로 등록하시겠습니까?");
			if (answer == true) {
				location.href = "${contextPath}/add_rec?projectNo=" + projectNo;
			}
			return false;
		}
		
		//모집 상세보기
		function recDetail(e){
			let $recNo = $(e).find("li.recNo").html();
			alert($recNo);
			location.href = "${contextPath}/rec_detail?recNo=" + $recNo
		}
		
		//프로젝트 수정
		function modify(){
			let answer = confirm("${detail.title}" + " 정보를 수정하시겠습니까?");
			if (answer == true) {
				location.href = "${contextPath}/modify_project?projectNo=" + projectNo;
			}
			return false;
		}
		
		//프로젝트 삭제 - 모집 있는지 확인하고 있으면 삭제 못하게
		function del(){
			let answer = confirm("${detail.title}" + " 프로젝트를 삭제하시겠습니까?");	
			if(anwer == true){
				//ajax 요청
				//요청 시 모집 존재 여부 확인
			}
			return false;
		}
		
	</script>
</body>

</html>