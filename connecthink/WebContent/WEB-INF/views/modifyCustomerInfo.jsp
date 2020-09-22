<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

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
    <style>
    	li::before {
    		content : unset !important;
    	}
    	
    	.position, .position11, .position21 , .position31 {
	height: 60px !important;
	border: 1px solid #E8E8E8 !important;
	width: 100% !important;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	margin-bottom: 20px;
	font-size: 1em !important;
	padding-top: 10px !important;
}

.position .option {
		padding-right: 16em !important;
	}
	
.position11 .option {
		padding-right: 11.5em !important;
	}
		
.position21 .option {
		padding-right: 13em !important;
	}

.position31 .option {
		padding-right: 12.5em !important;
	}

    </style>
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
                <div class="col-lg-10">
                    <div class="job_details_header">
                        <div class="single_jobs white-bg d-flex justify-content-between">
                            <div class="jobs_left d-flex align-items-center">
                                <!-- profile img -->
                                <div class="thumb">
                                    <img src="img/svg_icon/1.svg" alt="">
                                    <input type="file" name="profile_img" hidden>
                                </div>
                                <div class="jobs_conetent">
                                    <!-- user name -->
                                    <a href="#">
                                        <h4>사람 이름</h4>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="apply_job_form white-bg ">
                        <form action="# " role="form ">
                        	<div class="row">
                        		<%-- 비밀번호 --%>
                        		<div class="col-md-2">
                        			<h5 class="mt-3" style="font-weight: bold;">비밀번호</h5>
                        		</div>
                        		<div class="col-md-10">
                        			<div class="input_field">
                        				<input type="password" name="password" placeholder="비밀번호 ">
                        			</div>
                        		</div>
                        		<%-- 한 줄 소개 --%>
                        		<div class="col-md-2">
                        			<h5 class="mt-3" style="font-weight: bold;">한 줄 소개</h5>
                        		</div>
                        		<div class="col-md-10">
                        			<div class="input_field">
                        				<input type="text" name="about" placeholder="한 줄 소개 ">
                        			</div>
                        		</div>
                        		<%-- 졸업 여부 --%>
                        		<div class="col-md-2">
                        			<h5 class="mt-3" style="font-weight: bold;">졸업 여부</h5>
                        		</div>
                        		<div class="col-md-10">
                        			<div class="input_field">
	                                    <select name="graduation" class="position">
	                                        <option value="1">미졸업</option>
	                                        <option value="2">졸업</option>
	                                    </select>
                                	</div>
                        		</div>
                        		<%-- 역할군 --%>
                        		<div class="col-md-2">
                        			<h5 class="mt-3" style="font-weight: bold;">역할군</h5>
                        		</div>
								<div class="col-md-4">
									<div class="input_field position0">
										<select name="position0" class="position" required>
											<option selected disabled hidden style='display: none' value=''>직군선택</option>
											<option value="1">기획자</option>
											<option value="2">디자이너</option>
											<option value="3">개발자</option>
										</select>
									</div>
								</div>
								<div class="col-md-4">
									<div class="input_field position_div_second" style="display: none;">
										
									</div>
								</div>
								<div class="col-md-2">
									<a class="boxed-btn3 addPositionBtn"><i class="gj-icon plus"></i></a>
								</div>
								<%-- 경험 --%>
								<div class="col-md-2">
									<h5 class="mt-3" style="font-weight: bold;">경험</h5>
								</div>
								<div class="col-md-4">
									<div class="input_field">
                        				<input type="text" name="explain" placeholder="설명 ex)공모전 참여, 프로젝트 수행">
                        			</div>
								</div>
								<div class="col-md-4">
									<div class="input_field">
                        				<input type="text" name="term" placeholder="기간 ex)2019/01 ~ 2020/01">
                        			</div>
								</div>
								<div class="col-md-2">
									<a class="boxed-btn3 addExpBtn"><i class="gj-icon plus"></i></a>
								</div>
                        	</div>
                            <div class="single_wrap" style="text-align: right;">
                                <a href="#" class="genric-btn info-border">수정</a>
                                <a href="#" class="genric-btn danger-border">취소</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer start -->
    <footer class="footer ">
        <jsp:include page="footer.jsp"></jsp:include>
    </footer>
    <!--/ footer end  -->

    <!-- link that opens popup -->
    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js "></script>
    <script src="js/vendor/jquery-1.12.4.min.js "></script>
    <script src="js/popper.min.js "></script>
    <script src="js/bootstrap.min.js "></script>
    <script src="js/owl.carousel.min.js "></script>
    <script src="js/isotope.pkgd.min.js "></script>
    <script src="js/ajax-form.js "></script>
    <script src="js/waypoints.min.js "></script>
    <script src="js/jquery.counterup.min.js "></script>
    <script src="js/imagesloaded.pkgd.min.js "></script>
    <script src="js/scrollIt.js "></script>
    <script src="js/jquery.scrollUp.min.js "></script>
    <script src="js/wow.min.js "></script>
    <script src="js/nice-select.min.js "></script>
    <script src="js/jquery.slicknav.min.js "></script>
    <script src="js/jquery.magnific-popup.min.js "></script>
    <script src="js/plugins.js "></script>
    <script src="js/gijgo.min.js "></script>



    <!--contact js-->
    <script src="js/contact.js "></script>
    <script src="js/jquery.ajaxchimp.min.js "></script>
    <script src="js/jquery.form.js "></script>
    <script src="js/jquery.validate.min.js "></script>
    <script src="js/mail-script.js "></script>


    <script src="js/main.js "></script>

    <script>
	    function position(obj){
	    	console.log(obj);
			if(obj.value == 1){
				$position = $(obj).parent().parent().next().find(".position_div_second");
				$position.html(`<select class="position" name="position" onchange="position_p(this);">
									<option selected disabled hidden style='display: none' value=''>직무선택</option>
									<option value="1">사업기획자</option>
									<option value="2">컨텐츠기획자</option>
									<option value="3">기획자</option>
									<option value="4">마케터</option>
									<option value="5">서비스운영자</option>
									<option value="6">마케팅</option>
									<option value="7">상품기획자</option>
									<option value="8">모바일서비스기획자</option>
								</select>`);
				$position.css("display","block");
				$("select").niceSelect();
			} else if(obj.value == 2) {
				$position = $(obj).parent().parent().next().find(".position_div_second");
				$position.html(`<select class="position" name="position" onchange="position_ds(this);">
									<option selected disabled hidden style='display: none' value=''>직무선택</option>
									<option value="9">디자이너</option>
									<option value="10">UI/UX디자이너</option>
									<option value="11">그래픽디자이너</option>
									<option value="12">웹 디자이너</option>
									<option value="13">영상디자이너</option>
									<option value="14">산업디자이너</option>
									<option value="15">일러스트레이터</option>
									<option value="16">모바일 디자이너</option>
								</select>`);
				$position.css("display","block");
				$("select").niceSelect();
			} else if(obj.value == 3) {
				$position = $(obj).parent().parent().next().find(".position_div_second");
				$position.html(`<select class="position" name="position" onchange="position_dv(this);">
									<option selected disabled hidden style='display: none' value=''>직무선택</option>
									<option value="17">개발자</option>
									<option value="18">백엔드 개발자</option>
									<option value="19">웹개발자</option>
									<option value="20">프로트엔드개발자</option>
									<option value="21">안드로이드개발자</option>
									<option value="22">IOS</option>
									<option value="23">임베디드 개발자</option>
									<option value="24">DB 개발자</option>
								</select>`);
				$position.css("display","block");
				$("select").niceSelect();
			} 
		}
	    
		function position_p(obj){
			alert(obj.value);
		}
		
		function position_ds(obj){
			alert(obj.value);
		}
		
		function position_dv(obj){
			alert(obj.value);
		}
    	$(() => {
    		//역할군 추가 및 삭제
	        $(".apply_job_form").on("click", ".addPositionBtn", function(e) {
                var new_inputs = `<div class="col-md-4 offset-2">
	    							<div class="input_field position0">
	    								<select name="position0" class="position" required>
	    									<option selected disabled hidden style='display: none' value=''>직군선택</option>
	    									<option value="1">기획자</option>
	    									<option value="2">디자이너</option>
	    									<option value="3">개발자</option>
	    								</select>
	    							</div>
	    						</div>
	    						<div class="col-md-4">
	    							<div class="input_field position_div_second" style="display: none;">
	    								
	    							</div>
	    						</div>
	    						<div class="col-md-2">
	    							<a class="boxed-btn3 addPositionBtn"><i class="gj-icon plus"></i></a>
	    						</div>`;
                $(this).parent().after(new_inputs);
                $(this).removeClass("addPositionBtn").addClass("removePositionBtn");
                $(this).find("i").removeClass("plus").addClass("minus");
                $('select').niceSelect();
            }).on("click", ".removePositionBtn", function(e) {
                var $btnCol = $(this).parent();
                $btnCol.prev().remove();
                $btnCol.prev().remove();
                console.log($btnCol.prev().children());
                if($btnCol.prev().children().hasClass("mt-3")) $btnCol.next().removeClass("offset-2");
                $btnCol.remove();
            });
    		//직군 선택 시 직무 select box 생성
    		$(".apply_job_form").on("change", "select.position", function(e) {
    			position(e.target);
    		});

            //경험 추가 및 삭제
    		$(".apply_job_form").on("click", ".addExpBtn", function(e) {
                var new_inputs = `<div class="col-md-4 offset-2">
									<div class="input_field">
					    				<input type="text" name="explain" placeholder="설명 ex)공모전 참여, 프로젝트 수행">
					    			</div>
								</div>
								<div class="col-md-4">
									<div class="input_field">
					    				<input type="text" name="term" placeholder="기간 ex)2019/01 ~ 2020/01">
					    			</div>
								</div>
								<div class="col-md-2">
									<a class="boxed-btn3 addExpBtn"><i class="gj-icon plus"></i></a>
								</div>`;
                $(this).parent().after(new_inputs);
                $(this).removeClass("addExpBtn").addClass("removeExpBtn");
                $(this).find("i").removeClass("plus").addClass("minus");
            }).on("click", ".removeExpBtn ", function(e) {
            	var $btnCol = $(this).parent();
                $btnCol.prev().remove();
                $btnCol.prev().remove();
                if($btnCol.prev().children().hasClass("mt-3")) $btnCol.next().removeClass("offset-2");
                $btnCol.remove();
            });
            
			//프로필 클릭시 사진 업로드
            $(".thumb").on("click", "img", function(e) {
                $(this).next().trigger("click");
            });
    	});
    </script>
</body>

</html>