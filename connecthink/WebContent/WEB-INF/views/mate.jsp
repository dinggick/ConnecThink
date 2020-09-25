<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "customer" value="${requestScope.customer}"/>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>메이트 찾기</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<style>
.thumb {
 display: inline-block;
 width: 70px !important;
 height: 70px !important;"
}

span.customerNo{
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
						<h3>메이트 찾기</h3>
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
				<!-- 박스 -->
				<c:forEach items="${customer}" var="customer" varStatus="status">
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates" onclick="mateDetail(this);">
						<div class="thumb" style="display: inline-block;">
							<img src="${contextPath}/img/candiateds/1.png" alt="">
						</div>
						<h4 style="display: inline-block;" class="ml-3 mt-2">${customer.name}</h4>
						<span class="customerNo">${customer.customerNo}</span>
						<ul class="mateInfo mt-4" style="list-style: none;">
							<c:forEach items="${customer.customerPositions}" var="position" varStatus="st1">
							<li class="position" style="font-weight: bold;">${position.position.name}</li>
							</c:forEach>
							<li class="intro">${customer.about}</li>
						</ul>
					</div>
				</div>
				</c:forEach>
				<!-- 박스 끝 -->
				
				

			</div>
			<div class="row">
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
	$(function(){
		fetch("${contextPath}/all/mateList").then(function(data){
			console.log("fetch ajax 성공");
		});
	});
	
	//클릭 시 상세 페이지로 이동(미완)
	function mateDetail(e){
		let $customerNo = $(e).find("span.customerNo").html();
		alert($customerNo);
// 		let url = "${contextPath}/rec_detail?recNo=" + $customerNo ;
// 		location.href = url;
	}
	
	
	</script>

</body>

</html>