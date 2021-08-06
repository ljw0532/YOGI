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
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>장소 상세보기</title>
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
	
	<!-- 별점 -->
	<link rel="stylesheet" href="/yogi/resources/bootstrap/css/star.css">
	
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

			<div class="colorlib-about">
				<div class="colorlib-narrow-content">
					<div class="row row-bottom-padded-md">
						<div class="col-md-6" style="position:relative; width: 62%;">
							<div class="about-img animate-box" data-animate-effect="fadeInLeft"><img src="/yogi/resources/upload/${map.L_REP_IMG}" onERROR="this.src='/yogi/resources/image/image_error.jpeg'" style="width: 600px; height: 550px;"/>
							</div>
						</div>
						<div class="col-md-6 a nimate-box" data-animate-effect="fadeInLeft" style="position:relative; width: 38%;">
							<div class="about-desc">
								<span class="heading-meta">Welcome</span>
								<h2 class="colorlib-heading">${map.L_SUBJECT}</h2>
								<div style="position:relative; top: -35px;">
								<h5>${map.L_ENABLE}명</h5>
								<h5>${map.L_PAYMENT}원</h5>
								<h5>${map.L_SDATE} ~ ${map.L_EDATE}</h5>
								<h4>${map.L_ADDR}&nbsp;(${map.L_SUBJECT})</h4>
								</div>
								<form name="apply_form" action="<c:url value='/lendplace/apply' />"  method="post">
								<input type="hidden" name="L_NO" value="${map.L_NO}"><input type="hidden" name="M_NO" value="${session_m_no}">
								<input type="hidden" data-toggle="datepicker" name="U_DATE" id="U_DATE"></input> 
								<div id="datepicker-container" style="position: relative; left: 10px; top: -20px;"></div>
								<a href="#this" class="btn btn-primary btn-learn" name="apply" style="position: relative; left: 290px; top: -65px;">신청</a> 
								<a href="<c:url value='/lendplace/list'/>" class="btn btn-primary btn-learn" style="position: relative; left: 300px; top: -65px;">목록</a>
								</form>
							</div>
						</div>
					</div>
					<div class="row" style="position: relative; top:-70px;">
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft" style="position: relative; width: 60%; height: 420px;">
							<h2 class="colorlib-heading">Content</h2>
							<p>${map.L_CONTENT2}</p>
						</div>
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft" style="position:relative; width:40%; height:300px; top: 0px;">
							<h2 class="colorlib-heading">Location</h2>
							<div id="map"  class="om_detail_contet_map" style="position: relative;  height: 400px;"></div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
							<h2 class="colorlib-heading">Review</h2>
							<h3>평점 : ${rate}
							<span class="star-input"><span class="input">
							<c:choose>
							<c:when test="${rate==1}">
								<input type="radio" checked><label for="p1"></label>		
							</c:when>
							<c:when test="${rate==2}">
								<input type="radio" checked><label for="p2"></label>		
							</c:when>
							<c:when test="${rate==3}">
								<input type="radio" checked><label for="p3"></label>		
							</c:when>
							<c:when test="${rate==4}">
								<input type="radio" checked><label for="p4"></label>		
							</c:when>
							<c:when test="${rate==5}">
								<input type="radio" checked><label for="p5"></label>		
							</c:when>
							<c:when test="${rate==6}">
								<input type="radio" checked><label for="p6"></label>		
							</c:when>
							<c:when test="${rate==7}">
								<input type="radio" checked><label for="p7"></label>		
							</c:when>
							<c:when test="${rate==8}">
								<input type="radio" checked><label for="p8"></label>		
							</c:when>
							<c:when test="${rate==9}">
								<input type="radio" checked><label for="p9"></label>		
							</c:when>
							<c:when test="${rate==10}">
								<input type="radio" checked><label for="p10"></label>		
							</c:when>
							</c:choose>
							</span></span>
							</h3>
							<div style="border: 1px solid; width: 600px; padding: 5px">
    							<form name="review_form" id="review_form" action="<c:url value='/lendplace/insertReview' />" method="post">
        						<input type="hidden" name="L_NO" value="<c:out value="${map.L_NO}"/>"> 
        						<input type="hidden" name="M_NO" value="<c:out value="${session_m_no}"/>">
        						<c:if  test = "${fn:length(check) == 0}">
        						<span class="star-input">
  								<span class="input">
    								<input type="radio" name="star-input" id="p1" value="1"><label for="p1">1</label>
    								<input type="radio" name="star-input" id="p2" value="2"><label for="p2">2</label>
    								<input type="radio" name="star-input" id="p3" value="3"><label for="p3">3</label>
    								<input type="radio" name="star-input" id="p4" value="4"><label for="p4">4</label>
    								<input type="radio" name="star-input" id="p5" value="5"><label for="p5">5</label>
    								<input type="radio" name="star-input" id="p6" value="6"><label for="p6">6</label>
    								<input type="radio" name="star-input" id="p7" value="7"><label for="p7">7</label>
    								<input type="radio" name="star-input" id="p8" value="8"><label for="p8">8</label>
    								<input type="radio" name="star-input" id="p9" value="9"><label for="p9">9</label>
    								<input type="radio" name="star-input" id="p10" value="10"><label for="p10">10</label>
  								</span>
  									<output for="star-input"><b>0</b>점</output>
								</span>
        						</c:if>
        						<textarea name="R_CONTENT" id="R_CONTENT" rows="3" cols="60" maxlength="500" placeholder="후기를 달아주세요."></textarea>
        						<a href="#" onclick="fn_insertReview()">저장</a>
    							</form>
							</div>

							<c:forEach var="reviewlist" items="${list}" varStatus="status">
							<fmt:parseNumber var = "blank" type = "number" value = "${reviewlist.R_DEPTH}" />
    						<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*blank}"/>px; display: inline-block">
        						<c:choose>
        							<c:when test="${reviewlist.R_DELETEFLAG eq 'Y'}">
        								삭제된 댓글입니다.
        							<c:if test="${session_m_id == reviewlist.M_ID}">
        								<a href="#" onclick="fn_deleteReview('<c:out value="${reviewlist.R_NO}"/>')">삭제</a>
        							</c:if>
        							</c:when>
        							<c:otherwise>
	        							<c:out value="${reviewlist.M_ID}"/> <c:out value="${reviewlist.R_DATE}"/>
	        							<c:if test="${session_m_id == reviewlist.M_ID}">
        									<a href="#" onclick="fn_deleteReview('<c:out value="${reviewlist.R_NO}"/>','<c:out value="${reviewlist.R_GROUP}"/>')">삭제</a>
        									<a href="#" onclick="fn_reviewUpdate('<c:out value="${reviewlist.R_NO}"/>')">수정</a>
        								</c:if>
        									<a href="#" onclick="fn_reviewReply('<c:out value="${reviewlist.R_NO}"/>')">댓글</a>
        								<br/>
        								<div id="review<c:out value="${reviewlist.R_NO}"/>">	
        									<c:out value="${reviewlist.R_CONTENT}"/>
        								</div>
        							</c:otherwise>
        						</c:choose>
    						</div>
							</c:forEach>

							<div id="reviewDiv" style="width: 99%; display:none">
    							<form name="form2" id="form2" action="<c:url value='/lendplace/insertReview' />" method="post">
    							    <input type="hidden" name="L_NO" value="<c:out value="${map.L_NO}"/>">
        							<input type="hidden" name="R_GROUP" id="R_GROUP">
        							<input type="hidden" name="R_NO" id="R_NO"> 
        							<input type="hidden" name="M_NO" value="<c:out value="${session_m_no}"/>">
        							<textarea name="R_CONTENT" rows="3" cols="60" maxlength="500"></textarea>
        							<a href="#" onclick="fn_reviewUpdateSave()">저장</a>
        							<a href="#" onclick="fn_reviewUpdateCancel()">취소</a>
    							</form>
							</div>

							<div id="replyDialog" style="width: 99%; display:none">
    							<form name="form3" action="<c:url value='/lendplace/insertReview' />" method="post">
     							   <input type="hidden" name="L_NO" value="<c:out value="${map.L_NO}"/>"> 
     							   <input type="hidden" name="R_NO"> 
   								   <input type="hidden" name="R_PARENT">
     							   <input type="hidden" name="M_NO" value="<c:out value="${session_m_no}"/>"> <br/>
   								   <textarea name="R_CONTENT" rows="3" cols="60" maxlength="500"></textarea>
    							   <a href="#" onclick="fn_replyReviewSave()">저장</a>
   								   <a href="#" onclick="fn_replyReviewCancel()">취소</a>
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
	
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

	<script src="//apis.daum.net/maps/maps3.js?apikey=a18085cad4f8315645fc4a233bdb2875&libraries=services" onerror="alertify.log('지도 로드중 에러!')"></script>
	<script src="<c:url value='/resources/datepicker/datepicker.js'/> "></script>
	<script src="<c:url value='/resources/datepicker/datepicker.ko-KR.js'/> "></script>
	<script type="text/javascript">
	// star rating
	var starRating = function(){
	  var $star = $(".star-input"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".star-input>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".star-input>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".star-input :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".star-input label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".star-input>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	starRating();
	
	</script>
	
	<script type="text/javascript">
$(document).ready(function() {
	if ("${session_m_no}" == "") {
		alert('로그인이 필요합니다!');
		window.location = "/yogi/first";
	}
	
		var IMP = window.IMP; // 생략가능
		IMP.init('imp59404832'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		$("a[name='apply']").on("click", function(e) { //신청
			/* 태그의 기본 기능을 제거 */
			e.preventDefault();
			if($('#U_DATE').val()==""){
		        alert("대관 신청 날짜를 입력해주세요.");
		          return false;
		     }
			if(confirm("신청 하시겠습니까?")==true){
				if ('${map.L_PAYMENT}'=='0') {
					fn_applyLendplace();
				}else{
					fn_pay();
				}
			} else {
				return;
			}
		});
	
});
function fn_pay() {
	//아임포트 결제관리
	
	IMP.request_pay({
		pg : 'html5_inicis',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '${map.L_SUBJECT}',
	    amount : '${map.L_PAYMENT}',
	    buyer_email : 'YOGI@gmail.com',
	    buyer_name : '${session_m_name}',
	    buyer_tel : '${session_m_phone}',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	}, function(rsp) {
	    if ( rsp.success ) {
	        //결제가 성공해야 신청처리 되도록 여기에 장소 신청 메서드 연결 
	        fn_applyLendplace();
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	        alert(msg);
	    }
	});
	
}

function fn_applyLendplace(){
	alert("장소 대여 신청이 완료되었습니다 :3");
		document.apply_form.submit();
}

function fn_insertReview() {
	if ($.trim($("#R_CONTENT").val()) == "") {
        alert("내용을 입력해주세요.");
        $("#R_CONTENT").focus();
        return;
    }
    $("#review_form").submit();  
}
function fn_deleteReview(R_NO, R_GROUP){
    if (!confirm("삭제하시겠습니까?")) {
        return;
    }
    $("#form2").attr("action", "<c:url value='/lendplace/deleteReview'/>");
    $("#R_NO").val(R_NO);
    $("#R_GROUP").val(R_GROUP);
    $("#form2").submit();

    /* var form = document.form2;

    form.action="<c:url value='/lendplace/deleteReview'/>";
    form.R_NO.value=R_NO;
    form.R_GROUP.value=R_GROUP;
    form.submit();     */
}



var updateR_NO = updateR_CONTENT = null;
function fn_reviewUpdate(R_NO){
    var form = document.form2;
    var review = document.getElementById("review"+R_NO);
    var reviewDiv = document.getElementById("reviewDiv");
    reviewDiv.style.display = "";
    
    if (updateR_NO) {
        document.body.appendChild(reviewDiv);
        var oldR_NO = document.getElementById("review"+updateR_NO);
        oldR_NO.innerText = updateR_CONTENT;
    } 
    
    form.R_NO.value=R_NO;
    form.R_CONTENT.value = review.innerText;
    review.innerText ="";
    review.appendChild(reviewDiv);
    updateR_NO = R_NO;
    updateR_CONTENT = form.R_CONTENT.value;
    form.R_CONTENT.focus();
} 

function fn_reviewUpdateSave(){
    var form = document.form2;
    if (form.R_CONTENT.value=="") {
        alert("글 내용을 입력해주세요.");
        form.R_CONTENT.focus();
        return;
    }
    
    form.action="<c:url value='/lendplace/insertReview' />";
    form.submit();    
} 

function fn_reviewUpdateCancel(){
    var form = document.form2;
    var reviewDiv = document.getElementById("reviewDiv");
    document.body.appendChild(reviewDiv);
    reviewDiv.style.display = "none";
    
    var oldReno = document.getElementById("review"+updateR_NO);
    oldReno.innerText = updateR_CONTENT;
    updateR_NO = updateR_CONTENT = null;
} 


function hideDiv(id){
    var div = document.getElementById(id);
    div.style.display = "none";
    document.body.appendChild(div);
}

function fn_reviewReply(R_NO){
    var form = document.form3;
    var reply = document.getElementById("review"+R_NO);
    var replyDia = document.getElementById("replyDialog");
    replyDia.style.display = "";
    
    if (updateR_NO) {
    	fn_reviewUpdateCancel();
    } 
    
    form.R_CONTENT.value = "";
    form.R_PARENT.value=R_NO;
    reply.appendChild(replyDia);
    form.R_CONTENT.focus();
} 
function fn_replyReviewCancel(){
    hideDiv("replyDialog");
} 

function fn_replyReviewSave(){
    var form = document.form3;
    
    if (form.R_CONTENT.value=="") {
        alert("글 내용을 입력해주세요.");
        form.R_CONTENT.focus();
        return;
    }
    
    form.action="<c:url value='/lendplace/insertReview' />";
    form.submit();    
}

$( function() {/* 달력 */
	 
	 $('[data-toggle="datepicker"]').datepicker({
		  language: 'ko-KR',
		  inline: true,
		  container: '#datepicker-container',
		  format: 'yyyy-mm-dd',
		  startDate: '${map.L_SDATE}',
		  endDate: '${map.L_EDATE}',
		  filter: function(date){
			 <c:forEach items="${date}" var="date"> 
			  var Udate = new Date("${date.U_DATE}");
			  if (date.getFullYear() === Udate.getFullYear()) {
					if (date.getMonth()	=== Udate.getMonth()) {
						if (date.getDate() === Udate.getDate()) {
						       return false; 
						}
					}
				 }
			 </c:forEach>
	  		}
	 });
});

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
	geocoder.addr2coord("${map.L_ADDR}", function(status, result) {

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

