<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "customer" value="${requestScope.customer}"/>
<c:set var = "project" value="${requestScope.project}"/>
<c:set var="isManager" value="${requestScope.isManager }"/>
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

<link rel="stylesheet" href="${contextPath}/css/style.css">
<!-- <link rel="stylesheet" href="${contextPath}/css/responsive.css"> -->
<style>
.position, .position11{
	height: 30px !important;
	border: 1px solid #E8E8E8 !important;
	width: 100% !important;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	margin-bottom: 20px;
	font-size: 15px !important;
/* 	padding-top: 10px !important; */
}
	
.position11 .option {
		padding-right: 11.5em !important;
		font-size: 15px !important;
	}
.instruction{
	font-size: 13px !important;
	margin-left: 15px;
}
		
</style>
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
												<span onclick="addBookmark()"> <img src="${contextPath}/img/bookmark2.png" alt="" class="bm"
													style="width: 18px; height: 18px;">북마크
												</span> &nbsp; <span><img src="${contextPath}/img/mail2.png" alt=""
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
									<img src="${contextPath}/img/dogpic.png" alt=""
										style="width: 50px; height: 50px; border-radius: 50%;">
									<div>
										<button class="smallbtn" onclick="openModal()" data-toggle="modal" data-target="#myModal" id="inviteButton">초대하기</button>
										<button class="cancelbtn" id ="uninviteButton" onclick="uninviteMember()" >초대취소</button>
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
							<c:forEach items="${project}" var = "p" varStatus="status" >
							<div>
								<p>프로젝트 날짜 : 								
									<fmt:formatDate var="enterdate" value="${p.startDate}" pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="quitdate" value="${p.endDate}" pattern="yyyy-MM-dd"/>
										${enterdate} ~ ${quitdate}  |  프로젝트 이름: ${p.title }

							</p>
								
								<p>프로젝트 소개 : ${p.theme}</p>
							</div>	
							<br>
							</c:forEach>
						</div>
					</div>



				</div>
			</div>
		</div>	
	</div>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				 <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLongTitle">프로젝트 선택</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		            </button>					
				</div>
				<div class="modal-body">
				<p class="instruction">멤버를 초대할 프로젝트를 선택해주세요.</p>
					<div class="col-md-9">					
										
						<div class="input_field position1">
						
						</div>					
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id ="inviteButton" onclick="inviteMember()">초대하기</button>
				
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
	$(document).ready(function(){
		 $(".cancelbtn").hide();		
		if ('${isManager}' == 'n') {			
			$(".smallbtn").hide();
		}
	   
	});
		function openModal(){
			var $selectSection = $('.input_field.position1');
			
			$.ajax({
				url: "${contextPath}/memberModal",
				data:  { 
// 					managerNo: ${sessionScope.loginInfo},
					${_csrf.parameterName} : '${_csrf.token}'
					},   
				method: "GET",
				success: function(data) {
					console.log(data);
					var txt = "<select class='position11' form='inviteForm' id='project_no'><option value=''  selected>프로젝트</option>";
					
					for (i in data) {	
						for(x in data[i].recruits) {
					txt += "<option value='"+data[i].recruits[x].recruitNo+"'>"+data[i].recruits[x].requirement+"</option>";
					
					console.log(txt);
						}
					}
					txt += "</select>";
					$selectSection.html(txt);
				} 
			});
		}
		function inviteMember(){			
			var recruitNo = document.getElementById('project_no').value;
			
			$.ajax({
				url: "${contextPath}/inviteMember",
				method: "POST",
				data: {
					customerNo: ${customer.customerNo}, 
					recruitNo: recruitNo,
					${_csrf.parameterName} : '${_csrf.token}'
					},
				success: function(data){
					if (data == "success") {
						$('.close').click();
						$('.smallbtn').hide();
						$('.cancelbtn').show();						
					}
				}
			});
			
		}
		function uninviteMember(){
			var recruitNo = document.getElementById('project_no').value;
			$.ajax({
				url:"${contextPath}/manageTeam/deny",
				data:{ 
					memberNo: ${customer.customerNo}, 
					recruitNo: recruitNo,
					${_csrf.parameterName} : '${_csrf.token}'
				},
				success: function(data){
					if (data == "success") {
						$('.close').click();
						$('.smallbtn').show();
						$('.cancelbtn').hide();
						
					}
				}
			});
		}
		function addBookmark() {
			var no = document.getElementById('project_no').value;
			$.ajax({
				url : "${contextPath}/bmUser",
				method : "POST",
				data : {
					recruitNo : no,					
					${_csrf.parameterName} : '${_csrf.token}'
				},
				success : function(data) {
					console.log(data);					
					if (data == "success") {						
						$("img.bm").css("display", "none");
						$("img.on").css("display", "inline-block");
					}
				}
			});
		}
	</script>
</body>

</html>