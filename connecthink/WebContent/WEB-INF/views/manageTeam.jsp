<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="loginedNo" value="${requestScope.loginedNo}"/>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>팀관리</title>
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
    
    <style type="text/css">
/* style.css 추가 */
.manage_team_area {
	background: #F5F7FA;
	padding-top: 100px;
	padding-bottom: 100px;
}
.manage_team_table_warp {
	margin-bottom: 30px;
	padding-top: 10px;
	padding-left: 30px;
	padding-right: 30px;
	border-radius: 5px 5px;
	overflow-x: auto;
}
#myApplication {
	background-color: #fff;
}
.table-head>div {
	color: #415094;
	line-height: 40px;
	font-weight: 500;
}
.table-row>div {
	font-size: 1em;
}
.title {
	width: 32%;
}
.purposeOrName, .purpose, .name {
	width: 15%;
}
.position {
	width: 15%;
}
.deadline {
	width: 12%;
}
.status {
	width: 6%;
}
.button {
	width: 19%; 
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
/* .viewerForm{ */
/* 	display:none; */
/* } */
/* style.css 추가 할 부분 끝 */
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
                        <h3>팀 관리</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->

    <!-- manage_team_area_start  -->
    <div class="manage_team_area">
        <div class="container">
            <div class="row">
                <div class="col-12 manageMenu">
                    <button id="myApplication" class="genric-btn default radius">내가 지원한 팀</button>
                    <button id="myInvitaion" class="genric-btn default radius">초대받은 팀</button>
                    <button id="invitedMember" class="genric-btn default radius">내가 초대한 멤버</button>
                    <button id="appliedMember" class="genric-btn default radius">우리 팀에 지원한 멤버</button>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="manage_team_table_warp bg-white">
					<div class="progress-table bg-white">
						<div class="table-head bg-white">
							<div class="title">프로젝트 명</div>
							<div class="purposeOrName">목적</div>
							<div class="position">직무</div>
							<div class="deadline">마감일</div>
							<div class="status">상태</div>
							<div class="button text-center">관리</div>
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
            <form name="recruitForm" action="${contextPath}/rec_detail"><!-- method="post"> -->
				<input type="hidden" name="recNo" value="999">
			</form>
			<form name="memberForm" action="${contextPath}/member_recruit"><!-- method="post"> -->
				<input type="hidden" name="customerNo" value="999">
			</form>
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="pagination_wrap"> -->
<!--                         <ul> -->
<!--                             <li><a href="#"> <i class="ti-angle-left"></i> </a></li> -->
<!--                             <li><a href="#"><span>01</span></a></li> -->
<!--                             <li><a href="#"><span>02</span></a></li> -->
<!--                             <li><a href="#"> <i class="ti-angle-right"></i> </a></li> -->
<!--                         </ul> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
        </div>
    </div>
    <!-- manage_team_area_end  -->



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
//섹션 설정
var $section = $(".tr-section");

//로딩 되자마자 내가 지원한 팀 보여주기
fxMyApplication();

//메뉴 버튼 누르면 바탕 색 바뀌기 + 내용 지웠다 다시 쓰기
let $menuBtnArray = $(".manageMenu>button");
$menuBtnArray.each(function(i){
	$(this).click(function(e){
		
		//바탕 색 바뀌기
		$menuBtnArray.css("background-color","#f9f9ff");
		$(this).css("background-color","#fff");

		//ajax로 데이터 불러와서 table row 다시 쓰기
		//내가 지원한 팀
		if ($(this).attr("id") == "myApplication"){
			fxMyApplication(loginedCustomer);
		}
		//초대 받은 팀
		else if ($(this).attr("id") == "myInvitaion") {
			fxMyInvitation(loginedCustomer);
		}
		//내가 초대한 멤버
		else if ($(this).attr("id") == "invitedMember") {
			fxInvited(loginedCustomer);
		}
		//우리 팀에 지원한 멤버
		else if ($(this).attr("id") == "appliedMember") {
			fxApplied(loginedCustomer);
		}
		//기본 이벤트, 이벤트 전파 막기
		return false;
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

//프로젝트 이름 클릭하면 프로젝트 페이지 열기
$section.on("click", ".title", function(e){
	let tableRow = this.parentNode;
	let recruitNo = $(tableRow).find(".recruit_no").html();
	fxRecruitDetail(recruitNo);
	return false;
});

//회원 이름 클릭하면 회원 상세정보 페이지 열기
$section.on("click", ".name", function(e){
	let tableRow = this.parentNode;
	let memberNo = $(tableRow).find(".member_no").html();
	fxMemberDetail(memberNo);
	return false;
});

//----------------------함수들------------------------------
//내가 지원한 프로젝트
function fxMyApplication(){
	$.ajax({
		url:"${contextPath}/manageTeam/myApplication"
		,method:"POST"
			//{memberNo : ${sessionScope.loginInfo},
		,data: {memberNo : loginedCustomer,
            ${_csrf.parameterName} : '${_csrf.token}'}
		,success:function(projects){
			let $tableHead = $(".table-head");
			let $thPurpose = $tableHead.find(".purposeOrName");
			$thPurpose.html("목적");
			let sectionData = "";
			projects.forEach(function(project, pIndex){
				let recruits = project.recruits;
				recruits.forEach(function(recruit, rIndex){
					recruit.members.forEach(function(member, mIndex){
						if(member.customer.customerNo == 101) {
							sectionData += '<div class="table-row bg-white">';
							sectionData += '<div class="recruit_no" style="display:none;">'+ recruit.recruitNo +'</div>';
							sectionData += '<div class="title">' + project.title + '</div>';
							sectionData += '<div class="member_no" style="display:none;">'+ 101 +'</div>';
							sectionData += '<div class="purpose">' + project.purpose + '</div>';
							sectionData += '<div class="position">' + recruit.position.name + '</div>';
							let date = new Date(recruit.deadline);
							sectionData += '<div class="deadline">' + date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate() + '</div>';
							if(recruit.recruitStatus==1){
								sectionData += '<div class="status">모집중</div>';
							} else {
								sectionData += '<div class="status">마감</div>';
							}
							sectionData += '<div class="button text-center">';
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
function fxMyInvitation(loginedCustomer) {
	$.ajax({
		url:"${contextPath}/manageTeam/myInvitation"
		,method:"POST"
			//{memberNo : ${sessionScope.loginInfo},
		,data : {memberNo : loginedCustomer,
            ${_csrf.parameterName} : '${_csrf.token}'}
		,success:function(projects){
			let $tableHead = $(".table-head");
			let $thPurpose = $tableHead.find(".purposeOrName");
			$thPurpose.html("목적");
			let sectionData = "";
			projects.forEach(function(project, pIndex){
				let recruits = project.recruits;
				recruits.forEach(function(recruit, rIndex){
					recruit.members.forEach(function(member, mIndex){
						if(member.customer.customerNo == 101) {
							sectionData += '<div class="table-row bg-white">';
							sectionData += '<div class="recruit_no" style="display:none;">'+ recruit.recruitNo +'</div>';
							sectionData += '<div class="title">' + project.title + '</div>';
							sectionData += '<div class="member_no" style="display:none;">'+ 101 +'</div>';
							sectionData += '<div class="purpose">' + project.purpose + '</div>';
							sectionData += '<div class="position">' + recruit.position.name + '</div>';
							let date = new Date(recruit.deadline);
							sectionData += '<div class="deadline">' + date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate() + '</div>';
							if(recruit.recruitStatus==1){
								sectionData += '<div class="status">모집중</div>';
							} else {
								sectionData += '<div class="status">마감</div>';
							}
							sectionData += '<div class="button text-center">';
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
function fxInvited(loginedCustomer){
	$.ajax({
		url:"${contextPath}/manageTeam/invited"
		,method:"POST"
			//{managerNo : ${sessionScope.loginInfo},
		,data: {managerNo : loginedCustomer,
			${_csrf.parameterName} : '${_csrf.token}'}
		,success:function(projects){
			let $tableHead = $(".table-head");
			let $thPurpose = $tableHead.find(".purposeOrName");
			$thPurpose.html("이름");
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
		url:"${contextPath}/manageTeam/applied"
		,method:"POST"
			//{managerNo : ${sessionScope.loginInfo},
		,data: {managerNo : loginedCustomer,
			${_csrf.parameterName} : '${_csrf.token}'}
		,success:function(projects){
			let $tableHead = $(".table-head");
			let $thPurpose = $tableHead.find(".purposeOrName");
			$thPurpose.html("이름");
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
		url:"${contextPath}/manageTeam/deny"
		,method:"POST"
		,data : { recruitNo : recruitNo,
				memberNo : memberNo,
	            ${_csrf.parameterName} : '${_csrf.token}'}
		,success:function(result){
			if(result=="success"){
				alert(question + "되었습니다.");
			}
		}
	});
}

//수락하기
function allow(recruitNo, memberNo){
	$.ajax({
		url:"${contextPath}/manageTeam/allow"
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

//새 창으로 모집글 상세보기 페이지 열기
function fxRecruitDetail(recruitNo){
	window.open("about:blank", "winName");
	let form = document.recruitForm;
	form.action = "${contextPath}/rec_detail";
	form.target = "winName";
	$(form).find("input[name=recNo]").val(recruitNo);
	form.submit();
}

//새 창으로 멤버 상세보기 페이지 열기
function fxMemberDetail(memberNo){
	window.open("about:blank", "winName");
	let form = document.memberForm;
	form.action = "${contextPath}/member_recruit";
	form.target = "winName";
	$(form).find("input[name=customerNo]").val(memberNo);
	form.submit();
}
</script>
</body>

</html>