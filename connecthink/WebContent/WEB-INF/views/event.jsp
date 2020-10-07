<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "rec" value="${requestScope.rec}"/>
<c:set var = "img" value="${requestScope.img}"/>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>공모전 목록</title>
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
.rec_title{
 overflow: hidden;
 text-overflow: ellipsis;
 white-space: nowrap;
}

.test img {
 width: 350px !important;
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
						<h3>교육 · 행사</h3>
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
	
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://dcamp.kr/event/20772' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/r8jr8448yj49848912333123_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">2020-11월 디데이 X FRONT1 AVENGERS Part 2</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">세미나 / 서울특별시</li>
							<li class="peorid">2020.11.26 / 2020.11.26</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://dcamp.kr/event/20758' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/erh498e4h894er94g894213123_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">D.CLASS : What To Do Before Going Global</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">교육·강연 / 서울특별시</li>
							<li class="peorid">2020.11.12 / 2020.11.19</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://onoffmix.com/event/225026' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/rrtj489r8j92123_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">[KISA 핀테크 기술지원센터] 트렌드 세미나 :: 핀테크로 시작하는 전자상거래 혁신</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">교육·강연 / 전국</li>
							<li class="peorid">2020.10.08 / 2020.10.08</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://onoffmix.com/event/224714' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/e89r4h894erh98213123_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">[컨퍼런스] OWASP SEOUL CONFERENCE 2020</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">세미나 / 전국</li>
							<li class="peorid">2020.10.08 / 2020.10.08</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://www.inckl.or.kr/intro/cklProgramInfo.do?seq=389' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/202009281508680_2_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">2020 콘텐츠 상생 디딤돌</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">교육·강연 / 서울특별시</li>
							<li class="peorid">2020.10.20 / 2020.10.20</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://onoffmix.com/event/22951' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/8r4rtj89t89j49849821313_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">로컬X소셜 임팩트 게더링</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">세미나 / 전국</li>
							<li class="peorid">2020.10.07 / 2020.10.07</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://onoffmix.com/event/22951' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/8j494y849842389424_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">CEO SALON Season1 w. 김영덕 롯데액셀러레이터 상무</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">교육·강연 / 서울특별시</li>
							<li class="peorid">2020.10.14 / 2020.12.09</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://event-us.kr/classroomxkorea/event/23647' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/e84h89er484291321_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">[ClassroomX] Early stage 스타트업 투자를 위한 Due Diligence 프로세스</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">교육·강연 / 전국</li>
							<li class="peorid">2020.10.21 / 2020.10.21</li>
						</ul>
					</div>
				</div>
				
				<div class="col-md-6 col-lg-4">
					<div class="single_candidates text-center pl-0 pr-0 pt-0" onclick="location.href = 'https://docs.google.com/forms/d/e/1FAIpQLSfeXxCdrOwt-blNaWZaeRoREinapRhIJwpOdSyeE-N2X7o3hw/viewform' ">
						<div class="thumbnail">
							<div class="test">
								<img src="https://beginmate.com/Upload/EventPoster/wer4rg49842193123_Thumb.png" alt="행사 사진">
							</div>
						</div>
						<h4 class="mt-4 mr-4 ml-4 rec_title">애니멀 헬스 해커톤(KU ANIMAL HEALTH HACKATHON) 접수 안내</h4>
						<ul style="list-style: none;" class="short">
							<li class="wanna">기타 / 전국</li>
							<li class="peorid">2020.09.14 / 2020.10.12</li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>

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
	
	
	</script>
	
</body>

</html>