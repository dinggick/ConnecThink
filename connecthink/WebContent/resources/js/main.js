(function ($) {
"use strict";
// TOP Menu Sticky
$(window).on('scroll', function () {
	var scroll = $(window).scrollTop();
	if (scroll < 400) {
    $("#sticky-header").removeClass("sticky");
    $('#back-top').fadeIn(500);
	} else {
    $("#sticky-header").addClass("sticky");
    $('#back-top').fadeIn(500);
	}
});





$(document).ready(function(){
	
	
// mobile_menu
var menu = $('ul#navigation');
if(menu.length){
	menu.slicknav({
		prependTo: ".mobile_menu",
		closedSymbol: '+',
		openedSymbol:'-'
	});
};
// blog-menu
  // $('ul#blog-menu').slicknav({
  //   prependTo: ".blog_menu"
  // });

// review-active

var slider = $('.slider_active');
if(slider.length) {
  slider.owlCarousel({
    loop:true,
    margin:0,
  items:1,
  autoplay:true,
  navText:['<i class="ti-angle-left"></i>','<i class="ti-angle-right"></i>'],
    nav:true,
  dots:false,
  autoplayHoverPause: true,
  autoplaySpeed: 800,
    responsive:{
        0:{
            items:1,
            nav:false,
        },
        767:{
            items:1,
            nav:false,
        },
        992:{
            items:1,
            nav:false
        },
        1200:{
            items:1,
            nav:false
        },
        1600:{
            items:1,
            nav:true
        }
    }
  });
}



// review-active
var testmonial = $('.testmonial_active');
if(testmonial.length){
  testmonial.owlCarousel({
  loop:true,
  margin:0,
  autoplay:true,
  navText:['<i class="ti-angle-left"></i>','<i class="ti-angle-right"></i>'],
    nav:true,
  dots:false,
  autoplayHoverPause: true,
  autoplaySpeed: 800,
    responsive:{
        0:{
            items:1,
            dots:false,
            nav:false,
        },
        767:{
            items:1,
            dots:false,
            nav:false,
        },
        992:{
            items:1,
            nav:true
        },
        1200:{
            items:1,
            nav:true
        },
        1500:{
            items:1
        }
    }
  });
}

// review-active
var candidate = $('.candidate_active');
if(candidate.length){
  candidate.owlCarousel({
  loop:true,
  margin:30,
  autoplay:true,
  navText:['<i class="ti-angle-left"></i>','<i class="ti-angle-right"></i>'],
  nav:true,
  dots:false,
  autoplayHoverPause: true,
  autoplaySpeed: 800,
    responsive:{
        0:{
            items:1,
            dots:false,
            nav:false,
        },
        767:{
            items:3,
            dots:false,
            nav:false,
        },
        992:{
            items:4,
            nav:true
        },
        1200:{
            items:4,
            nav:true
        },
        1500:{
            items:4
        }
    }
  });
}




// for filter
  // init Isotope
  var $grid = $('.grid').isotope({
    itemSelector: '.grid-item',
    percentPosition: true,
    masonry: {
      // use outer width of grid-sizer for columnWidth
      columnWidth: 1
    }
  });

  // filter items on button click
  $('.portfolio-menu').on('click', 'button', function () {
    var filterValue = $(this).attr('data-filter');
    $grid.isotope({ filter: filterValue });
  });

  //for menu active class
  $('.portfolio-menu button').on('click', function (event) {
    $(this).siblings('.active').removeClass('active');
    $(this).addClass('active');
    event.preventDefault();
	});
  
  // wow js
  new WOW().init();

  // counter 
  $('.counter').counterUp({
    delay: 10,
    time: 10000
  });

/* magnificPopup img view */
$('.popup-image').magnificPopup({
	type: 'image',
	gallery: {
	  enabled: true
	}
});

/* magnificPopup img view */
$('.img-pop-up').magnificPopup({
	type: 'image',
	gallery: {
	  enabled: true
	}
});

/* magnificPopup video view */
$('.popup-video').magnificPopup({
	type: 'iframe'
});

  // blog-page

  //brand-active
  var brand = $('.brad_active');
  if(brand.length){
    brand.owlCarousel({
    loop:true,
    autoplay:true,
    nav:false,
    dots:false,
    autoplayHoverPause: true,
    autoplaySpeed: 800,
      responsive:{
          0:{
              items:2,
              nav:false
          },
          767:{
              items:4
          },
          992:{
              items:5
          }
      }
    });
  }


// blog-dtails-page

if (document.getElementById('default-select')) {
  $('select').niceSelect();
}

  //about-pro-active
$('.details_active').owlCarousel({
  loop:true,
  margin:0,
items:1,
// autoplay:true,
navText:['<i class="ti-angle-left"></i>','<i class="ti-angle-right"></i>'],
nav:true,
dots:false,
// autoplayHoverPause: true,
// autoplaySpeed: 800,
  responsive:{
      0:{
          items:1,
          nav:false

      },
      767:{
          items:1,
          nav:false
      },
      992:{
          items:1,
          nav:false
      },
      1200:{
          items:1,
      }
  }
});

});

// resitration_Form
$(document).ready(function() {
	$('.popup-with-form').magnificPopup({
		type: 'inline',
		preloader: false,
		focus: '#name',

		// When elemened is focused, some mobile browsers in some cases zoom in
		// It looks not nice, so we disable it:
		callbacks: {
			beforeOpen: function() {
				if($(window).width() < 700) {
					this.st.focus = false;
				} else {
					this.st.focus = '#name';
				}
			}
		}
	});
});



//------- Mailchimp js --------//  
function mailChimp() {
  $('#mc_embed_signup').find('form').ajaxChimp();
}
mailChimp();



        // Search Toggle
        $("#search_input_box").hide();
        $("#search").on("click", function () {
            $("#search_input_box").slideToggle();
            $("#search_input").focus();
        });
        $("#close_search").on("click", function () {
            $('#search_input_box').slideUp(500);
        });
        // Search Toggle
        $("#search_input_box").hide();
        $("#search_1").on("click", function () {
            $("#search_input_box").slideToggle();
            $("#search_input").focus();
        });
        $(document).ready(function() {
          $('select').niceSelect();
        });


      //   $('#datepicker').datepicker({
      //     iconsLibrary: 'fontawesome',
      //     icons: {
      //      rightIcon: '<span class="fa fa-caret-down"></span>'
      //  }
      // });
      	var csrfToken = $("#csrf").val();
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
		//이메일 인증 모달에서 버튼 클릭 시 인증 요청 전송
		$("#verifyBtn").click(function() {
			var verifyCode = $(this).parent().prev().find("input").val();
			
			$.ajax({
				url : "/connecthink/all/verify",
				data : {'code' : verifyCode,
						'_csrf' : csrfToken},
				success : (data, textStatus, jqXHR) => {
					$("#verifyModal").modal("hide");
					$("#isVerified").val("y");
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
						`<br><h3>${data}</h3><br>`
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
})(jQuery);	