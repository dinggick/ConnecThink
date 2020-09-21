<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
div.table-head>div {
	color: #415094;
	line-height: 40px;
	font-weight: 500;
}
div.table-row>div {
	font-size: 1em;
}
div.index {
	width: 7%;
}
div.title {
	width: 31%;
}
div.purposeOrName {
	width: 13%;
}
div.position {
	width: 13%;
}
div.deadline {
	width: 11%;
}
div.status {
	width: 6%;
}
div.button {
	width: 19%; 
}
div.table-row>div.title:hover {
	color: #00D363;
	transition: 0.3s;
	cursor: pointer;
}
.table-head>:first-child, .table-row>:first-child {
	padding-left:10px;
}
.manage-bnt-allow {
	color: #38a4ff;
	border: 1px solid #38a4ff;
	border-radius: 20px;
	text-align: center;
	text-decoration: none;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease 0s;
	padding: 8px 20px 8px 20px;
}

.manage-bnt-allow:hover {
	color: #fff;
	background: #38a4ff;
	border: 1px solid transparent;
}
.manage-bnt-deny {
	color: #f44a40;
	border: 1px solid #f44a40;
	border-radius: 20px;
	text-align: center;
	text-decoration: none;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease 0s;
	padding: 8px 20px 8px 20px;
}

.manage-bnt-deny:hover {
	color: #fff;
	background: #f44a40;
	border: 1px solid transparent;
}
/* style.css 추가 할 부분 끝 */
    </style>
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
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
							<div class="index">#</div>
							<div class="title">프로젝트 명</div>
							<div class="purposeOrName">목적</div>
							<div class="position">직무</div>
							<div class="deadline">마감일</div>
							<div class="status">상태</div>
							<div class="button text-center">관리</div>
						</div>
						<div class="table-row bg-white">
							<div class="index">0</div>
							<div class="recruit_no" style="display:none;"></div>
							<div class="title">프로젝트 이름 예시1</div>
							<div class="purposeOrName">공모전 참여</div>
							<div class="position">웹 개발자</div>
							<div class="deadline">2020.10.10</div>
							<div class="status">모집중</div>
							<div class="button text-center">
								<a href="#" class="manage-bnt-allow" style="margin-right: 10px;">수락</a>
								<a href="#" class="manage-bnt-deny">거절</a>
							</div>
						</div>
						<div class="table-row bg-white">
							<div class="index">2</div>
							<div class="title">매드포갈릭 스테이크를 먹고싶어</div>
							<div class="purposeOrName">포트폴리오</div>
							<div class="position">영상 디자이너</div>
							<div class="deadline">2020.12.25</div>
							<div class="status">모집중</div>
							<div class="button text-center">
								<a href="#" class="manage-bnt-allow" style="margin-right: 10px;">수락</a>
								<a href="#" class="manage-bnt-deny">거절</a>
							</div>
						</div>
                    </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="pagination_wrap">
                        <ul>
                            <li><a href="#"> <i class="ti-angle-left"></i> </a></li>
                            <li><a href="#"><span>01</span></a></li>
                            <li><a href="#"><span>02</span></a></li>
                            <li><a href="#"> <i class="ti-angle-right"></i> </a></li>
                        </ul>
                    </div>
                </div>
            </div>
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
//a 링크 눌러도 아무 동작 없게 만들기
let manageBtnArray = document.querySelectorAll("div.button>a");
manageBtnArray.forEach(function(element){
	element.addEventListener("click", function(e){
	    e.preventDefault();
	});
});

//메뉴 버튼 누르면 바탕 색 바뀌기 + 내용 지웠다 다시 쓰기
let $menuBtnArray = $("div.manageMenu>button");
$menuBtnArray.each(function(i){
	$(this).click(function(e){
		
		//바탕 색 바뀌기
		$menuBtnArray.css("background-color","#f9f9ff");
		$(this).css("background-color","#fff");
		
		//table row 제거하기
		let $tableRowArray = $("div.table-row");
		$tableRowArray.each(function(index, tr){
			if(index>0){
				tr.remove();
			}
		});
		
		//ajax로 데이터 불러와서 table row 다시 쓰기
		//내가 지원한 팀
		if ($(this).attr("id") == "myApplication"){
			$.ajax({
				url:"${contextPath}/manageMyApplication"
				,method:"POST"
				,data:"memberNo=102"
			 	,success:function(projects){
			 		let $tableHead = $("div.table-head");
			 		let $thPurpose = $tableHead.find("div.purposeOrName");
			 		$thPurpose.html("목적");
					let $tableRow = $("div.table-row");
					projects.forEach(function(project, index){
						let recruits = project.recruits;
						recruits.forEach(function(recruit, index){
							let $clone = $tableRow.clone();
							$tableRow.after($clone);
							$clone.find("div.index").html(index + 1);
							$clone.find("div.recruit_no").html(recruit.recruitNo);
							$clone.find("div.title").html(project.title);
							$clone.find("div.purposeOrName").html(project.purpose);
							$clone.find("div.position").html(recruit.position.name);
							let date = new Date(recruit.deadline);
							$clone.find("div.deadline").html(date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate());
							if(recruit.recruitStatus==1){
								$clone.find("div.status").html("모집중");
							} else {
								$clone.find("div.status").html("모집마감");
							}
						});
					});
 					$tableRow.remove();
				}
			});
		}
		//초대 받은 팀
		else if ($(this).attr("id") == "myInvitaion") {
			$.ajax({
				url:"${contextPath}/manageMyInvitation"
				,method:"POST"
				,data:"memberNo=161"
			 	,success:function(projects){
			 		let $tableHead = $("div.table-head");
			 		let $thPurpose = $tableHead.find("div.purposeOrName");
			 		$thPurpose.html("목적");
					let $tableRow = $("div.table-row");
					projects.forEach(function(project, index){
						let recruits = project.recruits;
						recruits.forEach(function(recruit, index){
							let $clone = $tableRow.clone();
							$tableRow.after($clone);
							$clone.find("div.index").html(index + 1);
							$clone.find("div.recruit_no").html(recruit.recruitNo);
							$clone.find("div.title").html(project.title);
							$clone.find("div.purposeOrName").html(project.purpose);
							$clone.find("div.position").html(recruit.position.name);
							let date = new Date(recruit.deadline);
							$clone.find("div.deadline").html(date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate());
							if(recruit.recruitStatus==1){
								$clone.find("div.status").html("모집중");
							} else {
								$clone.find("div.status").html("모집마감");
							}
						});
					});
					$tableRow.remove();
				}
			});
		}
		//내가 초대한 멤버
		else if ($(this).attr("id") == "invitedMember") {
			$.ajax({
				url:"${contextPath}/manageInvited"
				,method:"POST"
				,data:"managerNo=2"
			 	,success:function(projects){
			 		let $tableHead = $("div.table-head");
			 		let $thName = $tableHead.find("div.purposeOrName");
			 		$thName.html("이름");
					let $tableRow = $("div.table-row");
					console.log($tableRow.html());
					projects.forEach(function(project, index){
						let recruits = project.recruits;
						recruits.forEach(function(recruit, index){
							let members = recruit.members;
							members.forEach(function(member, index){
								let $clone = $tableRow.clone();
								$tableRow.after($clone);
								$clone.find("div.index").html(index + 1);
								$clone.find("div.recruit_no").html(recruit.recruitNo);
								$clone.find("div.title").html(project.title);
								$clone.find("div.purposeOrName").html(member.customer.name);
								$clone.find("div.position").html(recruit.position.name);
								let date = new Date(recruit.deadline);
								$clone.find("div.deadline").html(date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate());
								if(recruit.recruitStatus==1){
									$clone.find("div.status").html("모집중");
								} else {
									$clone.find("div.status").html("모집마감");
								}
							});
						});
					});
					$tableRow.remove();
				}
			});
		}
		//우리 팀에 지원한 멤버
		else if ($(this).attr("id") == "appliedMember") {
			$.ajax({
				url:"${contextPath}/manageApplied"
				,method:"POST"
				,data:"managerNo=2"
			 	,success:function(projects){
			 		let $tableHead = $("div.table-head");
			 		let $thName = $tableHead.find("div.purposeOrName");
			 		$thName.html("이름");
					let $tableRow = $("div.table-row");
					console.log($tableRow.html());
					projects.forEach(function(project, index){
						let recruits = project.recruits;
						recruits.forEach(function(recruit, index){
							let members = recruit.members;
							members.forEach(function(member, index){
								let $clone = $tableRow.clone();
								$tableRow.after($clone);
								$clone.find("div.index").html(index + 1);
								$clone.find("div.recruit_no").html(recruit.recruitNo);
								$clone.find("div.title").html(project.title);
								$clone.find("div.purposeOrName").html(member.customer.name);
								$clone.find("div.position").html(recruit.position.name);
								let date = new Date(recruit.deadline);
								$clone.find("div.deadline").html(date.getFullYear()+"."+(date.getMonth()+1)+"."+date.getDate());
								if(recruit.recruitStatus==1){
									$clone.find("div.status").html("모집중");
								} else {
									$clone.find("div.status").html("모집마감");
								}
							});
						});
					});
					$tableRow.remove();
				}
			});
		}
		//기본 이벤트, 이벤트 전파 막기
		return false;
	});
});

</script>
</body>

</html>