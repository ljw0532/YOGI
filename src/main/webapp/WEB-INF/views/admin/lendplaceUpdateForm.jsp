<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>관리자 - 장소수정</title>
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

	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<link  href="<c:url value='/resources/datepicker/datepicker.css' />" rel="stylesheet">
	
	<style>
	.map_title { position: relative; width: 833px;   height:350px; margin-left: 2px; bottom:15px;}

	div.map_title{
   	border-color: gray;
   	border-style: solid;
  	border-width: thin;
  	position:relative;
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
		<li class="colorlib-active"><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
		<li><a href="http://localhost:8080/yogi/admin/adminpageView">AdminPage</a></li>
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
							<span class="heading-meta">L E N D P L A C E</span>
							<h2 class="colorlib-heading" style="margin-top: -10px;">Edit Place</h2>
						</div>
					</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
									<form id="up_form" name="up_form" method="post" enctype="multipart/form-data" >
									<input type="hidden" value="${map.L_NO}" name="L_NO">
										<div class="form-group" style="margin-top:-25px;">
											<input type="text" class="form-control" name="L_SUBJECT" id="L_SUBJECT" value="${map.L_SUBJECT }">
										</div>
										
										 <div class="map_title">
       									 <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
        								 </div>
        								 
        								 <div class="form-group">
										 <input class="form-control" id="L_ADDR" type="text" name="L_ADDR" size="73%" value="${map.L_ADDR}" readonly="readonly" maxlength="30">
										 </div>
										 
										<span class="heading-meta" style="margin-left: 55px; margin-top: 10px; ">대관 시작 날짜</span>
										<input type="hidden" data-toggle="datepicker1" name="L_SDATE" id="L_SDATE" ></input>
										<div id="datepicker-container1" style="position: relative; margin-top: -15px;"></div>
										
										<span class="heading-meta" style="margin-top: -256px; margin-left: 295px;">대관 종료 날짜</span>
										<input type="hidden" data-toggle="datepicker2" name="L_EDATE" id="L_EDATE" ></input>
										<div id="datepicker-container2" style="position: relative; left: 240px; top:-19px;"></div>
												
		
										<div class="form-group">
											<input type="number" class="form-control" name="L_ENABLE" id="L_ENABLE" value="${map.L_ENABLE }">
										</div>
										<div class="form-group">
											<input type="number" class="form-control" name="L_PAYMENT" id="L_PAYMENT" value="${map.L_PAYMENT }">
										</div>
										<div class="form-group">
											<textarea name="L_CONTENT" id="L_CONTENT" cols="30" rows="7" class="form-control" placeholder="내용">${map.L_CONTENT }</textarea>
										</div>
										
										<div class="form-group">
										<input class="form-control" type="file" id="L_REP_IMG" name="L_REP_IMG">
										</div>
										
										<div class="form-group">
											<input class="btn btn-primary btn-send-message" type="button" id="update" name="update" value="수정" onclick="#this" />
										</div>
									</form>
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
	
	<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services" onerror="alertify.log('지도 로드중 에러!')"></script>	
	<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
	<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
	<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>


	<script type="text/javascript">
	$(document).ready(function() {
	    $("#update").on("click", function(e) { //등록
	       e.preventDefault();
	       if($('#L_SUBJECT').val()==""){
	         alert("장소명을 입력해주세요.");
	         return false;
	       } else if($('#L_ADDR').val()==""){
	          alert("주소를 입력해주세요.");
	            return false;
	       } else if($('#L_SDATE').val()==""){
	          alert("대관 시작 날짜를 입력해주세요.");
	            return false;
	       } else if($('#L_EDATE').val()==""){
	          alert("대관 종료 날짜를 입력해주세요.");
	            return false;
	       } else if($('#L_ENABLE').val()==""){
	          alert("수용인원을 입력해주세요.");
	            return false;
	       } else if($('#L_PAYMENT').val()==""){
	          alert("비용을 입력해주세요.");
	            return false;
	       } else if($('#L_CONTENT').val()==""){
	          alert("내용을 입력해주세요");
	            return false;
	       } else if($('#L_REP_IMG').val()==""){
	         alert("대표이미지를 선택해주세요.");
	             return false;
	       }  else {
	          alert("장소 수정이 완료되었습니다 :3");
	       fn_updateLendplace();
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

	 
	 
	function fn_updateLendplace(){
	    var comSubmit = new ComSubmit("up_form");
	    comSubmit.setUrl("<c:url value='/lendplace/update' />");
	    comSubmit.submit();
	 }
	     
	      //지도
	      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new daum.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new daum.maps.ZoomControl();
map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addr2coord('${map.L_ADDR}', function(status, result) {

// 정상적으로 검색이 완료됐으면 
 if (status === daum.maps.services.Status.OK) {

    var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new daum.maps.Marker({
        map: map,
        position: coords
    });

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    
    var infowindow = new daum.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">${map.L_SUBJECT}</div>'
    });
    infowindow.open(map, marker);

    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
    map.setCenter(coords);
} 
});
</script>

</body>
</html>

