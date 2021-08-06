<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery-1.7.1.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.css'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery.simple-dtpicker.js'/>" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	$('#searchbox').keypress(function(event) {
		if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
			searchSubmit();
		}
	});
	$('.btnEventSearch').click(function(event) {
		searchSubmit();
		});
	
	$('.date').appendDtpicker({
	"futureOnly" : true,
	"autodateOnStart" : false,
	"locale" : "ko",
	"dateFormat": "YY/MM/DD",
	"dateOnly": true,
	"closeOnSelected": true,
	"calendarMouseScroll": false
	});
});		
		    
function searchSubmit(){
		
}
		    
</script>

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
<%-- <div>
<c:if test="${searchMemberActive != null || searchWord != null}">
	[
		<c:if test="${searchMemberActive != null }">
			<c:if test="${searchMemberActive == 'O' }">
				활성화된 멤버
			</c:if>
			<c:if test="${searchMemberActive == 'X' }">
				비활성화된 멤버
			</c:if>
		</c:if>
		<c:if test="${searchWord != null && searchMemberActive != null}">
			&nbsp;중&nbsp;
		</c:if>
		<c:if test="${searchWord != null }">
			<c:if test="${searchCategory == 'id' }">
				${searchCategory } :
			</c:if>
			<c:if test="${searchCategory == 'grade' }">
				${searchCategory } :
			</c:if>
			${searchWord }
		</c:if>
	]을(를) 검색한 결과입니다.
</c:if>
</div> --%>

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
		
		<!-- 관리자 페이지 : 멤버 리스트 -->
		<div id="colorlib-main">
		<div class="colorlib-blog">
			<div class="colorlib-narrow-content">
				<div class="row">
					<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
						<span class="heading-meta">AdminPage</span>
						<h2 class="colorlib-heading">Place Book List</h2>
					</div>
				</div>
				<div class="row" style="display: flex;">
					<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
						<div class="col-md-12" align="center">
						<c:choose>
						<c:when test="${fn:length(list) > 0 }">
							<table border="1" style="width: 1200px; ">
								<thead>
								<tr>
									<td align="center">예약 번호</td>
									<td align="center">주소</td>
									<td align="center">장소 명</td>
									<td align="center">신청자 ID</td>
									<td align="center">대관 날짜</td>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${list}" var="row">
								<tr>
									<td>&nbsp;&nbsp;${row.PB_NO}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.L_ADDR}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.L_SUBJECT}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.M_ID}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.U_DATE}&nbsp;&nbsp;</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</c:when>
						<c:otherwise>
								<br>
								예약된 장소가 없습니다.
						</c:otherwise>
						</c:choose>
							<div class="row" >
							<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft"  style=" text-align: center" >
								<ul class="pagination" style="display: inline-block;">
									${pagingHtml}
								</ul> 
							</div>
							</div>
						</div>

						<br><br>

						

						<div class="search col-md-12" style="padding-top: 30px;">
							<form name="search_form" action="<c:url value="/admin/placeBook/list"/>" role="search" method="post" onsubmit="searchSubmit()">
								<div class="col-md-12">
									<div class="searchCategory col-md-offset-4" style="float: inherit; padding-left: 50px;">
										<select name="searchCategory" id="searchCategory" style="height: 33px;">
											<option value="id" selected="selected">ID</option>
											<option value="addr">주소</option>
											<option value="place">장소</option>
										</select>
									</div>
									<div>
										<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
										<input class="Searchbox" autocomplete="off" id="searchbox" type="text" name="searchWord" value=${searchWord }>
		
										<input type="submit" value="검색">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
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