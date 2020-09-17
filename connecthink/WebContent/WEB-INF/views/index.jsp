<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


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
    <link rel="stylesheet" href="css/w3school.css">

    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>
<style>

@media (min-width:1200px) {
    .container {
        max-width: 100%!important;
    }
}

.container {
    width: 100%;
    padding-left: 0px!important;
    padding-right:0px!important;
    margin-right: 0px!important;
    margin-left: 0px!important;
}
.w-100 {
    height: 700px;
    width: 1400px !important;
}
</style>
<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	</header>
	<!-- header-end -->

	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="single_slider  d-flex align-items-center slider_bg_1">
			<div class="container">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="img/banner/main2.jpg" alt="First slide">
       <div class="carousel-caption d-none d-md-block">
    <h5>caption</h5>
    <p>...</p>
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/banner/main1.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="img/banner/main1.png" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
				<div class="row align-items-center">

<!-- 					<div class="col-lg-7 col-md-6"> -->
<!-- 						<div class="slider_text"> -->
<!-- 							<h5 class="wow fadeInLeft" data-wow-duration="1s" -->
<!-- 								data-wow-delay=".2s">등록된 멤버 3000명!</h5> -->
<!-- 							<h3 class="wow fadeInLeft" data-wow-duration="1s" -->
<!-- 								data-wow-delay=".3s">Find your Dream Job</h3> -->
<!-- 							<p class="wow fadeInLeft" data-wow-duration="1s" -->
<!-- 								data-wow-delay=".4s">We provide online instant cash loans -->
<!-- 								with quick approval that suit your term length</p> -->
<!-- 							<div class="sldier_btn wow fadeInLeft" data-wow-duration="1s" -->
<!-- 								data-wow-delay=".5s"> -->
<!-- 								<a href="#" class="boxed-btn3">Upload your Resume</a> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					<div id="carouselExampleControls" class="carousel slide" data-ride="carousel"> -->
<!--   		</div> -->

<!-- 				</div> -->
			</div>
		</div>
		<div
			class="ilstration_img wow fadeInRight d-none d-lg-block text-right"
			data-wow-duration="1s" data-wow-delay=".2s">
			<!-- 			<img src="img/banner/illustration.png" alt=""> -->
		</div>
	</div>
	</div>
	<!-- slider_area_end -->

	<!-- popular_catagory_area_start  -->
	<div class="popular_catagory_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_title mb-40">
						<h3>모집중인 팀</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 1</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 2</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 3</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 4</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 5</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 6</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 7</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>TEAM 8</h4></a>
						<p>Available position</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- popular_catagory_area_end  -->

	<div class="main_member_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_title mb-40">
						<h3>모집중인 멤버</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="member_recruit"><h4>MEMBER 1</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>MEMBER 2</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>MEMBER 3</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>MEMBER 4</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>MEMBER 5</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>MEMBER 6</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>MEMBER 7</h4></a>
						<p>Available position</p>
					</div>
				</div>
				<div class="col-lg-4 col-xl-3 col-md-6">
					<div class="single_catagory">
						<a href="jobs.html"><h4>MEMBER 8</h4></a>
						<p>Available position</p>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- job_searcing_wrap end  -->

	<!-- testimonial_area  -->
	<div class="testimonial_area  ">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_title text-center mb-40">
						<h3>프로젝트 성공후기</h3>
					</div>
				</div>
				<div class="col-xl-12">
					<div class="testmonial_active owl-carousel">
						<div class="single_carousel">
							<div class="row">
								<div class="col-lg-11">
									<div class="single_testmonial d-flex align-items-center">
										<div class="thumb">
											<img src="img/testmonial/author.png" alt="">
											<div class="quote_icon">
												<i class="Flaticon flaticon-quote"></i>
											</div>
										</div>
										<div class="info">
											<p>"컨넥띵크를 통해 팀원들을 찾아서 공모전에 우승했써욤~~~"</p>
											<span>-이혜림</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="single_carousel">
							<div class="row">
								<div class="col-lg-11">
									<div class="single_testmonial d-flex align-items-center">
										<div class="thumb">
											<img src="img/testmonial/author.png" alt="">
											<div class="quote_icon">
												<i class=" Flaticon flaticon-quote"></i>
											</div>
										</div>
										<div class="info">
											<p>"저두염"</p>
											<span>-꾸기</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="single_carousel">
							<div class="row">
								<div class="col-lg-11">
									<div class="single_testmonial d-flex align-items-center">
										<div class="thumb">
											<img src="img/testmonial/author.png" alt="">
											<div class="quote_icon">
												<i class="Flaticon flaticon-quote"></i>
											</div>
										</div>
										<div class="info">
											<p>"컨넥띵크 짱"</p>
											<span>- 지츄</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /testimonial_area  -->


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