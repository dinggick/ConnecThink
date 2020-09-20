<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<head>

<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Job Board</title>
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
						<h3></h3>
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
					<div class="job_details_header">
						<div class="single_jobs white-bg d-flex justify-content-between">
							<div class="jobs_left d-flex align-items-center">

								<div class="jobs_conetent">
									<a href="#"><h4>이혜림</h4></a>
									<div class="links_locat d-flex align-items-center">
										<div class="location">
											<p>백엔드 개발자</p>
											<div class="bookmark">
												<span> <img src="img/bookmark2.png" alt=""
													style="width: 18px; height: 18px;">북마크
												</span> &nbsp; <span><img src="img/mail2.png" alt=""
													style="width: 18px; height: 18px;"> 메시지 </span>
											</div>
										</div>


										<!--                                         <div class="location"> -->
										<!--                                             <p> <i class="fa fa-clock-o"></i> Part-time</p> -->
										<!--                                         </div> -->
									</div>
								</div>
							</div>
							<div class="thumb">
								<div class="profilepic" style="padding-left: 90px">
									<img src="img/dogpic.png" alt=""
										style="width: 50px; height: 50px; border-radius: 50%;">
									<div>
										<button class="smallbtn">초대하기</button>
									</div>
								</div>

							</div>
							<!--                             <div class="jobs_right"> -->
							<!--                                 <div class="apply_now"> -->
							<!--                                     <a class="heart_mark" href="#"> <i class="ti-heart"></i> </a> -->
							<!--                                 </div> -->
							<!--                             </div> -->
						</div>
					</div>
					<div class="descript_wrap white-bg">
						<div class="single_wrap">
							<h4>학력</h4>
							<p>서울대학교 졸업</p>
						</div>
						<div class="single_wrap">
							<h4>한줄소개</h4>
							<ul>
								<li>소개1</li>
								<li>소개2</li>
							</ul>
						</div>
						<div class="single_wrap">
							<h4>경력</h4>
							<ul>
								<li>공모전: 이런공모전 했음 12.01.2011</li>
								<li>포트폴리오: 이런포트폴리오 있음</li>
							</ul>
						</div>
						<div class="single_wrap">
							<h4>ConnecThink 히스토리</h4>
							<p>히스토리 여기</p>
						</div>
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