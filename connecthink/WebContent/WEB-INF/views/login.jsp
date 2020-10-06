<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    
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
    
<!-- 로그인 Modal -->
    <div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLongTitle">로그인</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		            </button>
                </div>
                <form>
				<div class="modal-body">
					<div class="mt-10">
						<input type="email" name="username" placeholder="이메일"
							onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'"
							required class="single-input">
					</div>
					<div class="mt-10">
						<input type="password" name="password" placeholder="비밀번호"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '비밀번호'" required class="single-input">
					</div>
					<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>
				<div class="modal-footer">
	                    <a id="openFindEmailModalBtn" style="text-decoration: underline; color: #367FFF; cursor: pointer;" data-toggle="modal" data-backdrop="false">이메일 찾기</a>
	                    <a id="openFindPwdModalBtn" style="text-decoration: underline; color: #367FFF; cursor: pointer;" data-toggle="modal" data-backdrop="false">비밀번호 찾기</a>
	<!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> -->
	                    <button type="submit" class="btn btn-primary">로그인</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- 이메일 찾기 Modal -->
    <div class="modal" id="findEmailModal" tabindex="-1" role="dialog" aria-labelledby="findEmailModalCenterTitle" aria-hidden="true" style="z-index: 1051;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findEmailModalLongTitle">이메일 찾기</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 		                <span aria-hidden="true">&times;</span> -->
<!-- 		            </button> -->
                </div>
                <form>
	                <div class="modal-body">
	                    <div class="mt-10">
	                        <input type="text" name="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required class="single-input">
	                    </div>
	                    <div class="mt-10">
	                        <input type="text" name="birthDate" placeholder="생년월일 8자리 ex)19921211" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일 8자리 ex)19921211'" required class="single-input">
	                    </div>
	                    <input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary">뒤로</button>
	                    <button type="submit" class="btn btn-primary">찾기</button>
	                </div>
                 </form>
            </div>
        </div>
    </div>
    <!-- 비밀번호 찾기 Modal -->
    <div class="modal" id="findPwdModal" tabindex="-1" role="dialog" aria-labelledby="findPwdModalCenterTitle" aria-hidden="true" style="z-index: 1051;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findPwdModalLongTitle">비밀번호 찾기</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 		                <span aria-hidden="true">&times;</span> -->
<!-- 		            </button> -->
                </div>
				<form>
					<div class="modal-body">
						<br>
						<div class="row">
							<div class="col-md-5 offset-1">
								<input type="email" name="email" placeholder="이메일"
									onfocus="this.placeholder = ''"
									onblur="this.placeholder = '이메일'" required class="single-input">
							</div>
							<div class="col-md-5">
								<a style="color: #367FFF; cursor: pointer;" class="genric-btn info-border">이메일 인증</a>
							</div>
						</div>
						<br>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary">뒤로</button>
						<button type="submit" class="btn btn-primary">찾기</button>
					</div>
				</form>
			</div>
        </div>
    </div>
     <!-- 비밀번호 재설정 Modal -->
    <div class="modal" id="modifyPwdModal" tabindex="-1" role="dialog" aria-labelledby="modifyModalCenterTitle" aria-hidden="true" style="z-index : 1053;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modifyModalLongTitle">비밀번호 재설정</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 		                <span aria-hidden="true">&times;</span> -->
<!-- 		            </button> -->
                </div>
                <form>
				<div class="modal-body">
					<div class="mt-10">
						<input type="password" name="password" placeholder="비밀번호"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '비밀번호'" required class="single-input">
					</div>
					<div class="mt-10">
						<input type="password" name="passwordForCheck" placeholder="비밀번호 확인"
							onfocus="this.placeholder = ''"
							onblur="this.placeholder = '비밀번호 확인'" required class="single-input">
					</div>
					<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</div>
				<div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로</button>
	                    <button type="submit" class="btn btn-primary">재설정</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 회원가입 Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLongTitle">회원가입</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                <span aria-hidden="true">&times;</span>
		            </button>
                </div> 
                <form>
	                <div class="modal-body">
	                        <div class="row">
	                    		<div class="col-md-6">
	                            	<input type="email" name="email" placeholder="이메일" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일'" required class="single-input">
		                        </div>
		                        <div class="col-md-6">
		                            <button id="requestVerifyCodeBtn" class="genric-btn info-border">이메일 인증</button>
		                        </div>
		                    </div>
	                        <div class="mt-10">
	                            <input type="password" name="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required class="single-input">
	                        </div>
	                        <div class="mt-10">
	                            <input type="text" name="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required class="single-input">
	                        </div>
	                        <div class="mt-10">
	                            <input type="text" name="birthDate" placeholder="생년월일 8자리 ex)19980404" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일 8자리 ex)19980404'" required class="single-input">
	                        </div>
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                </div>
	                <div class="modal-footer">
	<!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button> -->
	                    <button type="submit" class="btn btn-primary">회원가입</button>
	                </div>
                </form>
            </div>
        </div>
    </div>
    <!-- 이메일 인증 Modal -->
    <div class="modal" id="verifyModal" tabindex="-1" role="dialog" aria-labelledby="verifyModalCenterTitle" aria-hidden="true" style="z-index: 1052;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="verifyModalLongTitle">이메일 인증</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 		                <span aria-hidden="true">&times;</span> -->
<!-- 		            </button> -->
                </div>
				<div class="modal-body">
					<br> <br> <br>
					<div class="row">
						<div class="col-md-12">
							<input type="text" name="verifyCode" placeholder="코드 6자리 ex)123456" onfocus="this.placeholder = ''" onblur="this.placeholder = '코드 6자리 ex)123456'" required class="single-input">
							<input type="hidden" id="isVerified" value="n">
						</div>
					</div>
					<br> <br> <br>
				</div>
				<div class="modal-footer">
	                <button type="button" class="btn btn-secondary">뒤로</button>
	                <button id="verifyBtn" class="btn btn-primary">인증</button>
	            </div>
	        </div>
        </div>
    </div>
    
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
	
	$(() => {
		//security 적용으로, 로그인이 필요한 페이지에 로그인하지 않고 접근하여 이 페이지로 이동된 경우, 로그인 창을 바로 보여준다
		if(location.href=="http://localhost/connecthink/login") {
			$("#loginModal").modal({keyboard: false, backdrop: 'static'}).find("button.close").css("display", "none");
		} else {
			$("#loginModal").find("button.close").css("display", "block");
		}
		var csrfToken = $("#csrf").val();
		
		var beforeVerifyModal;
		//이메일 찾기 버튼 클릭
		$("#openFindEmailModalBtn").click(function() {
			$("#loginModal").modal("hide");
			$("#findEmailModal").modal({
				keyboard: false,
				backdrop: 'static'
			});
		});
		//비밀번호 찾기 버튼 클릭
		$("#openFindPwdModalBtn").click(function() {
			$("#loginModal").modal("hide");
			$("#findPwdModal").modal({
				keyboard: false,
				backdrop: 'static'
			});
		});
		//이메일 찾기 모달에서 뒤로 버튼 클릭
		$("#findEmailModal").find("button[type=button]").click(function() {
			$("#findEmailModal").modal("hide");
			$("#loginModal").modal("show");
		});
		//비밀번호 찾기 모달에서 뒤로 버튼 클릭
		$("#findPwdModal").find("button[type=button]").click(function() {
			$("#findPwdModal").modal("hide");
			$("#loginModal").modal("show");
		});
		
		//로그인 모달에서 로그인 버튼 클릭
		$("#loginModal").find("form").submit(function() {
			$.ajax({
				url : "/connecthink/login",
				method : "POST",
				data : $(this).serialize(),
				success : (data, textStatus, jqXHR) => {
					location.href = "/connecthink/";
				},
				error : () => {
					alert("로그인 실패");
				}
			});
			return false;
		});
		
		//로그아웃 버튼 클릭시 로그아웃 요청 전송
		$("#logoutBtn").click(() => {
			$.ajax({
				url : "/connecthink/logout",
				method : "POST",
				data : {_csrf : csrfToken},
				success : (data, textStatus, jqXHR) => {
					location.href = "/connecthink/";
				}
			});
		});
		
		//회원가입 모달에서 이메일 인증 버튼 클릭 시 인증 코드 요청 전송
		$("#requestVerifyCodeBtn").click(function() {
			var email = $(this).parent().prev().find("input").val();
			if(email == '') {
				alert("이메일을 입력하세요");
				return false;
			}
					
			//이메일 인증 모달 표시
			beforeVerifyModal = $("#registerModal");
			$("#registerModal").modal("hide");
			$("#verifyModal").modal({
				keyboard: false,
				backdrop: 'static'
			});
			
			$.ajax({
				url : "/connecthink/all/requestVerifyCode",
				data : {'email' : email, 
						verifyType : 1,
						'_csrf' : csrfToken},
				success : (data, textStatus, jqXHR) => {
							
				},
				error : () => {
					alert("중복 이메일");
				}
			});
		});
		
		//이메일 인증 모달에서 뒤로 버튼 클릭
		$("#verifyModal").find("button.btn-secondary").click(function() {
			$("#verifyModal").modal("hide");
			beforeVerifyModal.modal("show");
		});
		
		//이메일 인증 모달에서 인증 버튼 클릭 시 인증 요청 전송
		$("#verifyBtn").click(function() {
			var verifyCode = $(this).parent().prev().find("input").val();
					
			$.ajax({
				url : "/connecthink/all/verify",
				data : {'code' : verifyCode,
						'_csrf' : csrfToken},
				success : (data, textStatus, jqXHR) => {
					alert("인증되었습니다.");
					$("#verifyModal").modal("hide");
					$("#isVerified").val("y");
					beforeVerifyModal.modal("show");
				},
				error : () => {
					alert("인증 코드가 올바르지 않습니다.");
				}
			});
		});
				
		//회원가입 모달에서 가입 버튼 클릭
		$("#registerModal").find("form").submit(function() {
			if($("#isVerified").val() == "n") {
				alert("이메일 인증이 필요합니다");
			} else {
				$.ajax({
					url : "/connecthink/all/register",
					method : "POST",
					data : $(this).serialize(),
					success : (data, textStatus, jqXHR) => {
						location.reload();
					},
					error : () => {
						alert("회원가입 실패");
					}
				});
			}
					
			return false;
		});
				
		//이메일 찾기 모달에서 찾기 버튼 클릭
		$("#findEmailModal").find("form").submit(function() {
			$.ajax({
				url : "/connecthink/all/findEmail",
				method : "POST",
				data : $(this).serialize(),
				beforeSend : function(xhr) {
				 		xhr.setRequestHeader('X-CSRF-TOKEN', csrfToken);
				 },
				success : (data, textStatus, jqXHR) => {
					$("#findEmailModalLongTitle").html("당신의 이메일");
					$("#findEmailModal").find("div.modal-body").html(
						`<br><h3>`+ data +`</h3><br>`
					);
				}
			});
				
			return false;
		});
				
		//이메일 찾기 모달에서 뒤로 버튼 클릭
		$("#findEmailModal").find("button[type=button]").click(function() {
			$("#findEmailModalLongTitle").html("이메일 찾기");
			$("#findEmailModal").find("div.modal-body").html(
								`<div class="mt-10">
			                        <input type="text" name="name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" required class="single-input">
			                    </div>
			                    <div class="mt-10">
			                        <input type="text" name="birthDate" placeholder="생년월일 8자리 ex)19921211" onfocus="this.placeholder = ''" onblur="this.placeholder = '생년월일 8자리 ex)19921211'" required class="single-input">
			                    </div>`
			        			);
		});
				
		//비밀번호 찾기 모달에서 이메일 인증 버튼 클릭 시 인증 코드 요청 전송
		$("#findPwdModal").find("a").click(function() {
			var email = $(this).parent().prev().find("input").val();
			
			if(email == '') {
				alert("이메일을 입력하세요");
				return false;
			}
			
			//이메일 인증 모달 표시
			beforeVerifyModal = $("#findPwdModal");
			$("#findPwdModal").modal("hide");
			$("#verifyModal").modal({
				keyboard: false,
				backdrop: 'static'
			});
			
			$.ajax({
				url : "/connecthink/all/requestVerifyCode",
				data : {'email' : email, 
						verifyType : 2,
						'_csrf' : csrfToken},
				success : (data, textStatus, jqXHR) => {
					
				},
				error : () => {
					alert("중복 이메일");
				}
			});
		});
				
		//이메일 인증 이후 비밀번호 찾기 모달에서 찾기 버튼 클릭
		$("#findPwdModal").find("form").submit(function() {
			if($("#isVerified").val() == "n") {
				alert("이메일 인증이 필요합니다");
			} else {
				$("#modifyPwdModal").modal('show');
			}
					
			return false;
		});
				
		//비밀번호 재설정 모달에서 재설정 버튼 클릭
		$("#modifyPwdModal").find("form").submit(function() {
			var password = $(this).find("input[name=password]").val();
			var passwordForCheck = $(this).find("input[name=passwordForCheck]").val();
			
			if(password != passwordForCheck) {
				alert("비밀번호를 다시 확인해주세요");
			} else {
				$.ajax({
					url : "/connecthink/all/modifyCustomerPwd",
					method : "POST",
					data : $(this).serialize(),
					success : (data, textStatus, jqXHR) => {
						location.reload();
					}
				});
			}
					
			return false;
		});
	});
	</script>