<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<head>
   
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Job Board</title>
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
    <link rel="stylesheet" href="${contextPath}/css/w3school.css">

    <link rel="stylesheet" href="${contextPath}/css/style.css">
    <!-- <link rel="stylesheet" href="${contextPath}/css/responsive.css"> -->
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

.rec_title{
 overflow: hidden;
 text-overflow: ellipsis;
 white-space: nowrap;
}
.featured_candidates_area.candidate_page_padding{
	padding: 50px 70px;
}

</style>
<body>
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

	<!-- header-start -->
	<header>
		<jsp:include page="/header"></jsp:include>
	</header>
	<!-- header-end -->

	<!-- slider_area_start -->
	<div class="slider_area">
		<div class="single_slider  d-flex align-items-center slider_bg_1">
			<div class="container">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="${contextPath}/img/banner/main2.jpg" alt="First slide">
       <div class="carousel-caption d-none d-md-block">
   	 <h5>caption</h5>
   
  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="${contextPath}/img/banner/main1.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="${contextPath}/img/banner/main1.png" alt="Third slide">
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


			</div>
		</div>
		<div
			class="ilstration_img wow fadeInRight d-none d-lg-block text-right"
			data-wow-duration="1s" data-wow-delay=".2s">
			<!-- 			<img src="${contextPath}/img/banner/illustration.png" alt=""> -->
		</div>
	</div>
	</div>
	<!-- slider_area_end -->

	<!-- popular_catagory_area_start  -->
	<div class="featured_candidates_area candidate_page_padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section_title mb-40">
						<h3>모집중인 팀</h3>
					</div>
				</div>
			</div>
			<div class="row">
				
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
											<img src="${contextPath}/img/testmonial/author.png" alt="">
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
											<img src="${contextPath}/img/kkugi.jpg" alt="">
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
											<img src="${contextPath}/img/testmonial/author.png" alt="">
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

	$(document).ready(function(){

	loadMemberList();
	loadProjectList();

	});

	function loadMemberList() {
		var $memberSection = $("div.main_member_area > .container > .row:nth-child(2)");
		$.ajax({
	    	url : "/connecthink/customerList",  
	    	method: "GET",
	    	data:  { ${_csrf.parameterName} : '${_csrf.token}'},   
			success: function(responseObj) {
				
				var txt = "";
				for (x in responseObj) {
					txt += "<div class='col-md-6 col-lg-3'><div class='single_catagory'>" +
							"<div class='thumb' style='float: right;'> " +
							"<img src='${contextPath}/img/candiateds/1.png' alt=''></div>"+
							"<a href='#' onclick='memberDetail("+responseObj[x].customerNo+")'><h4>"+responseObj[x].name+"</h4></a>" +
							" <input type='text' id='customerNo' value='"+responseObj[x].customerNo + "' hidden='hidden'>";							 
					
					for(p in responseObj[x].customerPositions) {
						txt += "<p style='font-weight: bold;'>"+ responseObj[x].customerPositions[p].position.name+"</p>"
					}	
					txt += "<p>" + responseObj[x].about + "</p>";
					txt += "</div></div>";
				} 
				
				$memberSection.html(txt);
			}
	    });
	}
	function loadProjectList() {
		var $teamSection =  $("div.featured_candidates_area > .container > .row:nth-child(2)");
		$.ajax({
	    	url : "/connecthink/projectList",  
	    	method: "GET",
	    	data:   {${_csrf.parameterName} : '${_csrf.token}'},    
			success: function(responseObj) {
				console.log(responseObj);
				var txt = "";
				for (x in responseObj) {
					var deadline = new Date(responseObj[x].deadline).toISOString().substring(0, 10);;

					txt += "<div class='col-md-6 col-lg-4'><div class='single_candidates text-center pl-0 pr-0 pt-0' onclick='projectDetail(this);'>" +
							"<div class='thumbnail'><div class='test'><img src='${contextPath}/img/default.png' alt='모집 사진'></div></div>" +
							"<h4 class='mt-4 mr-4 ml-4 rec_title'>" + responseObj[x].requirement + "</h4>" +
					"<ul style='list-style: none;'><li class='wanna'>" + responseObj[x].position.name + "</li>" +
						
						"<li class='peorid'>" + deadline + "</li>" +
						" <input type='text' id='recruitNo' value='"+responseObj[x].recruitNo + "' hidden='hidden'></ul></div></div>";
				} 
				
				$teamSection.html(txt);
				
			}
	    });
	}
	function memberDetail(customerNo) {
		let url = "${contextPath}/member_detail?customerNo=" + customerNo ;
		location.href = url;
	}
	function projectDetail(e) {
		let $recNo = $(e).find("#recruitNo").val();
		alert($recNo);
		let url = "${contextPath}/rec_detail?recNo=" + $recNo ;
		location.href = url;
	}
	</script>
</body>

</html>