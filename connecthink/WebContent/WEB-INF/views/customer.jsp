<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "customer" value="${requestScope.customer}"/>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>모집 중인 회원</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/magnific-popup.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/themify-icons.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/nice-select.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/flaticon.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/gijgo.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/animate.min.css">
<link rel="stylesheet" href="${contextPath}/${contextPath}/css/slicknav.css">

<link rel="stylesheet" href="${contextPath}/${contextPath}/css/style.css">
<!-- <link rel="stylesheet" href="${contextPath}/css/responsive.css"> -->
<style>
.thumb {
 display: inline-block;
 width: 70px !important;
 height: 70px !important;"
}

span.customerNo{
 display: none;
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
						<h3>모집 중인 회원</h3>
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
					<div class="single_candidates" onclick="customerDetail(this);">
						<div class="thumb" style="display: inline-block;">
                            <img src="http://172.30.1.6/storage/customer/${customer.customerNo}.jpg" onerror="this.src='${contextPath}/img/d2.jpg'"alt="프로필사진">
						</div>
						<h4 style="display: inline-block;" class="ml-3 mt-2">${customer.name}</h4>
						<span class="customerNo">${customer.customerNo}</span>
						<ul class="customerInfo mt-4" style="list-style: none;">
							<c:forEach items="${customer.customerPositions}" var="position" varStatus="st1">
							<c:if test ="${st1.index lt 5}">
							<li class="position" style="font-weight: bold;">${position.position.name}</li>
							</c:if>
							</c:forEach>
							<li class="intro">${customer.about}</li>
						</ul>
					</div>
				</div>
				</c:forEach>
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
	<script src="${contextPath}/${contextPath}/js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/popper.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/bootstrap.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/owl.carousel.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/isotope.pkgd.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/ajax-form.js"></script>
	<script src="${contextPath}/${contextPath}/js/waypoints.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/jquery.counterup.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/imagesloaded.pkgd.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/scrollIt.js"></script>
	<script src="${contextPath}/${contextPath}/js/jquery.scrollUp.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/wow.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/nice-select.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/jquery.slicknav.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/plugins.js"></script>
	<script src="${contextPath}/${contextPath}/js/gijgo.min.js"></script>



	<!--contact js-->
	<script src="${contextPath}/${contextPath}/js/contact.js"></script>
	<script src="${contextPath}/${contextPath}/js/jquery.ajaxchimp.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/jquery.form.js"></script>
	<script src="${contextPath}/${contextPath}/js/jquery.validate.min.js"></script>
	<script src="${contextPath}/${contextPath}/js/mail-script.js"></script>


	<script src="${contextPath}/${contextPath}/js/main.js"></script>

	<script>
	$(function(){
		fetch("${contextPath}/all/customerList").then(function(data){
			console.log("fetch ajax 성공");
		});
	});
	
	//클릭 시 상세 페이지로 이동
	function customerDetail(e){
		let $customerNo = $(e).find("span.customerNo").html();
		let url = "${contextPath}/logined/customer_detail?customerNo=" + $customerNo ;
		location.href = url;
		
	}
	
	
	</script>

</body>

</html>