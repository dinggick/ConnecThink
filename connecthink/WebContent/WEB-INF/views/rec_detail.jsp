<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>모집상세</title>
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
.thumb {
 width: 50px !important;
 height: 50px !important;
 display: inline-block;
}

.thumb img {
 width: 100%;
 -webkit-border-radius: 50%; 
 -moz-border-radius: 50%;
 border-radius: 50%;
}

img.bm {
 width: 5%;
 overflow: hidden;
 transition: 0.5s;
 display: inline-block;
}

img.on {
 width: 5%;
 overflow:hidden;
 transition: 0.5s;
 display: none;
}

.boxed-btn {
 width: 140px !important;
}

.rec_no {
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
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	</header>

	<!-- header-end -->

	<!-- bradcam_area  -->
	<div class="bradcam_area bradcam_bg_1">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<div class="bradcam_text">
						<h3>모집상세</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->
	<!-- 모집상세 내용 -->
	<div class="job_details_area">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1">
					<div class="job_details_header ">
						<div class="single_jobs white-bg d-flex justify-content-between">
							<div class="jobs_left">
								<div class="jobs_conetent mt-1 text-center">
									<h2>팀이름</h2>
								</div>
							</div>
							<div class="jobs_right text-right pt-2">
								<div class="apply_now">
									<img src="img/bookmark.png" class="bm mr-2" onclick="bookmark();">
									<img src="img/bookmark2.png" class="on mr-2" onclick="delmark();">
									<span class="rec_no">1</span>
								</div>
								<span class="bm_count">count</span>
							</div>
						</div>
					</div>
					<!-- 제목 밑 -->
					<div class="descript_wrap white-bg"
						style="border-bottom: 1px solid #EAEAEA;">
						<div class="single_wrap team_info">
							<h4>팀소개</h4>
							<p>팀설명 (파일에서 읽어올 부분)</p>
							<div class="team_member mt-2">
								<!-- 팀원 프로필 -->
								<div class="single_candidates">
									<div class="thumb text-center mr-2">
										<img src="img/candiateds/1.png" alt=""> <span>이름</span>
									</div>
								</div>
								<!-- 프로필 끝 -->
							</div>
						</div>
						<div class="single_wrap project_info">
							<h4>프로젝트 소개</h4>
							<ul>
								<li>모집직무 :</li>
								<li>모집인원 :</li>
								<li>요구사항 :</li>
								<li>요구사항내용</li>
							</ul>
						</div>
					</div>
					<!-- 컨텐츠 끝 -->
					<div class="single_jobs white-bg d-flex justify-content-between">
						<div class="rec_foot_left">
							<!-- 팀원 프로필 -->
							<div class="thumb text-center mr-2">
								<img src="img/candiateds/1.png" alt=""> <span>이름</span>
							</div>
						</div>
						<div class="rec_foot_right">						
							<button class="boxed-btn mt-2 message">메세지</button>
							<button class="boxed-btn mt-2 rec" >지원하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 본문 끝 -->
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
	
	<!-- script -->
	<script>
	
	function bookmark(){
		$("img.bm").css("display","none");
		$("img.on").css("display", "inline-block");
		let no = $("span.rec_no").text();
		console.log(no);
	}
	
	function delmark(){
		$("img.bm").css("display","inline-block");
		$("img.on").css("display", "none");
		let no = $("span.rec_no").text();
		console.log(no);
	}
	
	</script>
</body>

</html>