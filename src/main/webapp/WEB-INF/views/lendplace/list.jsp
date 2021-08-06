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
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta charset="UTF-8">
	<title>장소 목록</title>
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

	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<link  href="<c:url value='/resources/datepicker/datepicker.css' />" rel="stylesheet">
	
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/checkBox.css">
	</head>
	<body>
	
	<!-- 사이드 바 -->
<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
	<h1 id="colorlib-logo"><a href="http://localhost:8080/yogi/main">YOGI</a></h1>
	<nav id="colorlib-main-menu" role="navigation">
	<ul>
		<li><a href="http://localhost:8080/yogi/main">Home</a></li>
		<li><a href="http://localhost:8080/yogi/groupList">Group</a></li>
		<li class="colorlib-active"><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
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
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --><span>Demo Images: <a href="http://nothingtochance.co/" target="_blank">nothingtochance.co</a></span></small></p>
<span>MADE BY: <a href="">YOMI</a></span>
	</div>
</aside>

<!-- 사이드 바 -->


		<div id="colorlib-main">

			<div class="colorlib-blog">
				<div class="colorlib-narrow-content">
				<div class="row">
						<div class="col-md-6 col-md-offset-3 col-md-pull-3 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">Lendplace</span>
							<h2 class="colorlib-heading">Lendplace List</h2>
						</div>
				</div>
				
				<div class="row">
						<form name="search_form" action="<c:url value='/lendplace/list' />" role="search" method="post"  onsubmit="searchSubmit()" style="height: 230px;">
						
						<div style="position: relative; left: 0px; top: 10px;">
						<input id="currentPageNo" type="hidden" name="currentPageNo" value="${currentPageNo }">
						<input id="searchAddr" type="hidden" name="searchAddr">
						키워드 검색 
						<input autocomplete="off" class="searchbox" id="searchWord" type="text" name="searchWord" maxlength="10" placeholder="예)역삼동,음향,주차 등" style="background-color:transparent;" />
						<br><br>
						   비용 검색
						<input autocomplete="off" class="min_pay" type="text" name="min_pay" id="min_pay" size="13" placeholder="0" style="background-color:transparent;"> - 
						<input autocomplete="off" class="max_pay" type="text" name="max_pay" id="max_pay" size="13" placeholder="0" style="background-color:transparent;">
						<br><br><br>
						<input class="btn btn-primary btn-learn" style="position: relative; left: 140px;" type="submit" value="검색">
						</div>
						
						<div style="position: relative; left: 240px; top: -250px;">
						<input type="checkbox" style="margin-top:67px; margin-left:90px; "name="area" value="종로구">종로구
						<input type="checkbox" style="margin-left:47px;" name="area" value="중구">중구
						<input type="checkbox" style="margin-left:58px;" name="area" value="용산구">용산구
						<input type="checkbox" style="margin-top:15px; margin-left:44px;" name="area" value="송파구">송파구
						<br>
						<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="광진구">광진구
						<input type="checkbox" style="margin-left:47px;" name="area" value="동대문구">동대문구
						<input type="checkbox" style="margin-left:32px;" name="area" value="중랑구">중랑구
						<input type="checkbox" style="margin-left:44px;" name="area" value="동작구">동작구
						<br>
						<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="강북구">강북구
						<input type="checkbox" style="margin-left:47px;" name="area" value="도봉구">도봉구
						<input type="checkbox" style="margin-left:45px;" name="area" value="노원구">노원구
						<input type="checkbox" style="margin-left:44px;" name="area" value="강서구">강서구
						<br>
						<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="서대문구">서대문구
						<input type="checkbox" style="margin-left:34px;" name="area" value="마포구">마포구
						<input type="checkbox" style="margin-left:45px;" name="area" value="양천구">양천구
						<input type="checkbox" style="margin-top:15px; margin-left:44px;" name="area" value="은평구">은평구 
						<br>
						<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="구로구">구로구
						<input type="checkbox" style="margin-left:47px;" name="area" value="금천구">금천구
						<input type="checkbox" style="margin-left:45px;" name="area" value="영등포구">영등포구
						<input type="checkbox" style="margin-left:31px;" name="area" value="성북구">성북구
						<br>
						<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="관악구">관악구
						<input type="checkbox" style="margin-left:47px;" name="area" value="서초구">서초구
						<input type="checkbox" style="margin-left:45px;" name="area" value="강남구">강남구
						<input type="checkbox" style="margin-left:44px;" name="area" value="성동구">성동구
						<br>
						<input type="checkbox" style="margin-top:15px; margin-left:90px;" name="area" value="강동구">강동구
						</div>
						
						<div style="position: relative; left: 730px; top: -550px;">
						<h4 style="position: relative; left: 85px; top: 65px;">시작</h4>
						<h4 style="position: relative; left: 325px; top: 15px;">종료</h4>
							<input type="hidden" data-toggle="datepicker1" name="l_sdate"></input>
							<div id="datepicker-container1" style="position: relative; left: 0px; top: -15px;"></div>
							<input type="hidden" data-toggle="datepicker2" name="l_edate"></input>
							<div id="datepicker-container2" style="position: relative; left: 240px; top: -255px;"></div>
						</div>
						</form>
				</div>
					<br><br>
					
					<c:choose>
						<c:when test="${fn:length(list) > 0 }">
						<c:forEach items="${list }" var="row" varStatus="status">
							<c:if test="${status.index % 4 == 0}"> <!-- 한 줄에 몇개의 게시물이 나오는지 설정하는곳  -->
								<tr>
							</c:if>
									<div class="col-md-4 col-sm-6 animate-box" data-animate-effect="fadeInLeft">
										<div class="blog-entry">
										<a href="#this" name="title" class="blog-img">
										<input type="hidden" id="L_NO" value="${row.L_NO}">
										<img src="/yogi/resources/upload/${row.L_REP_IMG}" onERROR="this.src='/yogi/resources/image/image_error.jpeg'" class="img-responsive" style="width: 340px; height: 300px;"/></a>
											<div class="desc">
											<span><small>${row.L_SDATE} ~ ${row.L_EDATE}</small> | <small> ${row.L_PAYMENT}원 </small> | <small> <i class="icon-bubble3"></i>${row.L_ENABLE}명</small></span>
											<h3><a href="#this" name="title">${row.L_SUBJECT}<input type="hidden" id="L_NO" value="${row.L_NO}"></a></h3>
											<p>${row.L_ADDR}</p>
											</div>
										</div>
									</div>
						</c:forEach>
						</c:when>
	
						<c:otherwise>
							등록된 장소가 없습니다.
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
			</div>
			<a href="<c:url value='/admin/lendplace/Form'/>">글쓰기</a>
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
	
	<%@ include file="/WEB-INF/include/common-body.jspf"%>
	<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
	<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
	<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
	<script>
		$(document).ready(function() {
			if ("${session_m_no}" == "") {
				alert('로그인이 필요합니다!');
				window.location = "/yogi/first";
			}
			
			$("a[name='title']").on("click", function(e) { //신청
				/* 태그의 기본 기능을 제거 */
				e.preventDefault();
				fn_selectLendplaceDetail($(this));
				
				});
			$('#searchbox').keypress(function(event) {
				if (event.keyCode == 13) { //여기서 keyCode 13은 엔터키를 의미한다.
					searchSubmit();
				}
			});
					
			var l_sdate = $('[data-toggle="datepicker1"]').datepicker({
		 		  language: 'ko-KR',
		 		  inline: true,
		 		  container: '#datepicker-container1',
		 		  format: 'yyyy-mm-dd'
		 	      	}).on('pick.datepicker', function (e) {
		 	    		l_edate.datepicker('setStartDate', e.date);
		 			}),
		 		l_edate = $('[data-toggle="datepicker2"]').datepicker({
			 		  language: 'ko-KR',
			 		  inline: true,
			 		  container: '#datepicker-container2',
			 		  format: 'yyyy-mm-dd'
			 	 });	
		});
		
		
		function fn_selectLendplaceDetail(obj) {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/lendplace/detail' />");
			comSubmit.addParam("L_NO",obj.parent().find("#L_NO").val());
			comSubmit.addParam("currentPageNo", "${currentPageNo}");
			comSubmit.submit();
		}
			
	    	    
		function searchSubmit(){
		 	  var areaSize = "";
		 	  $("input[name=area]:checked").each(function() {
		 	  	if(areaSize == ""){
		 	 		areaSize = $(this).val();
		 	  	} else {
		 	  		areaSize = areaSize + "|" + $(this).val();
		 	  	}
		 	  });
		 			
		 	  if(areaSize.length > 0){
		 		$('#searchAddr').val(areaSize);
		 	  }
		 	  document.search_form.submit();
		} 
			 
	</script>
	</body>
</html>

