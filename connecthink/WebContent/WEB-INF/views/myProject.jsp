<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>나의 프로젝트</title>
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
	padding-left:20px;
	padding-right: 5px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.purpose, .theme, .position, .status, .deadline {
   width: 16%;
}
.status, .deadline {
   width: 12%;
}
.manageMember {
   width: 20%;
    text-align: center;
}
.memberAbout {
   width: 40%;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}
.memberName, .memberPosition {
   width: 20%;
   padding-left: 40px;
}
.table-row>.memberName, .table-row>.memberPosition {
   width: 20%;
   transition: all 0.2s ease 0s;
   cursor: pointer;
}
.table-row>.memberName:hover, .table-row>.memberPosition:hover {
   color: #00D363;
}
.manageMemberDto {
   width: 20%;
   text-align: center;
}
.projectNo, .memberNo, .recruitNo {
   display:none;
}
.title>span:hover, .table-row>.name:hover, .projectTitle:hover {
   color: #00D363;
   transition: 0.3s;
   cursor: pointer;
}
.table-row>:last-child {
   overflow: visible;
}
.manage-bnt, .goSpaceBtn {
   border-radius: 20px;
   text-align: center;
   text-decoration: none;
   font-weight: 500;
   cursor: pointer;
   transition: all 0.2s ease 0s;
   padding: 8px 20px 8px 20px;
}
.goSpaceBtn {
  border: 1px solid #DADADA;
}
.goSpaceBtn:hover {
  background-color: #DADADA;
}
.manageInvited, .manageApplied {
   width: 50%;
   font-size: 0.9em;
   padding: 8 8 8 8;
   text-align: center;
   text-decoration: none;
   cursor: pointer;
   transition: all 0.2s ease 0s;
}
.manageInvited:hover, .manageApplied:hover {
   color: #f44a40;
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
.showMember {
  border: 1px solid #000;
  width: 100%;
  display: none;
  overflow: hidden;
  padding: 10px 0px 10px 0px;
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
                    <button class="genric-btn default radius myProject" style="background-color:#fff;" onclick="myProject();">내가 등록한 프로젝트</button>
                    <button class="genric-btn default radius lookUpmyProject" onclick="lookUpmyProject();">내가 속해있는 프로젝트</button>
                    <button id="myApplication" class="genric-btn default radius" onclick="fxMyApplication();">내가 지원한 프로젝트</button>
                    <button id="myInvitaion" class="genric-btn default radius" onclick="fxMyInvitation();">초대받은 프로젝트</button>
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
                     <div class="manageMember text-center">이 프로젝트에 초대/지원한 회원</div>
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
    <form name="goSpaceForm" action="${contextPath}/logined/board" method="post">
		<input type="hidden" name="project_no" value="0">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
   
   
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
	
	//a 태그 클릭 시 기본 이벤트 막기
	$section.on("click", "a", function(e){
		return false;
	});
	
	//관리버튼 클릭
	$section.on("click", "a.manage-bnt", function(e){
		let tableRow = this.parentNode.parentNode;
		let recruitNo = $(tableRow).find(".recruitNo").html();
		let memberNo = $(tableRow).find(".memberNo").html();
		let projectName = $(tableRow).find(".title").text();
		let managerNo = typeof($(tableRow).find(".managerNo").val()) != 'undefined' ? $(tableRow).find(".managerNo").val() : 0;
		
		
		//내 지원 취소하기 / 지원한 사람 거절하기 / 초대 취소하기 / 초대 거절하기
		if ($(this).attr("class").search("deny") > 0) {
			let denyConfirm = confirm("정말 " + this.innerHTML + "하시겠습니까?");
			if(denyConfirm==1){
				deny(recruitNo, memberNo, this.innerHTML);
	 			$(this.parentNode.parentNode).remove();
			}
		}
		//지원목록 수락하기 / 초대 수락하기
		else if ($(this).attr("class").search("allow") > 0) {	
			var isInvite = "지원";
			let allowConfirm = confirm("정말 수락하시겠습니까?");
			if(allowConfirm==1){
				if ($(this).attr("class").search("allow-my-invi") > 0) {
					isInvite = "초대";
				} 				
				allow(recruitNo, memberNo, isInvite, managerNo, projectName);
			}
		}
	});
	
	//클릭 시 프로젝트 상세 페이지로 이동
	function projectDetail(e){
		let $projectNo = $(e).siblings("div.projectNo").html();
		let url = "${contextPath}/logined/project_detail?projectNo=" + $projectNo ;
		location.href = url;
	}
	
	//클릭 시 모집 상세 페이지로 이동
	function recruitDetail(e){
		let $recNo = $(e).siblings(".recruitNo").html();
		let url = "${contextPath}/all/rec_detail?recNo=" + $recNo;
		window.open(url,"_blank", "height=800, width=800");
	}
	
	//새 창으로 멤버 상세보기 페이지 열기
	function memberDetail(e) {
		if(loginedCustomer == ""){
			alert("로그인 후 사용 가능 합니다");
		} else {
			let $cNo = $(e).siblings(".memberNo").html();
			let url = "${contextPath}/logined/customer_detail?customerNo="+$cNo;
			window.open(url,"_blank", "height=800, width=800");
		}
	}
	
	//프로젝트 스페이스로 이동
	function goSpace(projectNo) {
		let form = document.goSpaceForm;
		$(form).find("input[name=project_no]").val(projectNo);
		form.submit();
	}
	
	//내가 등록한 프로젝트 불러오기
	function myProject() {
		$.ajax({
			url : "${contextPath}/logined/myTeam",
			method : "POST",
			data : {${_csrf.parameterName} : '${_csrf.token}'},
			success : function(projects) {
				$manageInTHead.html("이 프로젝트에 초대/지원한 회원");
				$purposeOrPositionInTHead.html("목적");
				$statusOrdeadlineInTHead.html("상태");
				let data = "";
				//forEach
				let size = projects.length;
				if (size > 0) {
					projects.forEach(function(project, index) {
						data += '<div class="table-row bg-white">';
						data += '<div class="projectNo">'+ project.projectNo +'</div>';
						data += '<div class="title projectTitle" onclick="projectDetail(this);">' + project.title + '</div>';
						data += '<div class="purpose">'+ project.purpose +'</div>';
						data += '<div class="theme">'+ project.theme +'</div>';
						if(project.projectStatus == 1){
							data += '<div class="status">진행중</div>';
						} else {
							data += '<div class="status">종료</div>';
						}
						data += '<div class="manageMember text-center">';
						data += '<a href="#" class="manageInvited ctrl" onclick="findInvited(this,' + project.projectNo + ');" style="margin-right: 10px;">초대목록 ▼</a>';
						data += '<a href="#" class="manageApplied ctrl" onclick="findApplied(this,' + project.projectNo + ');">지원목록 ▼</a></div></div>';
						data += '<div class="showMember invitedMember progress-table bg-white">-</div>';
						data += '<div class="showMember appliedMember progress-table bg-white">-</div>';
					});
				} else {
					data += "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>등록한 프로젝트가 없습니다.</div>";
				}
				$section.html(data);
			}
		});
	}
	
	//내가 속해있는 프로젝트 불러오기
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
						data += '<div class="title projectTitle" onclick="projectDetail(this);">' + project.title + '</div>';
						data += '<div class="purpose">'+ project.purpose +'</div>';
						data += '<div class="theme">'+ project.theme +'</div>';
						if(project.projectStatus == 1){
							data += '<div class="status">진행중</div>';
						} else {
							data += '<div class="status">종료</div>';
						}
						data += '<div class="manageMember">';
						data += '<a href="#" class="goSpaceBtn" onclick="goSpace(' + project.projectNo + ');">스페이스 가기</a></div></div>';
					});
				} else {
					data += "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>내가 속한 프로젝트가 없습니다.</div>";
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
				if(projects.length > 0) {
					projects.forEach(function(project, pIndex){
						sectionData += '<div class="table-row bg-white">';
						sectionData += '<div class="projectNo">'+ project.projectNo +'</div>';
						sectionData += '<div class="title">' + '<span onclick="projectDetail(this.parentNode);">' + project.title ;
						sectionData += '</span> - <span onclick="recruitDetail(this.parentNode);">' + project.requirement + '</span></div>';
						sectionData += '<div class="memberNo">'+ loginedCustomer +'</div>';
						sectionData += "<div class='recruitNo'>" + project.recruitNo + "</div>";
						sectionData += '<div class="position">' + project.positionName + '</div>';
						sectionData += '<div class="theme">' + project.theme + '</div>';
						let date = new Date(project.deadline);
						console.log(date);
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
						sectionData += '<input type="text" class="managerNo" hidden="hidden" value="'+ project.managerNo + '">';
						sectionData += '<a href="#" class="manage-bnt deny-my-app">취소</a></div></div>';
					});
				} else {
					sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>지원한 프로젝트가 없습니다.</div>";
				}
				$section.html(sectionData);
			}
		});
	}

	//나에게 초대를 보낸 프로젝트 보여주기
	function fxMyInvitation() {
		$.ajax({
			url:"${contextPath}/manageProject/myInvitation"
			,method:"POST"
			,data : {memberNo : ${sessionScope.loginInfo},
	            ${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(projects){
				console.log(projects);
				$manageInTHead.html("초대 관리");
				$purposeOrPositionInTHead.html("역할");
				$statusOrdeadlineInTHead.html("모집마감일");
				let sectionData = "";
				if(projects.length > 0) {
					projects.forEach(function(project, pIndex){
						sectionData += '<div class="table-row bg-white">';
						sectionData += '<div class="projectNo">'+ project.projectNo +'</div>';
						sectionData += '<div class="title">' + '<span onclick="projectDetail(this.parentNode);">' + project.title ;
						sectionData += '</span> - <span onclick="recruitDetail(this.parentNode);">' + project.requirement + '</span></div>';
						sectionData += '<div class="memberNo">'+ loginedCustomer +'</div>';
						sectionData += "<div class='recruitNo'>" + project.recruitNo + "</div>";
						sectionData += '<div class="position">' + project.positionName + '</div>';
						sectionData += '<div class="theme">' + project.theme + '</div>';
						let date = new Date(project.deadline);
						console.log(date);
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
						sectionData += '<input type="text" class="managerNo" hidden="hidden" value="'+ project.managerNo + '">';
						sectionData += '<a href="#" class="manage-bnt allow-my-invi" style="margin-right: 10px;">수락</a>';
						sectionData += '<a href="#" class="manage-bnt deny-my-invi">거절</a></div></div>';
					});
				} else {
					sectionData = "<div style='width:100%; height:100px; line-height:100px; text-align:center;'>초대받은 프로젝트가 없습니다.</div>";
				}
				$section.html(sectionData);
			}
		});
	}
	
	//내가 등록한 프로젝트에 초대받은 사람 관리 섹션 조작
	function findInvited(e, projectNo){
		//지원목록 컨트롤 버튼(지원관리 섹션이 보여지고 있는지 감시하기 위해 필요)
		let appliedCtrl = $(e).next()[0];
		//이 프로젝트에 초대한 사람들을 보여주고 관리할 섹션
		let $invitedSection = $(e.parentNode.parentNode).next();
		//이 프로젝트에 지원한 사람들을 보여주고 관리할 섹션
		let $appliedSection = $(e.parentNode.parentNode).next().next();

		//초대목록 섹션이 보여지고 있을 경우
		if ($(e).hasClass('active')) {
			//active 클래스를 지우고 섹션을 감춘다.
			$(e).removeClass('active');
			$invitedSection.css("display","none");
			e.innerHTML = "초대목록 ▼";
		//초대목록 섹션이 감춰져 있을 경우
		} else {
			//만약 지원목록 섹션이 보여지고 있다면 감춘다.
			if ($(appliedCtrl).hasClass('active')){
				$(appliedCtrl).removeClass('active');
				appliedCtrl.innerHTML = "지원목록 ▼";
				$appliedSection.css("display","none");
			}
			//active 클래스를 추가하고 섹션을 보여준다.
			$(e).addClass('active');
			$invitedSection.css("display","inline-block");
			e.innerHTML = "초대목록 ▲";
			let sectionData = "";
			$.ajax({
				url:"${contextPath}/manageMember/invited"
				,method:"POST"
				,data : { "projectNo" : projectNo,
					${_csrf.parameterName} : '${_csrf.token}'}
				,success:function(members){
					console.log(members);
					if(members.length > 0) {
						sectionData += "<div class='table-head'>";
						sectionData += "<div class='memberName'>이름</div>";
						sectionData += "<div class='memberPosition'>역할</div>";
						sectionData += "<div class='memberAbout'>소개</div>";
						sectionData += "<div class='manageMemberDto'>관리</div>";
						sectionData += "</div>";
						members.forEach(function(member, index){
							console.log(member);
							sectionData += "<div class='table-row'>";
							sectionData += "<div class='memberNo'>" + member.memberNo + "</div>";
							sectionData += "<div class='memberName' onclick='memberDetail(this);'>" + member.memberName + "</div>";
							sectionData += "<div class='recruitNo'>" + member.recruitNo + "</div>";
							sectionData += "<div class='memberPosition' onclick='recruitDetail(this);'>" + member.positionName + "</div>";
							sectionData += "<div class='memberAbout'>" + member.about + "</div>";
							sectionData += "<div class='manageMemberDto'>";
							sectionData += '<a href="#" class="manage-bnt deny-to-invite">취소</a></div>';
							sectionData += "</div>";
						});
					} else {
						sectionData += "<div class='text-center'>이 프로젝트에 초대한 회원이 없습니다.</div>";
					}
					$invitedSection.html(sectionData);
				}
			});
		}
	}
	
	//내가 등록한 프로젝트에 지원한 사람 관리 섹션 조작
	function findApplied(e, projectNo){
		//초대목록 컨트롤 버튼(초대관리 섹션이 보여지고 있는지 감시하기 위해 필요)
		let invitedCtrl = $(e).prev()[0];
		//이 프로젝트에 초대한 사람들을 보여주고 관리할 섹션
		let $invitedSection = $(e.parentNode.parentNode).next();
		//이 프로젝트에 지원한 사람들을 보여주고 관리할 섹션
		let $appliedSection = $(e.parentNode.parentNode).next().next();
		
		//지원목록 섹션이 보여지고 있을 경우
		if ($(e).hasClass('active')) {
			//active 클래스를 지우고 섹션을 감춘다.
			$(e).removeClass('active');
			$appliedSection.css("display","none");
			e.innerHTML = "지원목록 ▼";
		//지원목록 섹션이 감춰져 있을 경우
		} else {
			//만약 초대목록 섹션이 보여지고 있다면 감춘다.
			if ($(invitedCtrl).hasClass('active')){
				$(invitedCtrl).removeClass('active');
				invitedCtrl.innerHTML = "초대목록 ▼";
				$invitedSection.css("display","none");
			}
			//active 클래스를 추가하고 섹션을 보여준다.
			$(e).addClass('active');
			$appliedSection.css("display","inline-block");
			e.innerHTML = "지원목록 ▲";
			let sectionData = "";
			$.ajax({
				url:"${contextPath}/manageMember/applied"
				,method:"POST"
				,data : { "projectNo" : projectNo,
					${_csrf.parameterName} : '${_csrf.token}'}
				,success:function(members){
					console.log(members);
					if(members.length > 0) {
						sectionData += "<div class='table-head'>";
						sectionData += "<div class='memberName'>이름</div>";
						sectionData += "<div class='memberPosition'>역할</div>";
						sectionData += "<div class='memberAbout'>소개</div>";
						sectionData += "<div class='manageMemberDto'>관리</div>";
						sectionData += "</div>";
						members.forEach(function(member, index){
							console.log(member);
							sectionData += "<div class='table-row'>";
							sectionData += "<div class='memberNo'>" + member.memberNo + "</div>";
							sectionData += "<div class='memberName' onclick='memberDetail(this);'>" + member.memberName + "</div>";
							sectionData += "<div class='recruitNo'>" + member.recruitNo + "</div>";
							sectionData += "<div class='memberPosition' onclick='recruitDetail(this);'>" + member.positionName + "</div>";
							sectionData += "<div class='memberAbout'>" + member.about + "</div>";
							sectionData += "<div class='manageMemberDto'>";
							sectionData += "<div class='title' hidden='hidden'>" + projectNo +"</div>";
							sectionData += '<a href="#" class="manage-bnt allow-in" style="margin-right: 10px;">수락</a>';
							sectionData += '<a href="#" class="manage-bnt deny-in">거절</a></div>';
							sectionData += "</div>";
						});
					} else {
						sectionData += "<div class='text-center'>지원자가 없습니다.</div>";
					}
					$appliedSection.html(sectionData);
				}
			});
		}
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
	function allow(recruitNo, memberNo, isInvite, managerNo, projectName){
		console.log(recruitNo + ":"+memberNo+":"+isInvite+":" +managerNo +":" +projectName);
		var notiContent ="";
		var receiver = "";
		if(isInvite == "초대") {
			receiver = managerNo;
			notiContent = memberNo + "님이 " + projectName + "에 " + isInvite +  "수락을 하셨습니다 :)!";	
		} else {
			receiver = memberNo;
			notiContent = "축하드립니다. " +projectName + "번 프로젝트의 팀원이 되셨습니다. 프로젝트 스페이스를 확인해주세요.";			
		}				
		$.ajax({
			url:"${contextPath}/manageMember/allow"
			,method:"POST"
			,data : { recruitNo : recruitNo,
					memberNo : memberNo,
		            ${_csrf.parameterName} : '${_csrf.token}'}
			,success:function(result){
				if(result=="success"){
					alert("수락되었습니다.");
					wSocket.send("connecthinksystem:nto:"+ receiver + ":" + notiContent);
					location.reload();
				}
			}
		});
	}
	</script>
</body>

</html>