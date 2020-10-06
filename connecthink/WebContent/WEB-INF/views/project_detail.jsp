<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="detail" value="${requestScope.detail}" />
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>프로젝트 상세</title>
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
li::before {
	content: unset !important;
}

li {
	color: black !important;
}

span.customerNo {
	display: none;
}

.project_foot_left ul li {
	padding-left: 25px;
}
.project_foot_right {
  display: flex;
  align-items: center;
  justify-content: center;
}

.recTitle:hover{
	color: #00D363 !important;
	font-weight: bold;
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
						<h3>프로젝트 상세</h3>
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
									<h2>${detail.title}</h2>
								</div>
							</div>
							<div class="jobs_right">
								<div class="jobs_conetent mt-1 text-center">
									<fmt:formatDate var="cdt" value="${detail.createDate}"
										pattern="yyyy-MM-dd" />
									<span>${cdt}</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 제목 밑 -->
					<div class="descript_wrap white-bg"
						style="border-bottom: 1px solid #EAEAEA;">
						<div class="single_wrap team_info">
							<h4 class="mb-2">한줄소개</h4>
							<ul>
								<li>${detail.about}</li>
							</ul>
							<h4 class="mb-2 mt-2">주제</h4>
							<ul>
								<li>${detail.theme}</li>
							</ul>
							<h4 class="mb-2 mt-2">목적</h4>
							<ul>
								<li>${detail.purpose}</li>
							</ul>
						</div>
					</div>
					<!-- 컨텐츠 끝 -->
					<div class="single_jobs white-bg d-flex justify-content-between">
						<div class="project_foot_left">
							<div>
								<h4 class="mb-3">모집 목록</h4>
							</div>
							<ul>
								<c:forEach items="${detail.recruits}" var="rec"
									varStatus="status">
									<li class="mb-1 recTitle" onclick="recDetail(this);"> ${rec.requirement}
										<ul>	
											<li class="recNo" style="display : none">${rec.recruitNo}</li>
										</ul>
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="project_foot_right">
							<button class="boxed-btn3" onclick="rec_add();">모집추가</button>
						</div>
					</div>
					<div class="col-md-12 mt-3">
						<div class="submit_btn text-center">
							<button class="boxed-btn3 mr-2" onclick="modify();">수정하기</button>
							<button class="boxed-btn3" onclick="del();">삭제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 종료 모달  -->
	<div class="modal fade" id = "ending">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title">종료 된 프로젝트</h4>
				</div>
				<div class="modal-body text-center p-5">
					<h5>프로젝트가 종료 되었습니다 :(</h5>
				</div>
				<div class="modal-footer ending">
					<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/'">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
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
		let projectNo = "${detail.projectNo}";
		let managerNo = "${detail.managerNo}";
		let customerNo = "${sessionScope.loginInfo}";
		let status = "${detail.projectStatus}";
		
		//로드 시 customerNo와 projectNo 비교
		$(function(){
			if(managerNo != customerNo || status == 2){
				$(".boxed-btn3").attr("disabled", true);
				$(".boxed-btn3").css("display", "none");
				
				$(".boxed-btn3").css("display","none");
				$("#ending").modal("show").css({
					"margin-top" : function(){
						return ($(this).height()/3);
					}
				});
			}
			
			if(managerNo == customerNo && status == 2){
				let $mdal = $("div.ending");
				let mdata = "";
				mdata =	'<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>'
				$mdal.html(mdata);
				
				$(".boxed-btn3").css("display","none");
				$("#ending").modal("show").css({
					"margin-top" : function(){
						return ($(this).height()/3);
					}
				});
			}
		});
		
		//프로젝트 삭제 ajax
		function delProject(){
			$.ajax({
				url: "${contextPath}/logined/delProject",
				method : "POST",
				data : {
					projectNo : projectNo,
					${_csrf.parameterName} : '${_csrf.token}'
				} ,
				success: function(response){
					if(response.status == "success"){
						alert("삭제 성공");
						location.href="${contextPath}/";
					} else {
						alert(response.msg);
					}
				}
			});
		}
		
		//모집 삭제 ajax
		function delRec(){
			$.ajax({
				url : "${contextPath}/logined/delRecAll",
				method : "POST",
				data : {
					projectNo : projectNo,
					${_csrf.parameterName} : '${_csrf.token}'
				} ,
				success: function(response){
					if(response.status == "success"){
						delProject();
					} else {
						alert(response.msg);
					}
				}
			});
		}
		
		//모집 등록
		function rec_add() {
			let answer = confirm("${detail.title}" + " 에 모집을 추가로 등록하시겠습니까?");
			if (answer == true) {
				location.href = "${contextPath}/logined/add_rec?projectNo=" + projectNo;
			}
			return false;
		}
		
		//모집 상세보기
		function recDetail(e){
			let $recNo = $(e).find("li.recNo").html();
			location.href = "${contextPath}/all/rec_detail?recNo=" + $recNo
		}
		
		//프로젝트 수정
		function modify(){
			let answer = confirm("${detail.title}" + " 정보를 수정하시겠습니까?");
			if (answer == true) {
				location.href = "${contextPath}/logined/modify_project?projectNo=" + projectNo;
			}
			return false;
		}
		
		//프로젝트 삭제
		function del(){
			let recList = "${detail.recruits}";
			let answer = confirm("${detail.title}" + " 프로젝트를 삭제하시겠습니까?");	
			if(answer == true){
				if(recList.length > 0){
					delRec();
				} else {
					delProject();
				}
			}
			return false;
		}
		
	</script>
</body>

</html>