<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<!-- 	<link rel="stylesheet" href="/resources/datepicker/datepicker.css"> -->

	<!-- 주소 검색 아이콘 -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/font-awesome.min.css">

	<!-- 셀렉트 박스 -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/selectBox.css">
	
	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<link  href="<c:url value='/resources/datepicker/datepicker.css' />" rel="stylesheet">



<style>
.map_title { position: relative; width: 730px;   height:350px; margin-left: 2px;}

div.map_title{
   position:relative;

}


</style>
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
					<li class="colorlib-active"><a href="http://localhost:8080/yogi/groupList">Group</a></li>
					<li><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
					<c:choose>
					<c:when test="${session_m_lv =='관리자'}">
					<li><a href="http://localhost:8080/yogi/admin/adminpageView">AdminPage</a></li>
					</c:when>
					<c:otherwise>
					<li><a href="http://localhost:8080/yogi/mypage/mypageView">MyPage</a></li>
					</c:otherwise>
					</c:choose>
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

		<!-- 모임 폼 -->
		<div id="colorlib-main">
			<div class="colorlib-contact">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">R e p o r t</span>
							<h2 class="colorlib-heading" style="margin-top: -10px;">Open Report Form</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
							<form name="reportinput" method="post" enctype="multipart/form-data" id="reportinput">
								<div class="form-group col-md-12">
			  					<div class="col-md-8" style="padding-left: 0;">
									<font style="padding: 10px; padding-left:0px; padding-right:15px; font-weight: bold;">신고할 회원의 ID : </font>
									<font style="background-color: #f3f3f3; padding: 10px; padding-left:15px; padding-right:15px; border-radius: .25em; border-color: #f3f3f3;">${report.userInfo.M_ID }</font>
								</div>
					 			</div>
								<div class="form-group col-md-12">
			  					<div class="col-md-8" style="padding-left: 0;">
			  						<font style="padding: 10px; padding-left:0px; padding-right:15px; font-weight: bold;">신고할 회원의 이름 : </font>
									<font style="background-color: #f3f3f3; padding: 10px; padding-left:15px; padding-right:15px; border-radius: .25em; border-color: #f3f3f3;">${report.userInfo.M_NAME }</font>
								</div>
					 			</div>
								<div class="form-group col-md-12">
			  					<div class="col-md-8" style="padding-left: 0; padding-top: 30px;">
			  					<font color="red" size="2">※아래 모임은 신고받는 사람의 주최한 모임 중 회원님이 참여한 모임만 나옵니다.</font>
									
										<div class="selectb" style="margin-bottom: 10px; height: 3.0em;">
											<select name="gg_no" id="gg_no">
												<c:forEach items="${report.groupList }" var="groupMPNO">
												<option value="${groupMPNO.GG_NO }">&nbsp;&nbsp;&nbsp;${groupMPNO.GG_NAME }</option>
												</c:forEach>
											</select>
										</div>
								</div>
								<div class="form-group col-md-12" style="padding-left: 0;">
			  					<div class="col-md-8" style="padding-left: 0; padding-top: 30px;">
									<textarea id="r_comment" name="r_comment" placeholder="신고할 내용을 적어주세요! >__<" rows="10" cols="50"></textarea>
								</div>
					 			</div>
								<div class="form-group col-md-5" align="center" style="padding-top: 30px;">
									<input class="btn btn-primary btn-send-message" type="hidden" name="m_pno" value="${report.userInfo.M_NO }">
									<input type="hidden" id="userNo" name="userNo" value="${session_m_no }">
									<input class="btn btn-primary btn-send-message" type="button" value="신고하기" onclick="#this" id="insert" name="insert">
								</div>
							</form>
						 </div>
					</div>
				</div>
			</div>
		</div>
</div>

<!-- jQuery -->
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8""></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

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
	
	
<script type="text/javascript">
function fn_insertReport(){
    var comSubmit = new ComSubmit("reportinput");
    comSubmit.setUrl("<c:url value='/report/reportInsert' />");
    comSubmit.submit();
 } 

$(document).ready(function() {
    $("#insert").on("click", function(e) { //등록
       e.preventDefault();
    	var userNo = $("#userNo").val();
    	var groupNo = $("#gg_no").val();
    	$.ajax({
    		async:true,
			type:'POST', 
			data : {"userNo":userNo,"groupNo":groupNo},
			url:'/yogi/checkReport',
			dataType : "json",
			success : function(data){
				if(data.cnt == 0){
					if($('#r_comment').val()==""){
						alert("신고할 내용을 입력해주세요");
						$("#r_comment").focus();
					}else{
						alert("신고가 완료되었습니다 :3");
						fn_insertReport();
					}
				}else{
					alert("이미 신고한 모임와 주최자 입니다.");
				}
				
			},
			error : function(error){
				alert("error: " + error)
			}
    	})	
    
	});
});

</script>
</body>
</html>