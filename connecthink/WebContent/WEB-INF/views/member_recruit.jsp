<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "customer" value="${requestScope.customer}"/>
<c:set var = "project" value="${requestScope.project}"/>
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
		<jsp:include page="/header"></jsp:include>
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
									<a href="#"><h4>${customer.name}</h4></a>
									<div class="links_locat d-flex align-items-center">
										<div class="location">
<%-- 											<p>${customer.postion.name }</p> --%>
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
										<button class="smallbtn" onclick="openModal()">초대하기</button>
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
							<p>
							<c:out value="${customer.graduation eq 1 ? '졸업': '미졸업'}"/>								
							</p>
						</div>
						<div class="single_wrap">
							<h4>한줄소개</h4>
							<ul style="list-style: none;">
								<p>${customer.about }</p>								
							</ul>
						</div>
						<div class="single_wrap">
							<h4>경력</h4>
							<ul style="list-style: none;">
							<c:forEach items="${customer.experiences}" var = "experience" varStatus="status">
								<p>날짜 : ${experience.term }  | 설명 : ${experience.explain }</p>
								
							</c:forEach>
							</ul>
						</div>
						<div class="single_wrap">
							<h4>ConnecThink 히스토리</h4>
							<c:forEach items="${project}" var = "p" varStatus="status">
							<div>
								<p>프로젝트 날짜 : 
								<c:forEach items="${p.recruits}" var = "r" varStatus="status">
									<c:forEach items="${r.members}" var ="m" varStatus="status">
									<fmt:formatDate var="enterdate" value="${m.enterDate}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="quitdate" value="${m.quitDate}" pattern="yyyy-MM-dd"/>
										${enterdate} ~ ${quitdate } 
									</c:forEach>
								</c:forEach>
							</p>
								<p>프로젝트 이름: ${p.title }</p>
								<p>프로젝트 소개 : ${p.theme}</p>
							</div>	
							</c:forEach>
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
	<script>
		function openModal(){
			$.ajax({
				url: "${contextPath}/memberModal",
				success: function(data) {
					console.log(data);
				} 
			});
		}
	</script>
</body>

</html>