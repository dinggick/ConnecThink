<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html>

<head>
    <meta charset="utf-8">
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
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
        <jsp:include page="header.jsp"></jsp:include>
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
            <div class="row" style="justify-content: center;">
                <div class="col-lg-8">
                    <div class="job_details_header">
                        <div class="single_jobs white-bg d-flex justify-content-between">
                            <div class="jobs_left d-flex align-items-center">
                                <!-- profile img -->
                                <div class="thumb">
                                    <img src="img/svg_icon/1.svg" alt="">
                                </div>
                                <div class="jobs_conetent">
                                    <!-- user name -->
                                    <a href="#">
                                        <h4>사람 이름</h4>
                                    </a>
                                    <div class="links_locat d-flex align-items-center">
                                        <!-- position -->
                                        <div class="location">
                                            <p> <i class="fa fa-male"></i> 기획자, 백엔드 개발자</p>
                                        </div>
                                        <!-- graduation status -->
                                        <div class="location">
                                            <p> <i class="fa fa-book"></i> 졸업</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="descript_wrap white-bg">
                    	<!-- email -->
                    	<div class="single_wrap">
                    		<h4>이메일</h4>
                    		<p>jjj1211@hanmir.com</p>
                    	</div>
                    	<!-- birth date -->
                    	<div class="single_wrap">
                    		<h4>생년월일</h4>
                    		<p>1992/12/11</p>
                    	</div>
                        <!-- about -->
                        <div class="single_wrap">
                            <h4>한 줄 소개</h4>
                            <p>한 줄 소개입니다.</p>
                        </div>
                        <!-- experiences -->
                        <div class="single_wrap">
                            <h4>경험</h4>
                            <ul>
                                <li>공모전 1 2019/01 ~ 2020/01</li>
                                <li>공모전 2 2019/02 ~ 2020/02</li>
                                <li>공모전 3 2019/03 ~ 2020/03</li>
                                <li>공모전 4 2019/04 ~ 2020/04</li>
                            </ul>
                        </div>
                        <!-- project history (in connecThink service) -->
                        <div class="single_wrap">
                            <h4>connecThink 프로젝트 경험</h4>
                            <ul>
                                <li>프로젝트 1 2019/01 ~ 2020/01</li>
                                <li>프로젝트 2 2019/02 ~ 2020/02</li>
                                <li>프로젝트 3 2019/03 ~ 2020/03</li>
                                <li>프로젝트 4 2019/04 ~ 2020/04</li>
                            </ul>
                        </div>
                        <div class="single_wrap" style="text-align: right;">
                            <a href="#" class="genric-btn info-border">수정</a>
                            <a href="#" class="genric-btn danger-border">탈퇴</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer start -->
    <footer class="footer">
        <jsp:include page="footer.jsp"></jsp:include>
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
</body>

</html>