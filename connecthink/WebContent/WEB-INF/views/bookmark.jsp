<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>북마크</title>
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
<!-- <link rel="stylesheet" href="${contextPath}/css/responsive.css"> -->

<style>


.rec_title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.customer, .project, .userName {
	display: inline-block !important;
	vertical-align: top;
}


.thumb {
	display: inline-block;
	width: 70px !important;
	height: 70px !important;
}

.thumb img {
	width: 70px !important;
	height: 70px !important;
}

.single_candidates {
	height: 300px !important;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
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
						<h3>북마크</h3>
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
					<button class="genric-btn default radius customer_tab" style="background: #fff" onclick="ctab();">회원</button>
					<button class="genric-btn default radius project_tab"onclick="ptab();">모집</button>
				</div>
				<!-- 메이트 -->
				<div class="list col-md-12 col-lg-12">
					<!-- 				<div class="col-md-6 col-lg-4 mt-1 mate"> -->
					<!-- 					<div class="single_candidates"> -->
					<!-- 						<div class="thumb"> -->
					<!-- 							<img src="${contextPath}/img/candiateds/1.png" alt=""> -->
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
				<!-- 									<img src="${contextPath}/img/default.png" alt="모집 사진"> -->
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
	<!-- featured_candidates_area_end  -->




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

	<script>
		$(function() {
			ctab();
		});

		function ctab() {
			let $section = $('div.list');

			$.ajax({
						url : "${contextPath}/logined/customerBm",
						method : "POST",
						data : {${_csrf.parameterName} : '${_csrf.token}'},
						success : function(customers) {
							let data = "";
							//forEach
							let size = customers.length;
							if (size > 0) {
								customers.forEach(function(customer, idx) {
									data += '<div class="col-md-6 col-lg-4 customer pl-0 mt-1">';
									data += '<div class="single_candidates" onclick="customerDetail(this);">';
									data += '<div class="thumb">';
									data += '<img src="http://172.30.1.37/storage/customer/'+customer.receive.customerNo+'.jpg"';
									data += 'onerror="this.src='+"'${contextPath}/img/d2.jpg'"+'"'+' alt="">';
									data += '</div>'
									data += '<div class = "username offset-md-3"><h4 class="ml-5">';
									data += customer.receive.name;
									data += '</h4></div>'
									data += '<ul class="customerInfo mt-4" style="list-style: none;">';

									let positions = customer.receive.customerPositions;
									positions.forEach(function(position,index) {
										if(index < 5){
											data += '<li class="position" style="font-weight: bold;">';
											data += position.position.name;
											data += '</li>'
										}
									});
										if(customer.receive.about == null){
											data += '<li class="intro" style="display:none;">';
											data += customer.receive.about;
											data += '</li>'
										} else {
											data += '<li class="intro">';
											data += customer.receive.about;
											data += '</li>'
										}
										data += '<li class="customerNo" style="display:none;">';
										data += customer.receive.customerNo;
										data += '</li>';
										data += '</ul>';
										data += '</div></div>';
								});
							} else {
								data += '<div class="col-md-12 col-lg-12 pl-0 pt-5 pb-5 mt-1 bg-white text-center">';
								data += '북마크 한 회원이 없습니다';
								data += '</div>';

							}
							$section.html(data);
						}
					});
			$(".customer_tab").css("background", "#fff");
			$(".project_tab").css("background", "#f9f9ff");
		}

		function ptab() {
			let $section = $('div.list');

			$.ajax({
						url : "${contextPath}/logined/recBm",
						method : "POST",
						data : {${_csrf.parameterName} : '${_csrf.token}'},
						success : function(projects) {
							let data = "";
							let size = projects.length;
							if (size > 0) {
								projects
										.forEach(function(project, index) {
											let dl = new Date(
													project.recruit.deadline)
											data += '<div class="col-md-6 col-lg-4 mt-1 pl-0 project">';
											data += '<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="recDetail(this);">';
											data += '<div class="thumbnail">';
											data += '<div class="test">';
											data += '<img src="http://172.30.1.37//storage/recruit/img/'+project.recruit.recruitNo+'.jpg"';
											data += 'onerror="this.src='+"'${contextPath}/img/default.png'"+'"'+' alt="">';
											data += '</div></div>';
											data += '<h4 class="mt-4 mr-4 ml-4 rec_title">';
											data += project.recruit.requirement;
											data += '</h4>'
											data += '<ul style="list-style: none;">';
											data += '<li class="wanna">';
											data += project.recruit.position.name;
											data += '</li>'
											data += '<li class="peorid">';
											data += dl.getFullYear() + "."
													+ (dl.getMonth() + 1) + "."
													+ dl.getDate();
											data += '</li>'
											data += '<li class="recNo" style="display: none;">';
											data += project.recruit.recruitNo;
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

			$(".customer_tab").css("background", "#f9f9ff");
			$(".project_tab").css("background", "#fff");
		}
		
		//클릭 시 모집 상세 페이지로 이동
		function recDetail(e){
			let $recNo = $(e).find("li.recNo").html();
			let url = "${contextPath}/all/rec_detail?recNo=" + $recNo ;
			location.href = url;
		}
		
		//클릭 시 회원 상세 페이지로 이동(미완)
		function customerDetail(e){
			let $customerNo = $(e).find("li.customerNo").html();			
			let url = "${contextPath}/logined/customer_detail?customerNo=" + $customerNo ;
			location.href = url;
			
		}
		
		
		
	</script>
</body>

</html>