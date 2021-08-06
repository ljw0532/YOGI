<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 메인</title>
<style type="text/css">
.circle-cropper {
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 50%;
  border-radius: 50%;
  width: 300px;
  height: 300px;
}
</style>
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

	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
</head>
<body>
	<div id="colorlib-page">
		<!-- 왼쪽 사이드바 -->
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
			<h1 id="colorlib-logo"><a href="http://localhost:8080/yogi/main">YOGI</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="http://localhost:8080/yogi/main">Home</a></li>
					<li><a href="http://localhost:8080/yogi/groupList">Group</a></li>
					<li><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
					<li class="colorlib-active"><a href="http://localhost:8080/yogi/admin/adminpageView">AdminPage</a></li>
					<li><a href="">About</a></li>
					<li><a href="http://localhost:8080/yogi/logout">Logout</a></li>
				</ul>
			</nav>

			<div class="colorlib-footer">
				<p><small>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> Made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a> Distributed by: <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --> </span> <span>Demo Images: <a href="http://nothingtochance.co/" target="_blank">nothingtochance.co</a></span></small></p>
				<ul>
					<li><a href="#"><i class="icon-facebook2"></i></a></li>
					<li><a href="#"><i class="icon-twitter2"></i></a></li>
					<li><a href="#"><i class="icon-instagram"></i></a></li>
					<li><a href="#"><i class="icon-linkedin2"></i></a></li>
				</ul>
			</div>
		</aside>
		
		<!-- 관리자 페이지  -->
		<div id="colorlib-main">
		<div class="colorlib-blog">
			<div class="colorlib-narrow-content">
				<div class="row">
					<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
						<span class="heading-meta">AdminPage</span>
						<h2 class="colorlib-heading">AdminPage Main</h2>
					</div>
				</div>
				<div class="row" style="display: flex;">
					<div class="col-md-4 col-md-offset-1">
						<div align="center">
							<div class="circle-cropper" style="background-image:url(/yogi/resources/upload/${admin.M_PROFILE });"></div>
						</div>	
						<div align="center" style="margin-top: 20px;"><font size="6">관리자 ${session_m_id }님</font></div>
					</div>

					<div class="col-md-6">
						<ul style="list-style: none; margin-top: 50px;">
							<li style="margin-top: 20px;  border-bottom: 1px solid #efefef"><a href="<c:url value='/admin/member/list'/>"><font size="4">회원 리스트</font></a></li>
							<li style="margin-top: 20px;  border-bottom: 1px solid #efefef"><a href="<c:url value='/admin/group/list'/>"><font size="4">모임 리스트</font></a></li>
							<li style="margin-top: 20px;  border-bottom: 1px solid #efefef"><a href="<c:url value='/admin/lendplace/list'/>"><font size="4">장소 리스트</font></a></li>
							<li style="margin-top: 20px;  border-bottom: 1px solid #efefef"><a href="<c:url value='/admin/placeBook/list'/>"><font size="4">장소 예약 리스트</font></a></li>
							<li style="margin-top: 20px;  border-bottom: 1px solid #efefef"><a href="<c:url value='/admin/report/list'/>"><font size="4">신고 리스트</font></a></li>
						</ul>
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
</body>
</html>