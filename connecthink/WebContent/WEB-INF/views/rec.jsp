<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "rec" value="${requestScope.rec}"/>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>모집목록</title>
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
.rec_title{
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
						<h3>모집</h3>
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
				<!-- 객체 -->
				<c:forEach items="${rec}" var="rec" varStatus = "status">
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="recDetail(this);">
						<div class="thumbnail">
							<div class="test">
<%-- 							<c:choose> --%>
<%-- 							<c:when test="${not empty C:\\storage\\rec.recruitNo.jpg}"> --%>
								<img src="http://localhost/storage/recruit/img/2R8.jpg" alt="모집사진">
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<!-- 								<img src="img/default.png" alt="모집 사진"> -->
<%-- 							</c:otherwise> --%>
<%-- 							</c:choose> --%>
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">${rec.requirement}</h4>
						<ul style="list-style: none;">
							<li class="wanna">${rec.position.name}</li>
							<fmt:formatDate var="dl" value="${rec.deadline}" pattern="yyyy-MM-dd"/>
							<li class="peorid">${dl}</li>
							<li class="recNo" style="display: none;">${rec.recruitNo}</li>
						</ul>
					</div>
				</div>
				</c:forEach>
			</div>
			<!-- 페이징 -->
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
	$(function(){
		fetch("${contextPath}/rec").then(function(data){
			console.log("fetch ajax 성공");
		});
	});
	
	function recDetail(e){
		let $recNo = $(e).find("li.recNo").html();
		let url = "${contextPath}/rec_detail?recNo=" + $recNo ;
		location.href = url;
	}
	
	</script>
	
</body>

</html>