<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
    	<!-- Find Email Modal -->
    <div class="modal" id="findEmailModal" tabindex="-1" role="dialog" aria-labelledby="findEmailModalCenterTitle" aria-hidden="true" style="z-index: 1051;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findEmailModalLongTitle">�̸��� ã��</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                 <span aria-hidden="true">&times;</span> -->
<!--             </button> -->
                </div>
                <div class="modal-body">
                    <form action="#">
                        <div class="mt-10">
                            <input type="text" name="name" placeholder="�̸�" onfocus="this.placeholder = ''" onblur="this.placeholder = '�̸�'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="birthDate" placeholder="������� 8�ڸ� ex)19921211" onfocus="this.placeholder = ''" onblur="this.placeholder = '������� 8�ڸ� ex)19921211'" required class="single-input">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">�ڷ�</button>
                    <button type="button" class="btn btn-primary">ã��</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Find Password Modal -->
    <div class="modal" id="findPwdModal" tabindex="-1" role="dialog" aria-labelledby="findPwdModalCenterTitle" aria-hidden="true" style="z-index: 1051;">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="findPwdModalLongTitle">�н����� ã��</h5>
<!--                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                 <span aria-hidden="true">&times;</span> -->
<!--             </button> -->
                </div>
                <div class="modal-body">
                    <form action="#">
	                    <br>
                    	<div class="row">
                    		<div class="col-md-6 offset-1">
                            	<input type="email" name="email" placeholder="�̸���" onfocus="this.placeholder = ''" onblur="this.placeholder = '�̸���'" required class="single-input">
	                        </div>
	                        <div class="col-md-6">
	                            <a href="#" class="genric-btn info-border">�̸��� ����</a>
	                        </div>
	                    </div>
	                    <br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">�ڷ�</button>
                    <button type="button" class="btn btn-primary">ã��</button>
                </div>
            </div>
        </div>
    </div>
        <!-- Log in Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLongTitle">�α���</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
                </div>
                <div class="modal-body">
                    <form action="#">
                        <div class="mt-10">
                            <input type="email" name="email" placeholder="�̸���" onfocus="this.placeholder = ''" onblur="this.placeholder = '�̸���'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="password" name="password" placeholder="��й�ȣ" onfocus="this.placeholder = ''" onblur="this.placeholder = '��й�ȣ'" required class="single-input">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <a style="text-decoration: underline; color: #367FFF;" href="#findEmailModal" data-toggle="modal" data-backdrop="false">�̸��� ã��</a>
                    <a style="text-decoration: underline; color: #367FFF;" href="#findPwdModal" data-toggle="modal" data-backdrop="false">��й�ȣ ã��</a>
<!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button> -->
                    <button type="button" class="btn btn-primary">�α���</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Register Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="registerModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="registerModalLongTitle">ȸ������</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
                </div>
                <div class="modal-body">
                    <form action="#">
                        <div class="mt-10">
                            <input type="email" name="email" placeholder="�̸���" onfocus="this.placeholder = ''" onblur="this.placeholder = '�̸���'" required class="single-input">
                            <div class="mt-10">
                                <a href="#" class="genric-btn info-border">�̸��� ����</a>
                            </div>
                        </div>
                        <div class="mt-10">
                            <input type="password" name="password" placeholder="��й�ȣ" onfocus="this.placeholder = ''" onblur="this.placeholder = '��й�ȣ'" required class="single-input">
                        </div>
                        <div class="mt-10">
                            <input type="text" name="name" placeholder="�̸�" onfocus="this.placeholder = ''" onblur="this.placeholder = '�̸�'" required class="single-input">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
<!--                     <button type="button" class="btn btn-secondary" data-dismiss="modal">�ݱ�</button> -->
                    <button type="button" class="btn btn-primary">ȸ������</button>
                </div>
            </div>
        </div>
    </div>
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
                                            <li><a href="index.html">����Ȩ</a></li>
                                            <li><a href="jobs.html">�������� ���</a></li>
                                           
                                            <li><a href="#">����������</a></li>
                                            <li><a href="contact.html">�������� ������</a></li>
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
                                                    <li><a data-toggle="modal" href="#loginModal">�α���</a></li>
                                                    <li><a data-toggle="modal" href="#registerModal">ȸ������</a></li>                                                   
                                            </ul>                                                                               
                                         </div>
                                        <a href="#"><img class="personicon" src="img/bell.png"></a>
							<div class="sidebar">
								<a href="#"><img class="personicon" src="img/pmenu.png" onclick="openNav()"></a>
								<div id="mySidenav" class="sidenav">
									<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a> 
										<h4 style="padding-left: 20px;">���� ������Ʈ �����̽�</h4>
										<hr>
										<a href="#">������Ʈ1</a> 
										<a href="#">������Ʈ2</a> 
										<a href="#">������Ʈ3</a> 										
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