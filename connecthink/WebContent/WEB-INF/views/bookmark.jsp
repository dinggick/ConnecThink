<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>관심목록</title>
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

.mate, .team, .userName {
	display: inline-block !important;
	vertical-align: top;
}


.thumb {
	display: inline-block;
	width: 70px !important;
	height: 70px !important;
}

.thumb .test {
	position: relative;
	padding-top: 100%;
 	overflow: hidden;
}

.test .centered {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}

.centered img {
	position: absolute !important;
	top: 0 !important;
	left: 0 !important;
	width: 100% !important;
	height: 100% !important;;
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
						<h3>관심목록</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->



	<!--목록 시작 -->
	<div class="featured_candidates_area candidate_page_padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-lg-12 bookMenu">
					<button class="genric-btn default radius mate_tab"
						style="background: #fff" onclick="mtab();">메이트</button>
					<button class="genric-btn default radius team_tab"
						onclick="ttab();">모집</button>
				</div>
				<!-- 메이트 -->
				<div class="list col-md-12 col-lg-12">
					<!-- 				<div class="col-md-6 col-lg-4 mt-1 mate"> -->
					<!-- 					<div class="single_candidates"> -->
					<!-- 						<div class="thumb"> -->
					<!-- 							<img src="img/candiateds/1.png" alt=""> -->
					<!-- 						</div> -->
					<%-- 						<h4 style="display: inline-block;" class="ml-3 mt-2 mateName">${mate.receive.name}</h4> --%>
					<!-- 						<ul class="mateInfo mt-4" style="list-style: none;"> -->
					<%-- 							<li class="position" style="font-weight: bold;">${position.position.name}</li> --%>
					<%-- 							<li class="intro">${mate.receive.about}</li> --%>
					<!-- 							<li class="customerNo" style="display: none"></li> -->
					<!-- 						</ul> -->
					<!-- 					</div> -->
					<!-- 				</div> -->
				</div>
				<!-- 메이트 끝 -->
				<!-- 팀 -->
				<!-- 					<div class="col-md-6 col-lg-4 mt-1 team" style="display: none;"> -->
				<!-- 						<div class="single_candidates text-center pl-0 pr-0 pt-0"> -->
				<!-- 							<div class="thumbnail"> -->
				<!-- 								<div class="test"> -->
				<!-- 									<img src="img/default.png" alt="모집 사진"> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<%-- 							<h4 class="mt-4 mr-4 ml-4 rec_title">${rec.recruit.requirement}</h4> --%>
				<!-- 							<ul style="list-style: none;"> -->
				<%-- 								<li class="wanna">${rec.recruit.position.name}</li> --%>
				<%-- 								<li class="peorid">${dl}</li> --%>
				<%-- 								<li class="recNo" style="display: none;">${rec.recruit.recruitNo}</li> --%>
				<!-- 							</ul> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 팀끝 -->
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
			mtab()
		});

		function mtab() {
			let $section = $('div.list');

			$
					.ajax({
						url : "${contextPath}/mateBm",
						method : "POST",
						data : {customerNo : ${sessionScope.loginInfo},
				        ${_csrf.parameterName} : '${_csrf.token}'},
						success : function(mates) {
							let data = "";
							//forEach
							let size = mates.length;
							if (size > 0) {
								mates
										.forEach(function(mate, index) {
											data += '<div class="col-md-6 col-lg-4 mate pl-0 mt-1">';
											data += '<div class="single_candidates" onclick="mateDetail(this);">';
											data += '<div class="thumb">';
											data += '<div class="test">';
											data += '<div class="centered">';
											data += '<img src="img/profil-d.jpg" alt=""></div></div></div>';
											data += '<div class = "username offset-md-3"><h4 class="ml-5">';
											data += mate.receive.name;
											data += '</h4></div>'
											data += '<ul class="mateInfo mt-4" style="list-style: none;">';

											let positions = mate.receive.customerPositions;
											positions
													.forEach(function(position,
															index) {
														data += '<li class="position" style="font-weight: bold;">';
														data += position.position.name;
														data += '</li>'
													});
											data += '<li class="intro">';
											data += mate.receive.about;
											data += '</li>'
											data += '<li class="customerNo" style="display:none;">';
											data += mate.receive.customerNo;
											data += '</li>';
											data += '</ul>';
											data += '</div></div>';
										});
							} else {
								data += '<div class="col-md-12 col-lg-12 pl-0 pt-5 pb-5 mt-1 bg-white text-center">';
								data += '북마크 한 메이트가 없습니다';
								data += '</div>';

							}
							$section.html(data);
						}
					});
			$(".mate_tab").css("background", "#fff");
			$(".team_tab").css("background", "#f9f9ff");
		}

		function ttab() {
			let $section = $('div.list');

			$.ajax({
						url : "${contextPath}/recBm",
						method : "POST",
						data : {customerNo : ${sessionScope.loginInfo},
					        ${_csrf.parameterName} : '${_csrf.token}'},
						success : function(teams) {
							let data = "";
							let size = teams.length;
							if (size > 0) {
								teams
										.forEach(function(team, index) {
											let dl = new Date(
													team.recruit.deadline)
											data += '<div class="col-md-6 col-lg-4 mt-1 pl-0 team">';
											data += '<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="recDetail(this);">';
											data += '<div class="thumbnail">';
											data += '<div class="test">';
											data += '<img src="img/default.png" alt="모집 사진"></div></div>';
											data += '<h4 class="mt-4 mr-4 ml-4 rec_title">';
											data += team.recruit.requirement;
											data += '</h4>'
											data += '<ul style="list-style: none;">';
											data += '<li class="wanna">';
											data += team.recruit.position.name;
											data += '</li>'
											data += '<li class="peorid">';
											data += dl.getFullYear() + "."
													+ (dl.getMonth() + 1) + "."
													+ dl.getDate();
											data += '</li>'
											data += '<li class="recNo" style="display: none;">';
											data += team.recruit.recruitNo;
											data += '</li>';
											data += '</ul>';
											data += '</div></div>';
										});
							} else {
								data += '<div class="col-md-12 col-lg-12 pl-0 pt-5 pb-5 mt-1 bg-white text-center">';
								data += '북마크 한 모집이 없습니다';
								data += '</div>';
							}
							$section.html(data);
						}
					});

			$(".mate_tab").css("background", "#f9f9ff");
			$(".team_tab").css("background", "#fff");
		}
		
		//클릭 시 모집 상세 페이지로 이동
		function recDetail(e){
			let $recNo = $(e).find("li.recNo").html();
			alert($recNo);
			let url = "${contextPath}/rec_detail?recNo=" + $recNo ;
			alert(url);
			location.href = url;
		}
		
		//클릭 시 회원 상세 페이지로 이동(미완)
		function mateDetail(e){
			let $customerNo = $(e).find("li.customerNo").html();
			alert($customerNo);
//	 		let url = "${contextPath}/rec_detail?recNo=" + $customerNo ;
//	 		location.href = url;
		}
		
		
		
	</script>
</body>

</html>