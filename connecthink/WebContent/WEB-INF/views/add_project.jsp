<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>프로젝트 등록</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
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
						<h3>프로젝트 등록</h3>
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
						<h4>프로젝트 등록하기 <span class="requir">*은 필수 입력 값입니다</span></h4>
						<form id="form">
							<div class="row">
							<div class="col-md-5" style="display:none;">
									<div class="input_field">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type="hidden" name="managerNo" value="${sessionScope.loginInfo}">
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 이름 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" name="title" placeholder="프로젝트 이름 (20자 내)" onkeyup="first(this, 20);">
										<span id = "counterOne" style = "color: gray;">0/20</span>
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 소개 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" name="about" placeholder="프로젝트에 대해 한 줄로 적어주세요(50자 내)" onkeyup="second(this, 50);">
										<span id = "counterTwo" style = "color: gray;">0/50</span>
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 주제 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<input type="text" name = "theme" placeholder="프로젝트 주제를 적어주세요 (ex. 데이팅 앱/ 레시피 판매 사이트) ">
									</div>
								</div>
								<div class="col-md-2">
								<h5 class="mt-3" style="font-weight: bold;">프로젝트 목적 <span class="requir"> *</span></h5>
								</div>
								<div class="col-md-10">
									<div class="input_field">
										<textarea name="purpose" maxlength="150" placeholder="프로젝트 목적을 적어주세요(150자 이내) (ex. 공모전 참가 / 서비스 출시 / 포트폴리오 목적)" onkeyup="limit(this, 150);"></textarea>	
										<span id = "counter" style = "color: gray;">0/150</span>
									</div>
								</div>
								<div class="col-md-12">
									<div class="text-center">
										<button class="boxed-btn3 mr-1 clear" type="button">취소하기</button>
										<button class="boxed-btn3 submit" type="button">등록하기</button>
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
	$(".submit").click(function(){
		if(check() != false){
			let data = new FormData($(form)[0]);
			alert(data);
			$.ajax({
				url : "${contextPath}/logined/addProject",
				method : "POST",
				enctype : "multipart/form-data",
	 			processData: false,
	 		    contentType: false,
	 			data : data,
	 			success : function(response){
	 				if(response.status == "success"){
	 					let answer = confirm("프로젝트 등록이 완료 되었습니다. 모집을 등록하시겠습니까?");
	 					if (answer == true){
	 						location.href="${contextPath}/add_rec?projectNo="+response.projectNo;
	 					} else {
	 						location.href = "${contextPath}/index";
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
	
	$(".clear").click(function (){
		let answer = confirm("등록을 취소하시겠습니까?");
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
		
		$('#counterOne').html(totalByte + '/20');
		
		if (totalByte > maxByte) {
			alert(maxByte + "자를 초과 입력 할 수 없습니다");
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
		
		$('#counterTwo').html(totalByte + '/50');
		
		if (totalByte > maxByte) {
			alert(maxByte + "자를 초과 입력 할 수 없습니다");
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
			
			$('#counter').html(totalByte + '/150');
			
			if (totalByte > maxByte) {
				alert(maxByte + "자를 초과 입력 할 수 없습니다");
				str2 = strValue.substr(0, len);
				str.value = str2;
				limit(str, 4000);
			}
		}
		
		
		
	</script>
	
</body>

</html>