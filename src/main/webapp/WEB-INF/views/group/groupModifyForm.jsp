<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />
	<meta charset="utf-8">
	<meta name="description"content="">
	<meta name="author"content="">
	


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

	<!-- ?????? ?????? ????????? -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/font-awesome.min.css">

	<!-- ????????? ?????? -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap_my/css/selectBox.css">
	
	<!-- Modernizr JS -->
	<script src="/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	<link  href="<c:url value='/resources/datepicker/datepicker.css' />" rel="stylesheet">


	
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function modify() {
		var g = document.groupinput
		
		if(g.gg_addr.value == ""){
			alert("????????? ??????????????????");
			g.gg_addr.focus();
			return false;
		}
		if(g.gg_place.value == ""){
			alert("?????? ?????? ??????????????????");
			g.gg_place.focus();
			return false;
		}
		alert("?????? ????????? ????????????????????? :3");
		g.submit();
		
		
	}
	
	var sel_file;
	
	$(document).ready(function(){
		$("#input_img").on("change", handleImgFileSelect);
	});
	
	function handleImgFileSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f) {
			if(!f.type.match("image.*")){
				alert("???????????? ????????? ???????????? ???????????????.");
				return;
			}
			
			sel_file = f;
			
			var reader = new FileReader();
			reader.onload = function(e){
				$("#img").attr("src",e.target.result);
				$("#img").attr("style","height: 200px; width: 280px;");
			}
			reader.readAsDataURL(f);
		});
	}
</script>
<style>
.map_title { position: relative; width: 730px;   height:350px; margin-left: 2px;}

div.map_title{
   border-color: gray;
   border-style: solid;
   border-width: thin;
   position:relative;

}

.img_wrap{
	width: 300px;
	margin-top: 50px;
}

.img_wrap img{
	max-width: 100%;
}
</style>
</head>
<body>
<div id="colorlib-page">
	<!-- ?????? ???????????? -->
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
			<h1 id="colorlib-logo"><a href="http://localhost:8080/yogi/main">YOGI</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="http://localhost:8080/yogi/main">Home</a></li>
					<li class="colorlib-active"><a href="http://localhost:8080/yogi/groupList">Group</a></li>
					<li><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
					<c:choose>
					<c:when test="${session_m_lv =='?????????'}">
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

		<!-- ?????? ?????? ??? -->
		<div id="colorlib-main">
			<div class="colorlib-contact">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">GROUP GATHERING</span>
							<h2 class="colorlib-heading" style="margin-top: -10px;">Modify Group</h2>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
							<form action="groupModify" name="groupinput" method="post" enctype="multipart/form-data">
								<input type="hidden" name="m_no" value="${gModel.M_NO }">
								<input type="hidden" name="gg_no" value="${gModel.GG_NO }">
								<input type="hidden" name="wt_name" value="${gModel.WT_NAME }">
								
								<div class="form-group col-md-12">
									<div class="col-md-2" style="padding-left: 0;">
										<font class="form-control" >${gModel.GG_CATEGORY }</font>
								   </div>
			  					 	<div class="col-md-5" style="padding-left: 0;">
										<font class="form-control" >${gModel.GG_NAME}</font>
								    </div>
					 			</div>
								
								<div class="form-group col-md-12" style="padding-bottom: 50px;">
			  					 	<div class="col-md-4" style="padding-left: 0;">
										<font class="form-control" >${gModel.GG_DATE}</font>
									</div>
					 			</div>
								
								<!-- ?????? -->
						 		 <div class="form-group col-md-12">
			  						 <div class="col-md-6" style="padding-right: 0px; padding-left: 0px;">
										 <input class="form-control" id="search_keyword_addr" type="text" name="" size="53%" onkeypress="searchAddrEnterKey();" maxlength="25" placeholder="????????? ????????? ????????? ??????????????? !">
								     </div>
								 
									 <button class="btn btn-primary btn-send-message" style="height: 54px;" type="button" onclick="searchAddrEnterKey('13');"><i class="fa fa-search"></i></button>
						 		 </div>
						 		 
						 		 <div class="col-md-12" style="padding-bottom: 50px;">
						 		 	 <div class="form-group col-md-8">
  										 <div class="map_title">
  								 			<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
   										 </div>
   									 </div>
						 
			  						 <div class="form-group col-md-8">
							  			 <input class="form-control" id="L_ADDR" type="text" name="gg_addr" size="73%" placeholder="${gModel.GG_ADDR }" maxlength="30">
									 </div>
						 
			  						 <div class="form-group col-md-8">
							   			 <input class="form-control" type="text" id="o_title" name="gg_place"  placeholder="${gModel.GG_PLACE }">
									 </div>
						 		 </div>

						 		 <div class="form-group col-md-12">
			  					 	<div class="col-md-2" style="padding-left: 0;">
										<font class="form-control" >${gModel.GG_TOTAL}</font>
								 	</div>
								 	<div class="col-md-2" style="padding-left: 0; padding-top: 10px;">
										 <font color="gray" size="5">???</font>
								 	</div>
					 		 	 </div>
								 
								 <div class="form-group col-md-12" style="padding-bottom: 50px;">
			  					 	<div class="col-md-2" style="padding-left: 0;">
										 <font class="form-control" >${gModel.GG_COST}</font>
									</div>
									<div class="col-md-2" style="padding-left: 0; padding-top: 10px;">
										 <font color="gray" size="5">???</font>
								 	</div>
					 			 </div>
					 			 
								 <div class="form-group col-md-12">
								 	<div class="col-md-3" style="padding-left: 0;">
								 	<br/><br/>
										<font color="gray" size="3" style="padding-top: 10px; padding-left: 1px;">?????? ????????? ???</font><br/>
			  					 		<img alt="" src="/yogi/resources/upload/${gModel.GG_RFN }" style="height: 200px; width: 280px;">
			  					 	</div>
			  					 	<div class="col-md-3" style="padding-left: 0;">
			  					 		<font color="gray" size="3" style="padding-top: 10px; padding-left: 1px;">????????? ????????? ???</font><br/>
										<input class="form-control col-md-3" style="background-color: #ffe791" type="file" name="file" id="input_img" >
										<div class="img_wrqp">
								 			<img id="img">
								 		</div>
								 	</div>
					 			 </div>
					 			 
								 <div class="form-group col-md-12">
								 	<br/><br/>
			  					 	<div class="col-md-8" style="padding-left: 0;">
										 <textarea rows="30" cols="7" class="form-control" name="gg_detail" id="gg_detail" placeholder="${gModel.GG_DETAIL }"></textarea>
								 	</div>
					 			 </div>
	
								 <div class="form-group col-md-8" align="center" style="padding-top: 30px;">
									 <a href="http://localhost:8080/yogi/groupDetail?gg_no=${gModel.GG_NO}"><input class="btn btn-primary btn-send-message" style="background-color: gray; border-color: gray;" type="button" id="cancel" name="cancel" value="??????" /></a>
									 <input class="btn btn-primary btn-send-message" type="button" value="??????" onclick="modify()"/>
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


<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services"></script>

<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script type="text/javascript">
//??????
var mapContainer = document.getElementById('map'), // ????????? ????????? div 
    mapOption = {
       center : new daum.maps.LatLng(37.566826, 126.9786567), // ????????? ????????????
       level : 3
    // ????????? ?????? ??????
    };

    // ????????? ???????????????    
    var map = new daum.maps.Map(mapContainer, mapOption);

    // ?????? ?????? ????????? ???????????????
    var ps = new daum.maps.services.Places(); 
    var searchAddr = document.getElementById('search_keyword_addr');
    function searchAddrEnterKey(btn){
        if(event.keyCode == 13 || btn==13) {
          ps.keywordSearch(searchAddr.value, placesSearchCB); 
       }
    }
    
    // ????????? ?????? ?????? ??? ???????????? ???????????? ?????????
    function placesSearchCB (status, data, pagination) {
        if (status === daum.maps.services.Status.OK) {

            // ????????? ?????? ????????? ???????????? ?????? ????????? ?????????????????????
            // LatLngBounds ????????? ????????? ???????????????
            var bounds = new daum.maps.LatLngBounds();

            for (var i=0; i<data.places.length; i++) {
                displayMarker(data.places[i]);    
                bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
            }       
            // ????????? ?????? ????????? ???????????? ?????? ????????? ??????????????????
            map.setBounds(bounds);
        } 
    }

    // ????????? ????????? ???????????? ???????????????
    function displayMarker(place) {
        // ????????? ???????????? ????????? ???????????????
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
                // ????????? ???????????? ???????????? ?????????????????? ???????????????
                  infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.title + '</div>');
                  infowindow.open(map, marker);
             }
          });
        });
    }
    
    // ??????-?????? ?????? ????????? ???????????????
    var geocoder = new daum.maps.services.Geocoder();
    var marker = new daum.maps.Marker() // ????????? ????????? ????????? ???????????????
     ,infowindow = new daum.maps.InfoWindow({
       zindex : 1
    });  // ????????? ????????? ?????? ????????? ????????? ????????????????????????
    
    // ????????? ???????????? ??? ?????? ?????? ????????? ?????? ??????????????? ??????????????? ???????????? ???????????????
    daum.maps.event.addListener(map, 'click', function(mouseEvent) {
       searchDetailAddrFromCoords(mouseEvent.latLng, function(status, result) {
          if (status === daum.maps.services.Status.OK) {
             var detailAddr = !!result[0].roadAddress.name ? result[0].roadAddress.name : result[0].jibunAddress.name;
             document.getElementById('detail_addr').value=detailAddr;
             
             // ????????? ????????? ????????? ??????????????? 
             marker.setPosition(mouseEvent.latLng);
             marker.setMap(map);
             
             // ?????????????????? ????????? ????????? ?????? ????????? ?????? ??????????????? ???????????????
             infowindow.setContent('<div style="padding:5px;font-size:12px;">' + detailAddr + '</div>');
             infowindow.open(map, marker);
          }
       });
    });

    function searchAddrFromCoords(coords, callback) {
       geocoder.coord2addr(coords, callback); // ????????? ????????? ?????? ????????? ???????????????
    }

    function searchDetailAddrFromCoords(coords, callback) {
       geocoder.coord2detailaddr(coords, callback); // ????????? ????????? ?????? ?????? ????????? ???????????????
    }
</script>
</body>
</html>