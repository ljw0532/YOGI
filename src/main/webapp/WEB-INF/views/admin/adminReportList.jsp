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
		
		var memberActiveSize = "";
		$("input[name=MemberActive]:checked").each(function() {
			if(memberActiveSize == ""){
				memberActiveSize = $(this).val();
			} else {
				memberActiveSize = memberActiveSize + "|" + $(this).val();
			}
		});
		if(memberActiveSize.length > 0){
			$('#searchMemberActive').val(memberActiveSize);
		}
		
		var groupActiveSize = "";
		$("input[name=GroupActive]:checked").each(function() {
			if(groupActiveSize == ""){
				groupActiveSize = $(this).val();
			} else {
				groupActiveSize = groupActiveSize + "|" + $(this).val();
			}
		});
		if(groupActiveSize.length > 0){
			$('#searchGroupActive').val(groupActiveSize);
		}
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
						<h2 class="colorlib-heading">Report List</h2>
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
									<td align="center">no.</td>
									<td align="center">모임 이름</td>
									<td align="center">모임 카테고리</td>
									<td align="center">주최자ID</td>
									<td align="center">신고자no.</td>
									<td align="center">사유</td>
									<td align="center" colspan="2">비활성화(페널티포인트)</td>
								</tr>
								</thead>
								<tbody>
								<c:forEach items="${list}" var="row">
								<tr>
									<td>&nbsp;&nbsp;${row.R_NO}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.GG_NAME}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.GG_CATEGORY}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.M_ID}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.M_NO}&nbsp;&nbsp;</td>
									<td>&nbsp;&nbsp;${row.R_COMMENT}&nbsp;&nbsp;</td>
									<td>
									<c:if test="${row.M_ACTIVE == 0}">
										<a href="#this" name="inactivateMember">&nbsp;&nbsp;멤버(${row.M_PENALTY})&nbsp;&nbsp;</a><input type="hidden" id="M_NO" value="${row.M_NO}">
									</c:if>	
									<c:if test="${row.M_ACTIVE == 1 }">
										<font color="red">&nbsp;&nbsp;X(${row.M_PENALTY})&nbsp;&nbsp;</font>
									</c:if>
									</td>
									<td>
									<c:if test="${row.GG_ACTIVE == 0}">	
										<a href="#this" name="inactivateGroup">&nbsp;&nbsp;모임(${row.GG_PENALTY})&nbsp;&nbsp;</a><input type="hidden" id="GG_NO" value="${row.GG_NO}">
									</c:if>
									<c:if test="${row.GG_ACTIVE == 1}">
										<font color="red">&nbsp;&nbsp;X(${row.GG_PENALTY})&nbsp;&nbsp;</font>
									</c:if>
									</td>
								</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
								<br>
								신고가 없습니다.
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
							<form name="search_form" action="<c:url value="/admin/report/list"/>" role="search" method="post" onsubmit="searchSubmit()">
								<div class="MemberActive col-md-12" align="center">
									<input type="checkbox" name="MemberActive" value="O">활성 멤버&nbsp;
									<input type="checkbox" name="MemberActive" value="X">비활성 멤버
								</div>
								<div class="GroupActive col-md-12" align="center">
									<input type="checkbox" name="GroupActive" value="O">활성 모임&nbsp;
									<input type="checkbox" name="GroupActive" value="X">비활성 모임
								</div>
								<div class="col-md-12">
									<div class="searchCategory col-md-offset-4" style="float: inherit; padding-left: 50px;">
										<select name="searchCategory" id="searchCategory" style="height: 33px;">
											<option value="id" selected="selected">ID</option>
											<option value="groupName">그룹 이름</option>
											<option value="category">그룹 카테고리</option>
											<option value="penaltyMember">회원 페널티 점수</option>
											<option value="penaltyGroup">그룹 페널티 점수</option>
										</select>
									</div>
									<div>
										<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
										<input id="searchMemberActive" type="hidden" name="searchMemberActive" value="${searchMemberActive }">
										<input id="searchGroupActive" type="hidden" name="searchGroupActive" value="${searchGroupActive }">
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
	
<form id="commonForm" name="commonForm"></form>
<script type="text/javascript">
		$(document).ready(function() {
			$("a[name='inactivateMember']").on("click", function(e) { //비활성화
				e.preventDefault();
				fn_inactivateMember($(this));
			});
			$("a[name='inactivateGroup']").on("click", function(e) { //비활성화
				e.preventDefault();
				fn_inactivateGroup($(this));
			});
		});
		
		function fn_inactivateMember(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/member/inactivateMember' />");
			comSubmit.addParam("M_NO", obj.parent().find("#M_NO").val());
			comSubmit.submit();
		}
		
		function fn_inactivateGroup(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/admin/group/inactivateGroup' />");
			comSubmit.addParam("GG_NO", obj.parent().find("#GG_NO").val());
			comSubmit.submit();
		}
		
</script>
</body>
</html>