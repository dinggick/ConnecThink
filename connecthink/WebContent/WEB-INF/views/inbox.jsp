<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>메세지함</title>
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
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->

	<style>
.inbox_area {
	background: #F5F7FA;
}
.inbox_container {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}
.fromWho {
	background-color: #fff;
	height: 700px;
	overflow: hidden;
}
.searchWho {
	padding-top: 10px;
	padding-bottom: 20px;
	background-color: #38a4ff;
}
.manageMsgBtn {
	color: #fff;
	width: 50%;
	height: 50px;
	background: none;
	border: none;
}
.searchWhoBar .icon {
    position: absolute;
    right: 20px;
    top: 60px;
    line-height: 40px;
    z-index: 3;
}
.searchWhoBar .single-input {
    padding-right: 45px;
}
.list_wrap {
	max-height: 504px;
	overflow: auto;
}
ul.list>li {
    border-bottom: 1px solid #f0e9ff;
    transition: all 0.3s ease 0s;
    padding-bottom: 12px;
    text-align: center;
}
.system {
	width: 100%;
	background-color: #E0F2F7;
	text-align: center;
	font-weight: 500;
	font-size: 1.5em;
	padding: 20px 0px 20px 0px;
	cursor: pointer;
	transition: all 0.3s ease 0s;
}
.person {
	font-size: 1.2em;
	padding: 20px 0px 20px 0px;
	cursor: pointer;
	transition: all 0.3s ease 0s;
}
.new {
	color: #fff;
	background: #ff5e13;
	border-radius: 20px;
	font-size: 0.8em;
	margin-left: 10px;
	padding: 5px;
}
.message {
	height: 700px;
	background-color: #fff;
	box-shadow: 0px 10px 20px 0px rgba(221, 221, 221, 0.3);
}
.msg_header {
	position: absolute;
    top: 0;
    right: 0;
    left: 0;
    z-index: 5;
    padding: 28px 0 28px 14px;
    border-bottom: 1px solid #dfe1e2;
    background-color: rgba(256,256,256,0.95);
}
.msg_sender>img {
	height: 50px;
}
.message .content {
	height: 560px;
}
.msg_body {
	height: 100%;
	padding-top: 130px;
	overflow: auto;
}
.receive_msg, .send_msg {
	display:inline-block;
	border-radius: 50px;
	padding: 15px;
	font-size: 1em;
	margin-bottom: 15px;
	max-width: 80%;
}
.receive_msg {
	float: left;
	border: 1px solid #E6E6E6;
	background-color: #E6E6E6;
	margin-left: 30px;
}
.send_msg {
	float: right;
	border: 1px solid #00D363;
	background-color: #00D363;
	color: #fff;
	margin-right: 30px;
}
.message .send {
	height: 120px;
	padding-bottom: 20px;
}
.writeMsg{
	width: 85%;
	padding: 20px;
}
.sendMsg {
	width: 15%;
	padding: 20px 20px 20px 0px;
}
.send-btn {
	width: 100%;
	height: 100%;
	color: #ff5e13;
	background-color: #fff;
	border: 1px solid #ff5e13;
	border-radius: 5px;
	text-align: center;
	text-decoration: none;
	font-weight: 500;
	cursor: pointer;
	transition: all 0.3s ease 0s;
	padding: 8px 20px 8px 20px;
}
.send-btn:hover {
	color: #fff;
	background: #ff5e13;
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
        <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    </header>
    <!-- header-end -->

    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_1">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="bradcam_text">
                        <h3>메세지함</h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/ bradcam_area  -->


    <!--================inbox Area =================-->
    <section class="inbox_area section-padding">
        <div class="container">
            <div class="row">
                <div class="col-3 fromWho">
                	<div class="row">
                	<div class="col-12 searchWho">
                		<button class="manageMsgBtn">모두 읽음</button><button class="manageMsgBtn">삭제하기</button>
                		<div class="searchWhoBar">
                			<div class="icon"><i class="fa fa-search" aria-hidden="true"></i></div>
							<input type="text" name="who" placeholder="대화 상대 검색" onfocus="this.placeholder = ''"
								onblur="this.placeholder = '대화 상대 검색'" required class="single-input">
						</div>
                	</div>
                	</div>
                    <div class="row">
                    	<div class="system">커넥띵크 알림<a href="#" class="new">1</a></div>
                    	<div class="col-12 list_wrap">
                    		<ul class="list cat-list">
                    			<li class="person">고디바<a href="#" class="new">7</a></li>
                    			<li class="person">길리안<a href="#" class="new">3</a></li>
                    			<li class="person">로이스<a href="#" class="new"></a></li>
                    			<li class="person">페레로로쉐<a href="#" class="new"></a></li>
                    			<li class="person">허쉬<a href="#" class="new"></a></li>
                    			<li class="person">가나<a href="#" class="new"></a></li>
                    			<li class="person">토블론<a href="#" class="new"></a></li>
                    			<li class="person">엠앤엠<a href="#" class="new"></a></li>
                    			<li class="person">ABC<a href="#" class="new"></a></li>
                    		</ul>
                    	</div>
                    </div>
                </div>
                <div class="col-9 mb-5 mb-lg-0">
                    <div class="row">
                    	<div class="col-12 message">
                    		<div class="row">
                    			<div class="col-12 content">
                    			    <div class="msg_header">
                    					<div class="msg_sender">
                    						<img src="img/person.png"><span>고디바</span>
                    					</div>
                    				</div>
                    				<div class="msg_body">
                    					<div class="receive_msg">안녕하세요 저는 고디바라고 합니다 잘 부탁 드립니다.</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">안녕하세요! 저는 출출이예요!</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">배고프다 ㅎ</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">스크롤 테스트</div>
                    					<div style="clear:both;"></div>
                    					<div class="send_msg">가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트 가로 테스트</div>
                    					<div style="clear:both;"></div>
                    				</div>
                    			</div>
                    			<div class="col-12 send">
                    				<div class="row">
                    				<div class="writeMsg">
                    					<textarea class="single-textarea" placeholder="Message" onfocus="this.placeholder = ''"
													onblur="this.placeholder = 'Message'" required></textarea>
                    				</div>
                    				<div class="sendMsg">
                    					<button class="send-btn">전송</button>
                    				</div>
                    				</div>
                    			</div>
                    		</div>
                    	</div>
                    </div>
				</div>
            </div>
        </div>
    </section>
    <!--================Blog Area =================-->

    <!-- footer start -->
    <footer class="footer">
		<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    </footer>
    <!--/ footer end  -->


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
    </script>
</body>
</html>