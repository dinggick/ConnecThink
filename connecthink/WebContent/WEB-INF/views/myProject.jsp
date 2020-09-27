<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>내가 등록한 팀</title>
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

.rec_title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.manage_team_area {
	background: #F5F7FA;
	padding-top: 100px;
	padding-bottom: 100px;
}

.manage_team_table_warp {
	margin-bottom: 30px;
	padding-top: 10px;
	padding-left: 30px;
	padding-right: 30px;
	border-radius: 5px 5px;
	overflow-x: auto;
}

.table-head>div {
	color: #415094;
	line-height: 40px;
	font-weight: 500;
}
.table-row>div {
	font-size: 1em;
}
.title {
	width: 40%;
}

.theme {
	width: 30%;
}
.date {
	width: 30%;
}
.status {
	width: 10%;
}

.table-row>.title:hover, .table-row>.name:hover {
	color: #00D363;
	transition: 0.3s;
	cursor: pointer;
}
.table-head>:first-child, .table-row>:nth-child(2) {
	padding-left:10px;
}
.table-row>:last-child {
	overflow: visible;
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
						<h3>내가 등록한 팀</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->



	<!--목록 시작 -->
	<div class="manage_team_area">
        <div class="container">
            <div class="row">
                <div class="col-12 manageMenu mb-1">
                    <button class="genric-btn default radius myProject">내가 등록한 팀</button>
                    </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="manage_team_table_warp bg-white">
					<div class="progress-table bg-white">
						<div class="table-head bg-white">
							<div class="title">프로젝트 명</div>
							<div class="theme">주제</div>
							<div class="date">등록날짜</div>
							<div class="status">상태</div>
						</div>
						<div class="tr-section">
							<div class="table-row bg-white">
								<div style='width:100%; height:100px; line-height:100px; text-align:center;'>응답중입니다.</div>
							</div>
						</div>
                    </div>
                    </div>
                </div>
            </div>
            </div>
    </div>

	<div class="row mb-3">
		<div class="col-lg-12">
			<div class="pagination_wrap">
				<ul>
					<li><a href="#"> <i class="ti-angle-left"></i>
					</a></li>
					<li><a href="#"><span>01</span></a></li>
					<li><a href="#"><span>02</span></a></li>
					<li><a href="#"> <i class="ti-angle-right"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- featured_candidates_area_end  -->




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

	<script>
		$(function() {
			myTeam()
		});

		function myTeam() {
			let $section = $('.tr-section');

			$.ajax({
						url : "${contextPath}/myTeam",
						method : "POST",
						data : {${_csrf.parameterName} : '${_csrf.token}'},
						success : function(teams) {
							let data = "";
							//forEach
							let size = teams.length;
							if (size > 0) {
								teams.forEach(function(team, index) {
									data += '<div class="table-row bg-white">';
									data += '<div class="projectNo" style="display:none;">'+ team.projectNo +'</div>';
									data += '<div class="title" onclick="projectDetail(this);">' + team.title + '</div>';
									data += '<div class="theme">'+ team.theme +'</div>';
									let date = new Date(team.createDate);
									data += '<div class="date">'+ date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate() +'</div>';
									if(team.projectStatus == 1){
										data += '<div class="status"> 진행중 </div></div>';
									} else {
										data += '<div class="status"> 종료 </div></div>';
									}
								});
							} else {
								data += "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>등록한 팀이 없습니다.</div>";
							}
							$section.html(data);
						}
					});
			$(".myProject").css("background", "#fff");
		}
		
		//클릭 시 팀 상세 페이지로 이동
		function projectDetail(e){
			let $projectNo = $(e).siblings("div.projectNo").html();
			let url = "${contextPath}/project_detail?projectNo=" + $projectNo ;
			alert(url);
			location.href = url;
		}
		
		
		
	</script>
</body>

</html>