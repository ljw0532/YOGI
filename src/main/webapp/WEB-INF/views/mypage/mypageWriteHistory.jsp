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
							<h2 class="colorlib-heading" style="margin-top: -10px;">내가 개설한 모임</h2>
						</div>
					</div>
				</div>
			</div>
			
				<div class="section-top-border" align="center" style="width:850px; margin-left:80px; margin-top:-200px">
				
						<div class="progress-table-wrap">
							<div class="progress-table">
								<div class="table-head" >
									<div class="serial" style="position:relative; left:30px; ">NO</div>
									<div class="country" style="position:relative; left:180px; ">제목</div>
									<div class="visit" style="position:relative; left:310px;">모임 날짜</div>
								</div>
								<c:choose>
								<c:when test="${fn:length(list) > 0 }">
								<c:forEach items="${list}" var="row">
							
								<div class="table-row" >
									<div class="serial" style="position:relative; left:55px;"><span style="text-align: center;">${row.GG_NO }</span></div>
								<div class="country" style="position:relative; left:280px; ">
									<a href="#this" name="detail">${row.GG_NAME}</a><input type="hidden" id="gg_no" value="${row.GG_NO}">
									</div>
									<div class="visit" style="position:relative; left:335px; "><span style="text-align: center;">${row.GG_DATE }</span></div>
								</div>
								</c:forEach>
								</c:when>
								<c:otherwise>
									<br>
									개설한 모임이 없습니다!
							</c:otherwise>
								</c:choose>
								
								     <nav class="blog-pagination justify-content-center d-flex">
		                        <ul class="pagination">
		                            <li class="page-item">
		                                <a href="#" class="page-link" aria-label="Previous">
		                                    <span aria-hidden="true">
		                                        <span class="lnr lnr-chevron-left"></span>
		                                    </span>
		                                </a>
		                            </li>
		                            ${pagingHtml}
		                        </ul>
		                    </nav>
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
			
						<%@ include file="/WEB-INF/include/common-body.jspf"%>
	<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='detail']").on("click", function(e) {
				/* 태그의 기본 기능을 제거 */
				e.preventDefault();
				fn_groupDetail($(this));
					
				});
		});
		function fn_groupDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/groupDetail' />");
			comSubmit.addParam("gg_no",obj.parent().find("#gg_no").val());
			comSubmit.addParam("currentPageNo", "${currentPageNo}");
			comSubmit.submit();
		}
			
	</script>


</body>
</html>

