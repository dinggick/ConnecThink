<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>팀등록</title>
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
</head>

<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	</header>
	<!-- header-end -->

	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_1">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>팀등록</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->

	<div class="job_details_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="apply_job_form white-bg mt-0">
						<h4>팀등록하기</h4>
						<form action="#">
							<div class="row">
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">팀 이름</h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" placeholder="팀 이름 (20자 내)">
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">팀 소개</h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" placeholder="팀에 대해 한 줄로 적어주세요(50자 내)">
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">팀 주제</h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" placeholder="팀 주제를 적어주세요 (ex. 공모전 참가 / 서비스 출시 / 포트폴리오 목적)">
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">팀 목적</h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<textarea name="#" id="" cols="30" rows="10" placeholder="팀의 목적에 대해 자유롭게 기재 해주세요"></textarea>
									</div>
								</div>
								<div class="col-md-12">
									<div class="submit_btn text-center">
										<button class="boxed-btn3 mr-1" >취소하기</button>
										<button class="boxed-btn3" type="submit">등록하기</button>
									</div>
								</div>
							</div>
						</form>
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
</body>

</html>