<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>마이페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	


  <!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/animate.css">
	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/flexslider.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/fonts/flaticon/font/flaticon.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/owl.carousel.min.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/style.css">
	
	<link rel="stylesheet" href="/resources/datepicker/datepicker.css">
	
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/linearicons.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/font-awesome.min.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/magnific-popup.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/nice-select.css">							
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/animate.min.css">
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/jquery-ui.css">			
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/main.css">

	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<style type="text/css">
.circle-cropper {
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 50%;
  border-radius: 50%;
  width: 200px;
  height: 200px;
}
</style>
	</head>
	
	<body>
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<!-- 사이드 바 -->
<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
	<h1 id="colorlib-logo"><a href="http://localhost:8080/yogi/main">YOGI</a></h1>
	<nav id="colorlib-main-menu" role="navigation">
	<ul>
		<li><a href="http://localhost:8080/yogi/main">Home</a></li>
		<li><a href="http://localhost:8080/yogi/groupList">Group</a></li>
		<li><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
		<li class="colorlib-active"><a href="http://localhost:8080/yogi/mypage/mypageView">MyPage</a></li>
		<li><a href="">About</a></li>
		<li><a href="http://localhost:8080/yogi/logout">Logout</a></li>
	</ul>
	</nav>
	<div class="colorlib-footer">
			<p><small>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> Made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> Distributed by: <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> </span> <span>Demo Images: <a href="http://nothingtochance.co/" target="_blank">nothingtochance.co</a></span></small></p>
<span>MADE BY: <a href="">YOMI</a></span>
	</div>
</aside>

		<div id="colorlib-main">

			<div class="colorlib-contact">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">M Y P A G E</span>
							<h2 class="colorlib-heading" style="margin-top: -10px;">${session_m_name}님  환영합니다 ! </h2>
						</div>
					</div>
					
						<div class="col-lg-4 sidebar-widgets" style="top: -40px; ">
							<div class="widget-wrap" >
								<div align="center">
									<div class="circle-cropper" style="background-image:url(/yogi/resources/upload/${member.M_PROFILE });"></div>
								</div>
									<div class="single-sidebar-widget popular-post-widget">
							<div class="button-group-area mt-10">
							<a href="http://localhost:8080/yogi/members/modifyForm" class="genric-btn danger-border radius" style="height:40px; margin-top:-15px; margin-bottom:12px; margin-left:60px;">프로필 수정</a>
							
									
									
									<h4 class="popular-title">${session_m_id }님</h4>
									<div class="details" align="center">
												<h6 style="margin-top:10px;">보유 포인트 : ${member.M_GRADE } </h6>
											</div>
									</div>
									
									<div class="single-sidebar-widget popular-post-widget">
									</div>
									
									<h4 style="margin-bottom: 15px;" align="center">"${member.M_LV }"</h4>
									
										<c:if test="${member.M_GRADE lt 50 }">
										<img src="/yogi/resources/image/lv-b.png" style="margin-left:108px;">
										</c:if>
		
										<c:if test="${member.M_GRADE ge 50 && member.M_GRADE lt 100}">
										<img src="/yogi/resources/image/lv-s.png" style="margin-left:108px;">
										</c:if>
	
										<c:if test="${member.M_GRADE ge 100 && member.M_GRADE lt 200}">
										<img src="/yogi/resources/image/lv-g.png" style="margin-left:108px;">
										</c:if>
	
										<c:if test="${member.M_GRADE ge 200 && member.M_GRADE lt 300}">
										<img src="/yogi/resources/image/lv-v.png" style="margin-left:108px;">
										</c:if>
	
										<c:if test="${member.M_GRADE ge 300 && member.M_GRADE le 400}">
										<img src="/yogi/resources/image/lv-w.png" style="margin-left:108px;">
										</c:if>
								</div>
							
								
								<div class="single-sidebar-widget popular-post-widget">
								
									<div class="popular-post-list">
										<div class="single-post-list d-flex flex-row align-items-center">
											<div class="thumb">
												<img class="img-fluid" src="img/blog/pp1.jpg" alt="">
											</div>
											
											<div class="details">
												<h6 style="margin-top:10px;">포인트를 쌓아 등급별로 다양한 혜택을 받아보세요 !</h6>
											</div>
											<p align="center">※포인트 안내※ <br />
											모임 개설 : 30pt <br />
											모임 참여 : 10pt <br />
											댓글 작성  : 1pt <br />
											장소 후기 작성 : 5pt</p>
										</div>
									</div>
								</div>
				</div>
			</div>
	
			
			<div class="col-md-8 animate-box" data-animate-effect="fadeInRight">
							<div class="fancy-collapse-panel">
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
									<div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="headingOne">
									        <h4 class="panel-title">
									            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">내가 개설한 모임
									            </a>
									        </h4>
									    </div>
									    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
									         <div class="panel-body">
									            <div class="row">
										      		회원님이 현재 개설한 모임은 총 ${member.WRITE_COUNT }개 입니다. <br/>
										      		<a href="http://localhost:8080/yogi/mypage/writeHistory" class="genric-btn danger circle arrow" style="height:30px; margin-top:10px;">확인하러 가기<span class="lnr lnr-arrow-right"></span></a>
									
										      	</div>
									         </div>
									    </div>
									</div>
									<div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="headingTwo">
									        <h4 class="panel-title">
									            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">내가 신청한 모임
									            </a>
									        </h4>
									    </div>
									    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
									        <div class="panel-body">
										     	 회원님이 현재 신청한 모임은 총 ${member.MEET_COUNT }개 입니다.<br />
										     	 <a href="http://localhost:8080/yogi/mypage/meetHistory" class="genric-btn danger circle arrow" style="height:30px; margin-top:10px;">확인하러 가기<span class="lnr lnr-arrow-right"></span></a>
									        </div>
									    </div>
									</div>
									<div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="headingThree">
									        <h4 class="panel-title">
									            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">내가 찜한 모임
									            </a>
									        </h4>
									    </div>
									    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
									        <div class="panel-body">
									             회원님이  현재 찜한 모임은 총 ${member.ZZIM_COUNT }개 입니다. <br />
									             <a href="http://localhost:8080/yogi/mypage/zzimHistory" class="genric-btn danger circle arrow" style="height:30px; margin-top:10px;">확인하러 가기<span class="lnr lnr-arrow-right"></span></a>
									        </div>
									    </div>
									</div>
									
									<div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="heading4">
									        <h4 class="panel-title">
									            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse4" aria-expanded="false" aria-controls="collapse4">장소 신청 내역
									            </a>
									        </h4>
									    </div>
									    <div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
									        <div class="panel-body">
									            회원님이 현재 신청한 장소는 총 ${member.PLACEBOOK_COUNT }개 입니다. <br />
									            <a href="http://localhost:8080/yogi/mypage/placebookHistory" class="genric-btn danger circle arrow" style="height:30px; margin-top:10px;">확인하러 가기<span class="lnr lnr-arrow-right"></span></a>
									        </div>
									    </div>
									</div>
									
									<div class="panel panel-default">
									    <div class="panel-heading" role="tab" id="heading5">
									        <h4 class="panel-title">
									            <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse5" aria-expanded="false" aria-controls="collapse5">신고 내역
									            </a>
									        </h4>
									    </div>
									    <div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
									        <div class="panel-body">
									            회원님은 현재 총 ${member.REPORT_COUNT }번의 신고를 당했습니다. <br />
									            <a href="http://localhost:8080/yogi/mypage/reportHistory" class="genric-btn danger circle arrow" style="height:30px; margin-top:10px;">확인하러 가기<span class="lnr lnr-arrow-right"></span></a>
									        </div>
									    </div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	
									
	

	<!-- jQuery -->
	<script src="/yogi/resources/bootstrap/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/yogi/resources/bootstrap/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/yogi/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/yogi/resources/bootstrap/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="/yogi/resources/bootstrap/js/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script src="/yogi/resources/bootstrap/js/sticky-kit.min.js"></script>
	<!-- Owl carousel -->
	<script src="/yogi/resources/bootstrap/js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="/yogi/resources/bootstrap/js/jquery.countTo.js"></script>
	
	
	
	<!-- MAIN JS -->
	<script src="/yogi/resources/bootstrap/js/main.js"></script>
	
			<!-- End footer Area -->	

	<!-- 		<script src="/yogi/resources/bootstrap_my/js/vendor/jquery-2.2.4.min.js"></script>
			<script src="/yogi/resources/bootstrap_my/https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  			<script src="/yogi/resources/bootstrap_my/js/easing.min.js"></script>			
			<script src="/yogi/resources/bootstrap_my/js/hoverIntent.js"></script>
			<script src="/yogi/resources/bootstrap_my/js/superfish.min.js"></script>	
			<script src="/yogi/resources/bootstrap_my/js/jquery.ajaxchimp.min.js"></script>
			<script src="/yogi/resources/bootstrap_my/js/jquery.magnific-popup.min.js"></script>	
 			<script src="/yogi/resources/bootstrap_my/js/jquery-ui.js"></script>								
			<script src="/yogi/resources/bootstrap_my/js/jquery.nice-select.min.js"></script>							
			<script src="/yogi/resources/bootstrap_my/js/mail-script.js"></script>	
			<script src="/yogi/resources/bootstrap_my/js/main.js"></script>	 -->


</body>
</html>

