<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="detail" value="${requestScope.detail}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>프로젝트 정보 수정하기</title>
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
h5 .requir{
	color: red;
}
h4 .requir{
	color: red;
	font-size: 0.5em !important;
}

#counterOne, #counterTwo {
	position: absolute;
    bottom: 40px;
    right: 25px;
}

#counter {
	position: absolute;
    bottom: 25px;
    right: 25px;
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
						<h3>프로젝트 정보 수정</h3>
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
						<h4>프로젝트 정보 수정하기 <span class="requir">*은 필수 입력 값입니다</span></h4>
						<form id="form">
							<div class="row">
							<div class="col-md-5" style="display:none;">
									<div class="input_field">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type="hidden" name="projectNo" value="${detail.projectNo}">
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 이름 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" name="title" value="${detail.title}" onkeyup="first(this, 20);">
										<span id = "counterOne" style = "color: gray;">0/10</span>
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 소개 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" name="about" value="${detail.about}" onkeyup="second(this, 50);">
										<span id = "counterTwo" style = "color: gray;">0/25</span>
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 주제 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" name = "theme" value="${detail.theme}" maxlength="30">
										</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 목적 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<textarea name="purpose" type="text" onkeyup="limit(this, 100);">${detail.purpose}</textarea>
										<span id = "counter" style = "color: gray;">0/50</span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="submit_btn text-center">
										<button class="boxed-btn3 mr-1 clear" type="button" >취소하기</button>
										<button class="boxed-btn3 submit">수정하기</button>
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
	
	<script>
	$(function(){
		bftitle();
		bfabout();
		bfpurpose();
	});
	
	$(".submit").click(function(){
		if(check() != false){
			let data = new FormData($(form)[0]);
			$.ajax({
				url : "${contextPath}/logined/modifyProject",
				method : "POST",
				processData: false,
	            contentType: false,
	 			data : data,
	 			success : function(response){
	 				if(response.status == "success"){
	 					let answer = confirm("팀 수정이 완료 되었습니다. 모집을 등록하시겠습니까?");
	 					if (answer == true){
	 						location.href="${contextPath}/logined/add_rec?projectNo="+response.projectNo;
	 					} else {
	 						location.href = "${contextPath}/logined/myProject";
	 					}
	 				} else {
	 					alert("등록실패");
	 				}
	 			}
			});
		}
		return false;
	});
	
	function check(){
		if($("input[name=title]").val().length==0){
			$("input[name=title]").attr("placeholder","필수 입력란입니다").css("border-color","red");
			$("input[name=title]").focus();
			return false;
		}
		if($("input[name=about]").val().length==0){
			$("input[name=about]").attr("placeholder","필수 입력란입니다").css("border-color","red");
			$("input[name=about]").focus();
			return false;
		}
		if($("input[name=theme]").val().length==0){
			$("input[name=theme]").attr("placeholder","필수 입력란입니다").css("border-color","red");
			$("input[name=theme]").focus();
			return false;
		}
		if($("textarea[name=purpose]").val().length==0){
			$("textarea[name=purpose]").attr("placeholder","필수 입력란입니다").css("border-color","red");
			$("textarea[name=purpose]").focus();
			return false;
		}
	}
	
	//취소
	$(".clear").click(function (){
		let answer = confirm("수정을 취소하시겠습니까?");
		if(answer == true){
			location.href = "${contextPath}/";
		}
		return false;
	});
	
	
	
	//글자수 체크 - 제목
	function first(str, maxByte) {
		let strValue = str.value;
		let strLen = strValue.length;
		let totalByte = 0;
		let len = 0;
		let oneChar = "";
		let str2 = "";

		for (var i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4) {
				totalByte += 2;
			} else {
				totalByte++;
			}

			//입력한 문자 길이보다 넘치면 잘라낸다
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}
		
		$('#counterOne').html(totalByte/2 + '/10');
		
		if (totalByte > maxByte) {
			alert(maxByte/2 + "자를 초과 입력 할 수 없습니다");
			str2 = strValue.substr(0, len);
			str.value = str2;
			first(str, 4000);
		}
	}
	
	//글자수 체크 - 소개
	function second(str, maxByte) {
		let strValue = str.value;
		let strLen = strValue.length;
		let totalByte = 0;
		let len = 0;
		let oneChar = "";
		let str2 = "";

		for (var i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4) {
				totalByte += 2;
			} else {
				totalByte++;
			}

			//입력한 문자 길이보다 넘치면 잘라낸다
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}
		
		$('#counterTwo').html(totalByte/2 + '/25');
		
		if (totalByte > maxByte) {
			alert(maxByte/2 + "자를 초과 입력 할 수 없습니다");
			str2 = strValue.substr(0, len);
			str.value = str2;
			second(str, 4000);
		}
	}
	

		//글자수 체크 - 목적
		function limit(str, maxByte) {
			let strValue = str.value;
			let strLen = strValue.length;
			let totalByte = 0;
			let len = 0;
			let oneChar = "";
			let str2 = "";

			for (var i = 0; i < strLen; i++) {
				oneChar = strValue.charAt(i);
				if (escape(oneChar).length > 4) {
					totalByte += 2;
				} else {
					totalByte++;
				}

				//입력한 문자 길이보다 넘치면 잘라낸다
				if (totalByte <= maxByte) {
					len = i + 1;
				}
			}
			
			$('#counter').html(totalByte/2 + '/50');
			
			if (totalByte > maxByte) {
				alert(maxByte/2 + "자를 초과 입력 할 수 없습니다");
				str2 = strValue.substr(0, len);
				str.value = str2;
				limit(str, 4000);
			}
		}
		
		
		//받아 온 값의 글자 수 
		function bftitle(){
			let title = $("input[name = title]").val();
			let strLen = title.length;
			
			let totalByte = 0;
			let len = 0;
			let oneChar = "";
			let str2 = "";
			
			for (var i = 0; i < strLen; i++) {
				oneChar = title.charAt(i);
				if (escape(oneChar).length > 4) {
					totalByte += 2;
				} else {
					totalByte++;
				}
			}
			$('#counterOne').html(totalByte/2 + '/10');
		}
		
		function bfabout(){
			let about = $("input[name = about]").val();
			let strLen = about.length;
			
			let totalByte = 0;
			let len = 0;
			let oneChar = "";
			let str2 = "";
			
			for (var i = 0; i < strLen; i++) {
				oneChar = about.charAt(i);
				if (escape(oneChar).length > 4) {
					totalByte += 2;
				} else {
					totalByte++;
				}
			}
			$('#counterTwo').html(totalByte/2 + '/25');
		}
		
		function bfpurpose(){
			let purpose = $("textarea[name = purpose]").val();
			let strLen = purpose.length;
			
			let totalByte = 0;
			let len = 0;
			let oneChar = "";
			let str2 = "";
			
			for (var i = 0; i < strLen; i++) {
				oneChar = purpose.charAt(i);
				if (escape(oneChar).length > 4) {
					totalByte += 2;
				} else {
					totalByte++;
				}
			}
			$('#counter').html(totalByte/2 + '/50');
		}
	
	</script>
	
</body>

</html>