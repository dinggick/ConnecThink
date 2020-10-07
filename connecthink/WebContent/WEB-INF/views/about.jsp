<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>

body{
  background-color: #aaa;
}
.main{
  height: 100%;
  position: relative;
}
h1{
  font-family: /* 본문용 서체 */
  '-apple-system', 'BlinkMacSystemFont', 'Apple SD Gothic Neo',
  'Inter', 'Spoqa Han Sans', 'Segoe UI', Sans-Serif,
  'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';
  font-size: 32px;
  line-height: 1.125;
  margin-bottom: 10px;
  letter-spacing: -3px;
  @media (min-width: 800px){
    font-size: 80px
  }
}
h3{
  color: red;
  font-family: /* 본문용 서체 */
  '-apple-system', 'BlinkMacSystemFont', 'Apple SD Gothic Neo',
  'Inter', 'Spoqa Han Sans', 'Segoe UI', Sans-Serif,
  'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';
  font-weight: 400;
  font-size: 18px;
  line-height: 0.85;
  margin: 0;
  text-transform: uppercase;
  border-bottom: 2px solid rgba(0,0,0,0.3);
  padding-bottom: 15px;
  margin-bottom: 35px;
  @media (min-width: 800px){
    font-size: 23px;
  }
}
p{
  font-size: 18px;
  line-height: 28px;
  font-family: /* 본문용 서체 */
  '-apple-system', 'BlinkMacSystemFont', 'Apple SD Gothic Neo',
  'Inter', 'Spoqa Han Sans', 'Segoe UI', Sans-Serif,
  'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol';
  font-weight: normal;
}

.nav{
  display: none;
  @media (min-width: 500px) and (min-height: 375px){
    display: block;
  }
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  height: 100%;
  list-style: none;
  z-index: 997;
  &:before{
    border-left: 2px solid  rgba(255,255,255,0.3);
    content: "";
    position: absolute;
    top: 0;
    bottom: 0;
    height: 100%;
    left: 49px;
  }
}
.dot-nav{
  list-style: none;
  position: relative;
  z-index: 5;
  a{
    display: inline-block;
    background: #ddd;
    width: 20px;
    height: 20px;
    border-radius: 100%;
    vertical-align: middle;
    
    &:hover{
      transition: all 0.15s ease-in-out;
      background-color: #e53333;
      transform: scale(2);
    }
    &.active{
      background-color: #e53333;
      transform: scale(2);
    }
  }
  li{
    margin: 25px 0;
  }
  li span{
    opacity: 0;
    position: fixed;
    vertical-align: middle;
    color: #fff;
    background: #000;
    padding: 2px 7px;
    margin-top: -4px;
    margin-left: 25px;
    border-radius: 4px;
    transition: opacity 0.3s ease-in-out;
    font-size: 14px;
  }
  li span b{
    display: block;
    font-size: 18px;
    line-height: 1;
    margin-bottom: 5px;
  }
  li a:hover+span{
    opacity: 1;
  }
}

.page-block{
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
.content{
  width: 70%;
  margin: 0 auto;
  padding: 3em 0;
  color: #fff;
}

#one{background: url(https://i.imgur.com/Bjg7q3o.png) no-repeat center center fixed;}
#two{background: url(https://unsplash.it/1800/900?image=26) no-repeat center center fixed;}
#three{background: url(https://unsplash.it/1800/900?image=96) no-repeat center center fixed;}
#four{background: url(https://unsplash.it/1800/900?image=36) no-repeat center center fixed;}
#five{background: url(https://unsplash.it/1800/900?image=255) no-repeat center center fixed;}
#six{background: url(https://unsplash.it/1800/900?image=319) no-repeat center center fixed;}
#seven{background: url(https://unsplash.it/1800/900?image=668) no-repeat center center fixed;}
#eight{background: url(https://unsplash.it/1800/900?image=625) no-repeat center center fixed;}


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="${contextPath}/connecthink/"><img src="https://fontmeme.com/permalink/201006/7c2c538a94b7f47d0c5bbb30b13e33d7.png" style="position: absolute; right:0px;z-index: 1000;" alt="cursive-type" border="0"></a>		

    
<div class="main">

  <section id="two" data-anchor="two" class="page-block">
  	<div class="content">
      <h3>Service Outline</h3>      
      <h1>생각과 생각을 이어주다.</h1>
      <p>connecThink 는 사람과 사람을 이어주는 플랫폼입니다.</p>
      <p>특별한 아이디어를 구현시켜 줄 특별한 사람을 찾고 있다면, 특별한 아이디어가 없어도</p>
      <p>특별한 무언가를 함께 만들 사람을 찾고 있다면, connecThink 에서 시작해보세요.</p>
    </div>
  	
    <div class="content">
      <h3>Service Features</h3>
      <h1>나를 소개하고, <br>나와 함께할 사람을 찾아보세요</h1>      
      <p>메이트 등록<br>무엇을 해왔는지, 무엇을 하고 싶은지, 어떤 성격인지, 어떤 요구 사항이 있는지 표현함으로써 메이트들이 당신에 대해 알 수있도록 해주세요.</p>
      <p>메이트 모집<br>아이디어가 있어도 괜찮고 아이디어가 없어도 괜찮아요. 함께 팀을 이룰 메이트를 찾고 싶다면, 주저하지 말고 메이트를 모집하세요.</p>
    </div>
  </section>
    <section id="seven" data-anchor="sevent" class="page-block">
    <div class="content">
      <h3>Starting with connecThink</h3>
      <h1><strong>"같이 모이는 것은 시작을 의미한다.<br>같이 협력해서 일하는 것은 성공을 의미한다"</strong><br>_핸리 포드</h1>
      <p>프로젝트의 전반적인 관리, 그리고 커뮤니케이션 환경을 제공합니다.</p>
      <p>프로젝트 관리<br>'TODO(해야 할 일)' 'DOING(진행 중)' 'DONE(완료)' 총 세 가지 구분을 나눠서 프로젝트의 작업을 구분하고 팀원들과 공유할 수 있고 <br>이는 효율성을 높여줄 것입니다.</p>
      <p>커뮤니케이션<br>팀원들의 접속을 실시간으로 확인하고 채팅으로 소통 하세요.</p>
    </div>
  </section>
</div>
		
		
</body>

<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>

<script>

$('.dot-nav a').on('click', function() {

    var scrollAnchor = $(this).attr('data-scroll'),
        scrollPoint = $('section[data-anchor="' + scrollAnchor + '"]').offset().top - 28;

    $('.main').animate({
        scrollTop: scrollPoint
    }, 500);

    return false;

})


$(window).scroll(function() {
    var windscroll = $(window).scrollTop();
    if (windscroll >= 100) {
        $('.dot-nav').addClass('fixed');
        $('.main section').each(function(i) {
            if ($(this).position().top <= windscroll) {
                $('.dot-nav a.active').removeClass('active');
                $('.dot-nav a').eq(i).addClass('active');
            }
        });

    } else {

        $('dot-nav').removeClass('fixed');
        $('dot-nav a.active').removeClass('active');
        $('dot-nav a:first').addClass('active');
    }

}).scroll();



//Full Height Sections
//http://stackoverflow.com/questions/9214040/how-to-properly-set-the-100-div-height-to-match-document-window-height
$(function(){
	 var fullHeight = $('section');
    var windowH = $(window).height();
    var wrapperH = fullHeight.height();
    if(windowH > wrapperH) {                            
        fullHeight.css({'min-height':($(window).height())+'px'});
    }                                                                               
    $(window).resize(function(){
        var windowH = $(window).height();
        var wrapperH = fullHeight.height();
        var differenceH = windowH - wrapperH;
        var newH = wrapperH + differenceH;
        //var truecontentH = $('#truecontent').height();
        //if(windowH > truecontentH) {
            fullHeight.css('min-height', (newH)+'px');
        //}

    })          
});



</script>

</html>