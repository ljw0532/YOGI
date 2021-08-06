<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>관리자 - 장소등록</title>
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
							<h2 class="colorlib-heading" style="margin-top: -10px;">Place Registration</h2>
						</div>
					</div>
							<div class="row">
								<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
									<form action="Insert" id="lp_form" name="lp_form" method="post" enctype="multipart/form-data">
										<div class="form-group" style="margin-top:-25px;">
											<input type="text" class="form-control" name="L_SUBJECT" id="L_SUBJECT" placeholder="장소명">
										</div>
										
										<div class="form-group">
										<input class="form-control" id="search_keyword_addr" type="text" name="" size="30%" onkeypress="searchAddrEnterKey();" maxlength="25" placeholder="주소를 검색하세요 !" style="width: 700px;">
     									<input class="btn btn-primary btn-send-message" type="button" value="검색" onclick="searchAddrEnterKey('13');">
     									 </div>
     									 
										 <div class="map_title">
       									 <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
        								 </div>
        								 
        								 <div class="form-group">
										 <input class="form-control" id="L_ADDR" type="text" name="L_ADDR" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30">
										 </div>
										 
										<span class="heading-meta" style="margin-left: 55px; margin-top: 10px; ">대관 시작 날짜</span>
										<input type="hidden" data-toggle="datepicker1" name="L_SDATE" id="L_SDATE" ></input>
										<div id="datepicker-container1" style="position: relative; margin-top: -15px;"></div>
										
										<span class="heading-meta" style="margin-top: -256px; margin-left: 295px;">대관 종료 날짜</span>
										<input type="hidden" data-toggle="datepicker2" name="L_EDATE" id="L_EDATE" ></input>
										<div id="datepicker-container2" style="position: relative; left: 240px; top:-19px;"></div>
												
		
										<div class="form-group">
											<input type="number" class="form-control" name="L_ENABLE" id="L_ENABLE" placeholder="수용인원">
										</div>
										<div class="form-group">
											<input type="number" class="form-control" name="L_PAYMENT" id="L_PAYMENT" placeholder="비용">
										</div>
										<div class="form-group">
											<textarea name="L_CONTENT" id="L_CONTENT" cols="30" rows="7" class="form-control" placeholder="내용"></textarea>
										</div>
										
										<div class="form-group">
										<input class="form-control" type="file" id="L_REP_IMG" name="L_REP_IMG">
										</div>
										
										<div class="form-group">
											<input class="btn btn-primary btn-send-message" type="button" id="insert" name="insert" value="등록" onclick="#this" />
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
	    $("#insert").on("click", function(e) { //등록
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
	          alert("장소 등록이 완료되었습니다 :3");
	       fn_insertLendplace();
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

	 
	 
	 function fn_insertLendplace(){
	    var comSubmit = new ComSubmit("lp_form");
	    comSubmit.setUrl("<c:url value='/admin/lendplace/Insert' />");
	    comSubmit.submit();
	 } 
	     
	      //지도
	     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	         mapOption = {
	            center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	            level : 3
	         // 지도의 확대 레벨
	         };

	         // 지도를 생성합니다    
	         var map = new daum.maps.Map(mapContainer, mapOption);

	         // 장소 검색 객체를 생성합니다
	         var ps = new daum.maps.services.Places(); 
	         var searchAddr = document.getElementById('search_keyword_addr');
	         function searchAddrEnterKey(btn){
	             if(event.keyCode == 13 || btn==13) {
	               ps.keywordSearch(searchAddr.value, placesSearchCB); 
	            }
	         }
	         
	         // 키워드 검색 완료 시 호출되는 콜백함수 입니다
	         function placesSearchCB (status, data, pagination) {
	             if (status === daum.maps.services.Status.OK) {

	                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	                 // LatLngBounds 객체에 좌표를 추가합니다
	                 var bounds = new daum.maps.LatLngBounds();

	                 for (var i=0; i<data.places.length; i++) {
	                     displayMarker(data.places[i]);    
	                     bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
	                 }       
	                 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	                 map.setBounds(bounds);
	             } 
	         }

	         // 지도에 마커를 표시하는 함수입니다
	         function displayMarker(place) {
	             // 마커를 생성하고 지도에 표시합니다
	             var marker = new daum.maps.Marker({
	                 map: map,
	                 position: new daum.maps.LatLng(place.latitude, place.longitude) 
	             });

	             daum.maps.event.addListener(marker, 'click', function() {
	                searchDetailAddrFromCoords(new daum.maps.LatLng(place.latitude, place.longitude), function(status, result) {
	                  if (status === daum.maps.services.Status.OK) {
	                     var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
	                     document.getElementById('L_ADDR').value=detailAddr;
	                     document.getElementById('o_title').value=place.title;
	                     // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	                       infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
	                       infowindow.open(map, marker);
	                  }
	               });
	             });
	         }
	         
	         // 주소-좌표 변환 객체를 생성합니다
	         var geocoder = new daum.maps.services.Geocoder();
	         var marker = new daum.maps.Marker() // 클릭한 위치를 표시할 마커입니다
	          ,infowindow = new daum.maps.InfoWindow({
	            zindex : 1
	         });  // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	         
	         // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	         daum.maps.event.addListener(map, 'click', function(mouseEvent) {
	            searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
	               if (status === daum.maps.services.Status.OK) {
	                  var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
	                  document.getElementById('detail_addr').value=detailAddr;
	                  
	                  // 마커를 클릭한 위치에 표시합니다 
	                  marker.setPosition(mouseEvent.latLng);
	                  marker.setMap(map);
	                  
	                  // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	                  infowindow.setContent('<div style="padding:5px;font-size:12px;">' + detailAddr + '</div>');
	                  infowindow.open(map, marker);
	               }
	            });
	         });

	         function searchAddrFromCoords(coords, callback) {
	            geocoder.coord2addr(coords, callback); // 좌표로 행정동 주소 정보를 요청합니다
	         }

	         function searchDetailAddrFromCoords(coords, callback) {
	            geocoder.coord2detailaddr(coords, callback); // 좌표로 법정동 상세 주소 정보를 요청합니다
	         }
</script>

</body>
</html>

