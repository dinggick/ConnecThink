<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
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
    </head>
		<jsp:include page="${contextPath}/html/loginModal.html"></jsp:include>
		<jsp:include page="${contextPath}/html/registerModal.html"></jsp:include>
		<jsp:include page="${contextPath}/html/findEmailModal.html"></jsp:include>
		<jsp:include page="${contextPath}/html/findPwdModal.html"></jsp:include>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container-fluid ">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo">
                                    <a href="index.html">
                                        <img src="img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-7">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="index.html">메인홈</a></li>
                                            <li><a href="jobs.html">모집중인 멤버</a></li>
                                           
                                            <li><a href="#">모집중인팀</a></li>
                                            <li><a href="contact.html">진행중인 공모전</a></li>
<!--                                              <li><a href="#"><img class="personicon" src="img/person.png"><i class="ti-angle-down"></i></a> -->
<!--                                                 <ul class="submenu"> -->
<!--                                                     <li><a href="candidate.html">Candidates </a></li> -->
<!--                                                     <li><a href="job_details.html">job details </a></li> -->
<!--                                                     <li><a href="elements.html">elements</a></li> -->
<!--                                                 </ul> -->
<!--                                             </li> -->
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                                <div class="Appointment">
                                	<div class="personMenu">
                                        <a href="#"><img class="personicon" src="img/person.png"></a>
                                         	<ul class="submenu">
                                                    <li><a data-toggle="modal" href="#loginModal">로그인</a></li>
                                                    <li><a data-toggle="modal" href="#registerModal">회원가입</a></li>                                                   
                                            </ul>                                                                               
                                         </div>
                                        <a href="#"><img class="personicon" src="img/bell.png"></a>
							<div class="sidebar">
								<a href="#"><img class="personicon" src="img/pmenu.png" onclick="openNav()"></a>
								<div id="mySidenav" class="sidenav">
									<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> 
										<h4 style="padding-left: 20px;">나의 프로젝트 스페이스</h4>
										<hr>
										<a href="#">프로젝트1</a> 
										<a href="#">프로젝트2</a> 
										<a href="#">프로젝트3</a> 										
								</div>
							</div>
						</div>
                                
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    <!-- header-end -->
<script>

function openNav() {
		 document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	 document.getElementById("mySidenav").style.width = "0";
}

</script>
</html>