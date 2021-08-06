<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>모임 등록!</title>
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
							<span class="heading-meta">GROUP GATHERING</span>
							<h2 class="colorlib-heading" style="margin-top: -10px;">Open Group</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
							<form action="Insert" name="g_form" method="post" enctype="multipart/form-data" id="g_form">
								<div class="col-md-12">
									<div class="selectb col-md-5" style="margin-bottom: 10px; height: 3.5em;">
										<select name="gg_category" id="gg_category" >
											<option value="default" >&nbsp;&nbsp;&nbsp;&nbsp;카테고리를 선택하세요!</option>
											<option value="실외활동">&nbsp;&nbsp;&nbsp;&nbsp;실외활동</option>
											<option value="패션">&nbsp;&nbsp;&nbsp;&nbsp;패션</option>
											<option value="맛집">&nbsp;&nbsp;&nbsp;&nbsp;맛집</option>
											<option value="게임">&nbsp;&nbsp;&nbsp;&nbsp;게임</option>
											<option value="게임">&nbsp;&nbsp;&nbsp;&nbsp;동물</option>
											<option value="보드게임">&nbsp;&nbsp;&nbsp;&nbsp;보드게임</option>
											<option value="전시/공연">&nbsp;&nbsp;&nbsp;&nbsp;전시/공연</option>
											<option value="취업/스터디">&nbsp;&nbsp;&nbsp;&nbsp;취업/스터디</option>
											<option value="춤">&nbsp;&nbsp;&nbsp;&nbsp;춤</option>
											<option value="독서/토론">&nbsp;&nbsp;&nbsp;&nbsp;독서/토론</option>
											<option value="음악">&nbsp;&nbsp;&nbsp;&nbsp;음악</option>
											<option value="언어교환">&nbsp;&nbsp;&nbsp;&nbsp;언어교환</option>
											<option value="여행">&nbsp;&nbsp;&nbsp;&nbsp;여행</option>
											<option value="웰빙">&nbsp;&nbsp;&nbsp;&nbsp;웰빙</option>
											<option value="공예">&nbsp;&nbsp;&nbsp;&nbsp;공예</option>
			  						 	</select>
			  						 </div>
			  						 <div class="col-md-5">
										<input class="form-control" type="text" name="gg_name" id="gg_name" placeholder="모임 명을 정해주세요">
									 </div>
						         </div>
						 		 
						 		 <div class="col-md-12" style="padding-bottom: 30px; padding-left: 0;">
						 		 	 <div class="col-md-4">
								 	 <input type="text" class="datetimepicker form-control" name="gg_date" id="gg_date" placeholder="모임 날짜 (클릭하면 달력이 생성됩니다)"></input>
					 			 	 </div>
						 		 </div>
						 		 
						 		 <!-- 주소 -->
						 		 <div class="form-group col-md-12">
			  						 <div class="col-md-6" style="padding-right: 0px;">
										 <input class="form-control" id="search_keyword_addr" type="text" name="" size="53%" onkeypress="searchAddrEnterKey();" maxlength="25" placeholder="모임이 열리는 장소를 검색하세요 !">
								     </div>
								 
									 <button class="btn btn-primary btn-send-message" style="height: 54px;" type="button" onclick="searchAddrEnterKey('13');"><i class="fa fa-search"></i></button>
						 		 </div>
						 		 
						 		 <div class="col-md-12" style="padding-bottom: 30px;">
						 		 	 <div class="form-group col-md-8">
  										 <div class="map_title">
  								 			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
   										 </div>
   									 </div>
						 
			  						 <div class="form-group col-md-8">
							  			 <input class="form-control" id="L_ADDR" type="text" name="gg_addr" size="73%" placeholder="지도를 클릭하면 주소가 자동으로 입력됩니다." maxlength="30">
									 </div>
						 
			  						 <div class="form-group col-md-8">
							   			 <input class="form-control" type="text" id="o_title" name="gg_place"  placeholder="장소명">
									 </div>
						 		 </div>
						 		 
			  					 <div class="form-group col-md-12">
			  					 	<div class="col-md-4" style="padding-left: 0;">
							 		 <input class="form-control " type="number" name="gg_total" id="gg_total" placeholder="모집 인원 (2인 이상)">
					 			 	</div>
					 			 	<div class="col-md-1" style="padding-top: 10px; padding-left: 1px;"><font color="gray" size="5">명</font></div>
					 			 </div>
						 
			  					 <div class="form-group col-md-12">
			  					 	<div class="col-md-4" style="padding-left: 0;">
							 		 <input class="form-control " type="number" name="gg_cost" id="gg_cost" placeholder="비용 (비용이 없다면 0을 적어주세요)">
								    </div>
								    <div class="col-md-1" style="padding-top: 10px; padding-left: 1px;"><font color="gray" size="5">원</font></div>
					 			 </div>
						 
			  					 <div class="form-group col-md-12">
			  					 	<div class="col-md-5" style="padding-left: 0;">
							 		 <input class="form-control " style="background-color: #ffe791" type="file" name="file">
								 	</div>
					 			 </div>
						 
			  					 <div class="form-group col-md-12">
			  					 	<div class="col-md-8" style="padding-left: 0;">
							 		 <textarea rows="30" cols="7" class="form-control" id="gg_detail" name="gg_detail" placeholder="상세 내용을 적어주세요"></textarea>
								    </div>
					 			 </div>
						 
			  					 <div class="form-group col-md-8" align="center" style="padding-top: 30px;">
			  					 	 <a href="http://localhost:8080/yogi/groupList"><input class="btn btn-primary btn-send-message" style="background-color: gray; border-color: gray" type="button" id="cancel" name="cancel" value="취소" /></a>
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

<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>

	<link rel="stylesheet" href="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.css">
	<script src="//mugifly.github.io/jquery-simple-datetimepicker/jquery.simple-dtpicker.js"></script>


<script type="text/javascript">

$(document).ready(function() {
    $("#insert").on("click", function(e) { //등록
       e.preventDefault();
		if($('#gg_category').val()=="default"){
			alert("카테고리를 선택하세요");
			return false;
		}
		else if($('#gg_name').val()==""){
			alert("모임 명을 입력해주세요");
			return false;
		}
		if($('#gg_date').val()==""){
			alert("날짜를 입력해주세요");
			return false;
		}
		else if($('#detail_addr').val()==""){
			alert("주소를 입력해주세요");
			return false;
		}
		else if($('#o_title').val()==""){
			alert("장소 명을 입력해주세요");
			return false;
		}
		else if($('#gg_total').val()==""){
			alert("모집 인원을 입력해주세요");
			return false;
		}
		else if($('#gg_total').val()=="0"){
			alert("모집 인원은 최소 2인입니다! 다시 입력해주세요");
			return false;
		}
		else if($('#gg_cost').val()==""){
			alert("비용을 입력해주세요");
			return false;
		}else{
		alert("모임 등록이 완료되었습니다 :3");
		fn_insertGroup();
		}
	});
    
    $('.datetimepicker').appendDtpicker({'locale':'ko'});
   

});

function fn_insertGroup(){
    var comSubmit = new ComSubmit("g_form");
    comSubmit.setUrl("<c:url value='/groupInsert' />");
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