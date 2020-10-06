<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>내가 등록한 팀</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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

.rec_title {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.manage_project_area {
	background: #F5F7FA;
	padding-top: 100px;
	padding-bottom: 100px;
}

.myProject_project_area{
	background: #F5F7FA;
	padding-bottom: 100px;
}

.manage_project_table_warp {
	margin-bottom: 30px;
	padding-top: 10px;
	padding-left: 30px;
	padding-right: 30px;
	border-radius: 5px 5px;
	overflow-x: auto;
}

.table-head>div {
	color: #415094;
	line-height: 40px;
	font-weight: 500;
}
.title {
	width: 36%;
}
.purpose, .name, .theme, .position, .status, .deadline {
	width: 16%;
}
.status, .deadline {
	width: 12%;
}
.manageMember {
	width: 20%;
 	text-align: center;
}
.projectNo, .member_no, .recruit_no {
	display:none;
}
.table-row>.title:hover, .table-row>.name:hover {
	color: #00D363;
	transition: 0.3s;
	cursor: pointer;
}
.table-head>:first-child, .table-row>:nth-child(2) {
	padding-left:10px;
}
.table-row>:last-child {
	overflow: visible;
}
.manage-bnt {
	border-radius: 20px;
	text-align: center;
	text-decoration: none;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease 0s;
	padding: 8px 20px 8px 20px;
}
.allow-my-invi, .allow-in {
	color: #38a4ff;
	border: 1px solid #38a4ff;
}

.allow-my-invi:hover, .allow-in:hover {
	color: #fff;
	background: #38a4ff;
	border: 1px solid transparent;
}
.deny-my-app, .deny-my-invi, .deny-to-invite, .deny-in {
	color: #f44a40;
	border: 1px solid #f44a40;
}

.deny-my-app:hover, .deny-my-invi:hover, .deny-to-invite:hover, .deny-in:hover {
	color: #fff;
	background: #f44a40;
	border: 1px solid transparent;
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
						<h3>나의 프로젝트</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ bradcam_area  -->



	<!--목록 시작 -->
	<div class="manage_project_area">
        <div class="container">
            <div class="row">
                <div class="col-12 manageMenu">
                    <button class="genric-btn default radius myProject" onclick="myProject();">내가 등록한 팀</button>
                    <button class="genric-btn default radius lookUpmyProject" onclick="lookUpmyProject();">내가 속해있는 팀</button>
                    <button id="myApplication" class="genric-btn default radius" onclick="fxMyApplication();">내가 지원한 팀</button>
                    <button id="myInvitaion" class="genric-btn default radius" onclick="fxMyInvitation();">초대받은 팀</button>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="manage_project_table_warp bg-white">
					<div class="progress-table bg-white">
						<div class="table-head bg-white">
							<div class="title">프로젝트 명</div>
							<div class="purpose position">목적</div>
							<div class="theme">주제</div>
							<div class="status deadline">상태</div>
							<div class="manageMember managerName text-center">초대/지원 관리</div>
						</div>
						<div class="tr-section">
							<div class="table-row bg-white">
								<div style='width:100%; height:100px; line-height:100px; text-align:center;'>응답중입니다.</div>
							</div>
						</div>
                    </div>
                    </div>
                </div>
            </div>
            </div>
    </div>
	
	
	
	<!-- featured_candidates_area_end  -->




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
	//섹션 설정
	var loginedCustomer = ${sessionScope.loginInfo};
	var $section = $(".tr-section");
	var $tableHead = $(".table-head");
	var $manageInTHead = $tableHead.find(".manageMember");
	var $purposeOrPositionInTHead = $tableHead.find(".purpose");
	var $statusOrdeadlineInTHead = $tableHead.find(".status");

	$(function() {
		myProject();
	});
	
	//메뉴 버튼 누르면 바탕 색 바뀌기
	let $menuBtnArray = $(".manageMenu>button");
	$menuBtnArray.each(function(i){
		$(this).click(function(e){
			//바탕 색 바뀌기
			$menuBtnArray.css("background-color","#f9f9ff");
			$(this).css("background-color","#fff");
		});
	});
	
	//관리버튼 클릭
	$section.on("click", "a.manage-bnt", function(e){
		let tableRow = this.parentNode.parentNode;
		let recruitNo = $(tableRow).find(".recruit_no").html();
		let memberNo = $(tableRow).find(".member_no").html();
		
		//내 지원 취소하기 / 지원한 사람 거절하기 / 초대 취소하기 / 초대 거절하기
		if ($(this).attr("class").search("deny") > 0) {
			let denyConfirm = confirm("정말 " + this.innerHTML + "하시겠습니까?");
			if(denyConfirm==1){
				deny(recruitNo, memberNo, this.innerHTML);
	 			$(this.parentNode.parentNode).remove();
			}
		}
		//지원자 수락하기 / 초대 수락하기
		else if ($(this).attr("class").search("allow") > 0) {
			let allowConfirm = confirm("정말 수락하시겠습니까?");
			if(allowConfirm==1){
				allow(recruitNo, memberNo);
				$(this.parentNode.parentNode).remove();
			}
		}
		//기본 이벤트, 이벤트 전파 막기
		return false;
	});
	
	//클릭 시 팀 상세 페이지로 이동
	function projectDetail(e){
		let $projectNo = $(e).siblings("div.projectNo").html();
		let url = "${contextPath}/logined/project_detail?projectNo=" + $projectNo ;
		location.href = url;
	}
	
	//내가 등록한 팀 불러오기
	function myProject() {
		$.ajax({
			url : "${contextPath}/logined/myTeam",
			method : "POST",
			data : {${_csrf.parameterName} : '${_csrf.token}'},
			success : function(projects) {
				$manageInTHead.html("초대/지원 관리");
				$purposeOrPositionInTHead.html("목적");
				$statusOrdeadlineInTHead.html("상태");
				let data = "";
				//forEach
				let size = projects.length;
				if (size > 0) {
					projects.forEach(function(project, index) {
						data += '<div class="table-row bg-white">';
						data += '<div class="projectNo">'+ project.projectNo +'</div>';
						data += '<div class="title" onclick="projectDetail(this);">' + project.title + '</div>';
						data += '<div class="purpose">'+ project.purpose +'</div>';
						data += '<div class="theme">'+ project.theme +'</div>';
						if(project.projectStatus == 1){
							data += '<div class="status">진행중</div>';
						} else {
							data += '<div class="status">종료</div>';
						}
						data += '<div class="manageMember text-center">초대/지원 관리</div></div>';
					});
				} else {
					data += "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>등록한 팀이 없습니다.</div>";
				}
				$section.html(data);
			}
		});
	}
	
	//내가 속해있는 팀 불러오기
	function lookUpmyProject(){
		let $myProjectList = $(".tr-section");
		$.ajax({
			url : "${contextPath}/logined/lookUpmyTeam",
			method : "POST",
			data : {${_csrf.parameterName} : '${_csrf.token}'},
			success : function(projects) {
				$manageInTHead.html("");
				$purposeOrPositionInTHead.html("목적");
				$statusOrdeadlineInTHead.html("상태");
				let data = "";
				//forEach
				let size = projects.length;
				if (size > 0) {
					projects.forEach(function(project, index) {
						data += '<div class="table-row bg-white">';
						data += '<div class="projectNo">'+ project.projectNo +'</div>';
						data += '<div class="title" onclick="projectDetail(this);">' + project.title + '</div>';
						data += '<div class="purpose">'+ project.purpose +'</div>';
						data += '<div class="theme">'+ project.theme +'</div>';
						if(project.projectStatus == 1){
							data += '<div class="status">진행중</div>';
						} else {
							data += '<div class="status">종료</div>';
						}
						data += '<div class="manageMember"></div></div>';
					});
				} else {
					data += "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>내가 속한 팀이 없습니다.</div>";
				}
				$myProjectList.html(data);
			}
		}); // ajax
	}

	//내가 지원한 프로젝트
	function fxMyApplication(){
		$.ajax({
			url:"${contextPath}/manageProject/myApplication"
			,method:"POST"
			,data: {memberNo : loginedCustomer,
	            ${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(projects){
				$manageInTHead.html("지원 관리");
				$purposeOrPositionInTHead.html("역할");
				$statusOrdeadlineInTHead.html("모집마감일");
				let sectionData = "";
				projects.forEach(function(project, pIndex){
					let recruits = project.recruits;
					recruits.forEach(function(recruit, rIndex){
						recruit.members.forEach(function(member, mIndex){
							if(member.customer.customerNo == loginedCustomer) {
								sectionData += '<div class="table-row bg-white">';
								sectionData += '<div class="recruit_no">'+ recruit.recruitNo +'</div>';
								sectionData += '<div class="title" onclick="projectDetail(this);">' + project.title + '</div>';
								sectionData += '<div class="member_no">'+ loginedCustomer +'</div>';
								sectionData += '<div class="position">' + recruit.position.name + '</div>';
								sectionData += '<div class="theme">' + project.theme + '</div>';
								let date = new Date(recruit.deadline);
								sectionData += '<div class="deadline">' + date.getFullYear()+'.';
								if( (date.getMonth()+1) < 10 ){
									sectionData += '0' + (date.getMonth()+1) + '.';
								} else {
									sectionData += (date.getMonth()+1) + '.';
								}
								if( date.getDate() < 10 ) {
									sectionData += '0' + date.getDate() + "</div>";
								} else {
									sectionData += date.getDate() + "</div>";
								}
								sectionData += '<div class="manageMember text-center">';
								sectionData += '<a href="#" class="manage-bnt deny-my-app">취소</a></div></div>';
							}
						});
					});
				});
				if(sectionData == ""){
					sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>지원한 팀이 없습니다.</div>";
				}
				$section.html(sectionData);
			}
		});
	}

	//나에게 초대를 보낸 팀 보여주기
	function fxMyInvitation() {
		$.ajax({
			url:"${contextPath}/manageProject/myInvitation"
			,method:"POST"
			,data : {memberNo : ${sessionScope.loginInfo},
	            ${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(projects){
				$manageInTHead.html("초대 관리");
				$purposeOrPositionInTHead.html("역할");
				$statusOrdeadlineInTHead.html("모집마감일");
				let sectionData = "";
				projects.forEach(function(project, pIndex){
					let recruits = project.recruits;
					recruits.forEach(function(recruit, rIndex){
						recruit.members.forEach(function(member, mIndex){
							if(member.customer.customerNo == ${sessionScope.loginInfo}) {
								sectionData += '<div class="table-row bg-white">';
								sectionData += '<div class="recruit_no">'+ recruit.recruitNo +'</div>';
								sectionData += '<div class="title" onclick="projectDetail(this);">' + project.title + '</div>';
								sectionData += '<div class="member_no">'+ loginedCustomer +'</div>';
								sectionData += '<div class="position">' + recruit.position.name + '</div>';
								sectionData += '<div class="theme">' + project.theme + '</div>';
								let date = new Date(recruit.deadline);
								sectionData += '<div class="deadline">' + date.getFullYear()+'.';
								if( (date.getMonth()+1) < 10 ){
									sectionData += '0' + (date.getMonth()+1) + '.';
								} else {
									sectionData += (date.getMonth()+1) + '.';
								}
								if( date.getDate() < 10 ) {
									sectionData += '0' + date.getDate() + "</div>";
								} else {
									sectionData += date.getDate() + "</div>";
								}
								sectionData += '<div class="manageMember text-center">';
								sectionData += '<a href="#" class="manage-bnt allow-my-invi" style="margin-right: 10px;">수락</a>';
								sectionData += '<a href="#" class="manage-bnt deny-my-invi">거절</a></div></div>';
							}
						});
					});
				});
				if(sectionData == ""){
					sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>초대받은 팀이 없습니다.</div>";
				}
				$section.html(sectionData);
			}
		});
	}

	//내가 초대한 멤버 보여주기
	function fxInvited(){
		$.ajax({
			url:"${contextPath}/manageProject/invited"
			,method:"POST"
			,data: {managerNo : ${sessionScope.loginInfo},
				${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(projects){
				let sectionData = "";
				if (projects.length == 0){
					sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>팀장을 맡고 있는 프로젝트가 없습니다.</div>";
				} else {
					projects.forEach(function(project, pIndex){
						let recruits = project.recruits;
						recruits.forEach(function(recruit, rIndex){
							let members = recruit.members;
							members.forEach(function(member, mIndex){
								if(member.enterStatus==0 && member.invited==1){
									sectionData += '<div class="table-row bg-white">';
									sectionData += '<div class="recruit_no" style="display:none;">'+ recruit.recruitNo +'</div>';
									sectionData += '<div class="title">' + project.title + '</div>';
									sectionData += '<div class="member_no" style="display:none;">'+ member.customer.customerNo +'</div>';
									sectionData += '<div class="name">' + member.customer.name + '</div>';
									sectionData += '<div class="position">' + recruit.position.name + '</div>';
									let date = new Date(recruit.deadline);
									sectionData += '<div class="deadline">' + date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate() + '</div>';
									if(recruit.recruitStatus==1){
										sectionData += '<div class="status">모집중</div>';
									} else {
										sectionData += '<div class="status">마감</div>';
									}
									sectionData += '<div class="button text-center">';
									sectionData += '<a href="#" class="manage-bnt deny-to-invite">취소</a></div></div>';
								}
							});
						});
					});
				}
				if(sectionData == ""){
					sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>초대한 멤버가 없습니다.</div>";
				}
				$section.html(sectionData);
			}
		});		
	}

	//내 팀에 지원한 멤버 보여주기
	function fxApplied(loginedCustomer) {
		$.ajax({
			url:"${contextPath}/manageProject/applied"
			,method:"POST"
				//{managerNo : ${sessionScope.loginInfo},
			,data: {managerNo : loginedCustomer,
				${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(projects){
				let sectionData = "";
				if (projects.length == 0){
					sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>팀장을 맡고 있는 프로젝트가 없습니다.</div>";
				} else {
				projects.forEach(function(project, pIndex){
					let recruits = project.recruits;
					recruits.forEach(function(recruit, rIndex){
						let members = recruit.members;
						members.forEach(function(member, mIndex){
							if(member.enterStatus==0 && member.invited==0){
								sectionData += '<div class="table-row bg-white">';
								sectionData += '<div class="recruit_no" style="display:none;">'+ recruit.recruitNo +'</div>';
								sectionData += '<div class="title">' + project.title + '</div>';
								sectionData += '<div class="member_no" style="display:none;">'+ member.customer.customerNo +'</div>';
								sectionData += '<div class="name">' + member.customer.name + '</div>';
								sectionData += '<div class="position">' + recruit.position.name + '</div>';
								let date = new Date(recruit.deadline);
								sectionData += '<div class="deadline">' + date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate() + '</div>';
								if(recruit.recruitStatus==1){
									sectionData += '<div class="status">모집중</div>';
								} else {
									sectionData += '<div class="status">마감</div>';
								}
								sectionData += '<div class="button text-center">';
								sectionData += '<a href="#" class="manage-bnt allow-in" style="margin-right: 10px;">수락</a>';
								sectionData += '<a href="#" class="manage-bnt deny-in">거절</a></div></div>';
							}
						});
					});
				});
			}
			if(sectionData == ""){
				sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>지원한 멤버가 없습니다. </div>";
			}
			$section.html(sectionData);
			}
		});
	}

	//거절, 취소하기
	function deny(recruitNo, memberNo, question){
		$.ajax({
			url:"${contextPath}/manageMember/deny"
			,method:"POST"
			,data : { recruitNo : recruitNo,
					memberNo : memberNo,
		            ${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(result){
				if(result=="success"){
					alert(question + " 되었습니다.");
				}
			}
		});
	}

	//수락하기
	function allow(recruitNo, memberNo){
		$.ajax({
			url:"${contextPath}/manageMember/allow"
			,method:"POST"
			,data : { recruitNo : recruitNo,
					memberNo : memberNo,
		            ${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(result){
				if(result=="success"){
					alert("수락되었습니다.");
				}
			}
		});
	}

	//새 창으로 멤버 상세보기 페이지 열기
	function fxMemberDetail(memberNo){
		window.open("about:blank", "winName");
		let form = document.memberForm;
		form.action = "${contextPath}/all/member_recruit";
		form.target = "winName";
		$(form).find("input[name=customerNo]").val(memberNo);
		form.submit();
	}
	</script>
</body>

</html>