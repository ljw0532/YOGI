<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
<%@ include file="/WEB-INF/include/common-header.jspf" %>
<%@ include file="/WEB-INF/include/common-body.jspf" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/resources/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/resources/dtpicker/jquery-1.7.1.js'/>" charset="utf-8"></script>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>모임 상세보기</title>
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
<style>
input.yetZzim{
	cursor:pointer;
	width:30px; height:28px;
	border:none;
	background:url('/yogi/resources/image/yetZzim.png');
}
input.zZim{
	cursor:pointer;
	width:30px; height:28px;
	border:none;
	background:url('/yogi/resources/image/Zzim.png');
}
input.join{
	cursor:pointer;
	width:250px; height:37px;
	border:none;
	background:url('/yogi/resources/image/joinBtn.png');
	
}
input.cancel{
	cursor:pointer;
	width:250px; height:37px;
	border:none;
	background:url('/yogi/resources/image/cancelBtn.png');
}

pre{
	display: block;
	padding-left: 10px;
	margin: 0;
	border: none;
	font-size: 15px;
	
}
</style>	
	</head>
<body>
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
<span>MADE BY: <a href="">YOMI</a></span>
	</div>
</aside>

<div id="colorlib-main">

			<div class="colorlib-about">
				<div class="colorlib-narrow-content">
					<div class="row row-bottom-padded-md">
						<div class="col-md-6" style="position:relative; width: 62%;">
							<div class="about-img animate-box" data-animate-effect="fadeInLeft"><img src="/yogi/resources/upload/${gModel.GG_RFN }" onERROR="this.src='/yogi/resources/image/image_error.jpeg'" style="width: 600px; height: 550px;"/>
							</div>
						</div>
						<div class="col-md-6 a nimate-box" data-animate-effect="fadeInLeft" style="position:relative; width: 38%;">
							<div class="about-desc">
								<span class="heading-meta">Detail</span>
								<h2 class="colorlib-heading">${gModel.GG_NAME}</h2>							
								<div style="position:relative; top: -35px;">
								<h5><a href="#this" onclick="fn_memberProfileLink('${gModel.M_NO}')">${gModel.WT_NAME }</a></h5>
								<h5>${gModel.M_EMAIL }</h5>	
								<h5><img src="/yogi/resources/image/w_person.png"/>&nbsp;&nbsp;${gModel.GG_TOTAL} [${gModel.GG_ENABLE }]</h5>
								<c:if test="${gModel.GG_COST > 0 }">
								<h5><img src="/yogi/resources/image/w_money.png"/>&nbsp;&nbsp;${gModel.GG_COST}</h5>
								</c:if>
								<c:if test="${gModel.GG_COST == 0}">
								<h5><img src="/yogi/resources/image/w_money.png"/>&nbsp;&nbsp;NO CHARGE</h5>
								</c:if>
								<h5><img src="/yogi/resources/image/w_time.png"/>&nbsp;&nbsp;${gModel.GG_DATE}</h5>							
								<h4><img src="/yogi/resources/image/w_place.png"/>&nbsp;&nbsp;${gModel.GG_ADDR}&nbsp;(${gModel.GG_PLACE})</h4>
								</div>	
								
								<div class="zzim" style="position:relative; top:-50px;">
								<c:choose>
									<c:when test="${gModel.GG_LIKEIT==null }">	
										<img id="likeit" src="/yogi/resources/image/yetZzim.png" style="cursor:pointer"/>
									</c:when> 
									<c:otherwise>
									<img id="likeit" src="/yogi/resources/image/Zzim.png" style="cursor:pointer"/>
										
									</c:otherwise>	  
								</c:choose>
								</div>
							    
							    
							    <div class="enroll" style="position:relative; top:-30px;">
	<!-- 글작성자가 아닌 경우 --><c:if test="${gModel.M_NO!=session_m_no }">
								<form action="/yogi/enroll" method="post">
									<input type="hidden" name="gg_no" value="${gModel.GG_NO}">
									<input type="hidden" name="m_no" value="${gModel.M_NO}">
 <!-- 신청 마감일 경우--><c:if test="${gModel.GG_PERMIT_PNUM == 0 }">																
					<c:if test="${session_m_no == enrollM.M_NO }">	
						<font color="red">신청마감!</font><br>							
						<c:choose>	
							<c:when test="${gModel.GG_ENROLL==null }">	
								<input class="join" type="submit" value="">
							</c:when> 
							<c:otherwise>
								<input class="cancel" type="submit" value="">
							</c:otherwise>								  
						</c:choose>
						</c:if>
					 <c:if test="${session_m_no != enrollM.M_NO }">
						<font color="red">신청마감!</font><br>		
					</c:if>
					</c:if>
								
		<c:if test="${gModel.GG_PERMIT_PNUM != 0}">
			<c:choose>
						<c:when test="${gModel.GG_ENROLL==null }">	
							<input class="join" type="submit" value="">
						</c:when> 
						<c:otherwise>
							<input class="cancel" type="submit" value="">
						</c:otherwise>	  
			</c:choose>
		</c:if>
								 </form>
		</c:if>
		<c:if test="${gModel.M_NO == session_m_no }">
	 	<a href="#this" onclick="fn_modifyForm('${gModel.GG_NO}','${gModel.M_NO}')">수정하기</a>
	<!--  </form> -->
	 
	 <a href="#this" name="inactivateGroup">삭제하기</a><input type="hidden" id="gg_no" value="${gModel.GG_NO}">						
		</c:if>
								 <a href="<c:url value='/groupList'/>" class="btn btn-primary btn-learn" style="position: relative; left: 270px; top: -45px;">목록</a>
								 </div>
							</div>
						</div>
					</div>
					<div class="row" style="position: relative; top:-70px;">
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft" style="position: relative; width: 60%; height: 420px;">
							<h2 class="colorlib-heading">Content</h2>
							<p style=" height:380px; overflow-y:scroll;">${gModel.GG_DETAIL}</p>
						</div>
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft" style="position:relative; width:40%; height:300px; top: 0px;">
							<h2 class="colorlib-heading">subscriber</h2>
							<c:forEach items="${geList }" var="gl">
   		  					 <ul>
       		 				 <a href="#this" onclick="fn_memberProfileLink('${gl.M_NO}')">
           					 <li><font color="black">${gl.GE_NAME }</font></li>
       		  				</a>
    	  					</ul>
							</c:forEach>	
						</div>
					</div>
					
					<div class="row" style="position: relative; width: 60%">
						<h2 class="colorlib-heading">Location</h2>
						<div id="map"  class="om_detail_contet_map" style="position: relative;  height: 400px;"></div>
					</div>
					<br>
					<br>
					<br>
					<div class="row">
						<div class="col-md-4 animate-box" data-animate-effect="fadeInLeft">
							<h2 class="colorlib-heading">Comment</h2>
							<div style="border: 1px solid; width: 600px; padding: 5px">
    							<form name="review_form" id="review_form" action="<c:url value='/comments'/>" method="post">
        						<input type="hidden" name="gg_no" value="<c:out value="${gModel.GG_NO}"/>"> 
        						<input type="hidden" name="m_name" value='${sWriter.M_NAME}'> 
								<input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
        						<input type="hidden" name="m_no" value="<c:out value="${session_m_no}"/>">
        						<textarea name="c_content" id="c_content" rows="3" cols="73" maxlength="500" placeholder="댓글을 달아주세요." style="border:none;"></textarea>
        						<a href="#" onclick="fn_insertReview()">댓글</a>
    							</form>
							</div>

							<c:forEach var="row" items="${cmtList}" varStatus="status">
							<fmt:parseNumber var = "blank" type = "number" value = "${row.C_DEPTH}" />
    						<div style="border: 1px solid gray; width: 600px; padding: 5px; margin-top: 5px; margin-left: <c:out value="${20*blank}"/>px; display: inline-block">
        						<c:choose>
        							<c:when test="${row.C_DEL eq 'Y'}">
        								삭제된 댓글입니다.
        							<c:if test="${session_m_no == row.M_NO}">
        								<a href="#" onclick="fn_deleteReview('<c:out value="${row.C_NO}"/>')">삭제</a>
        							</c:if>
        							</c:when>
        							<c:otherwise>
	        							<a href="#this" onclick="fn_memberProfileLink('${row.M_NO}')">${row.C_NAME }</a>
	        							<a href="#" onclick="fn_reviewReply('<c:out value="${row.C_NO}"/>')">답변</a>
	        							<c:if test="${session_m_no == row.M_NO}">
        									<a href="#" onclick="fn_deleteReview('<c:out value="${row.C_NO}"/>','<c:out value="${row.C_GROUP}"/>')">삭제</a>
        								</c:if>
        								<fmt:formatDate value="${row.C_DATE}" pattern="yy/MM/dd hh:mm:ss"/>	
        								<br/>
        								<div id="review<c:out value="${row.C_NO}"/>">	
        									<c:out value="${row.C_CONTENT}"/>
        								</div>
        							</c:otherwise>
        						</c:choose>
    						</div>					
							</c:forEach>

							 <div id="reviewDiv" style="width: 99%; display:none">
    							<form name="form2" id="form2" action="<c:url value='/comments' />" method="post">
    							    <input type="hidden" name="gg_no" value="<c:out value="${gModel.GG_NO}"/>">
        							<input type="hidden" name="c_no" id="c_no">
     							    <input type="hidden" name="c_group" id="c_group">
     							    <input type="hidden" name="c_parent">   							
        							<input type="hidden" name="m_name" value='${sWriter.M_NAME}'> 
									<input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
									<input type="hidden" name="m_no" value="<c:out value="${session_m_no}"/>"> 
        							<textarea name="c_content" rows="3" cols="60" maxlength="500"></textarea>
        							<a href="#" onclick="fn_reviewUpdateSave()">저장</a>
        							<a href="#" onclick="fn_reviewUpdateCancel()">취소</a>
    							</form>
							</div> 

							<div id="replyDialog" style="width: 99%; display:none">
    							<form name="form3" action="<c:url value='/comments'/>" method="post">
     							   <input type="hidden" name="gg_no" value="<c:out value="${gModel.GG_NO}"/>"> 							   					   
   								   <input type="hidden" name="c_parent">
   								   <input type="hidden" name="m_name" value='${sWriter.M_NAME}'> 
								   <input type="hidden" name="m_no1" value="${gModel.M_NO}"/> 
     							   <input type="hidden" name="m_no" value="<c:out value="${session_m_no}"/>"> <br/>
   								   <textarea name="c_content" rows="3" cols="60" maxlength="500"></textarea>
    							   <a href="#" onclick="fn_replyReviewSave()">작성</a>
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
function doDisplay(C_NO){
		 var con = document.getElementById("repDiv"+C_NO);
	if(con.style.display=='block'){
	    con.style.display = 'none';
		  }else{
		     con.style.display = 'block';
	   }
}	

function fn_meetingsModify() {
	var cs = new ComSubmit();
	cs.setUrl("<c:url value='/groupModify' />");
	cs.addParam("gg_no", '${gModel.GG_NO }');
	cs.submit("GET");
}
			$(document).ready(function(){
				$("#likeit").bind("click", function() {
					var gg_no = ${gModel.GG_NO };
					var likeit = document.getElementById('likeit');
					$.ajax({
						async:true,
						type:'POST', 
						data : {"gg_no":gg_no},
						url:'/yogi/group/likeit',
						dataType : "json",
						success : function(data){
							if(data.likeIt > 0){
								likeit.src = likeit.src.replace('yetZzim.png', 'Zzim.png');
							}else{
								likeit.src = likeit.src.replace('Zzim.png', 'yetZzim.png');
							}
						},
						error : function(error){
							alert("error: " + error)
						}
					})
				})
			})
function fn_memberProfileLink(m_pno){
   var url = "/yogi/report/viewUserInfo?m_pno="+m_pno;
   var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=500,height=600";
   window.open(url,"",option);
}
		
			$(document).ready(function() {
				$("a[name='inactivateGroup']").on("click", function(e) { //비활성화
					e.preventDefault();
					fn_inactivateGroup($(this));
				});
			});
			
			function fn_inactivateGroup(obj) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/inactivateGroup' />");
				comSubmit.addParam("gg_no", obj.parent().find("#gg_no").val());
				comSubmit.submit();
			}
			
			function fn_modifyForm(gg_no,m_no) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='/modifyForm' />");
				comSubmit.addParam("gg_no", gg_no);
				comSubmit.addParam("m_no", m_no);
				comSubmit.submit();
			}
			
			function fn_insertReview() {
				if ($.trim($("#c_content").val()) == "") {
			        alert("내용을 입력해주세요.");
			        $("#c_content").focus();
			        return;
			    }
			    $("#review_form").submit();  
			}
			
			function fn_deleteReview(C_NO, C_GROUP){
			    if (!confirm("삭제하시겠습니까?")) {
			        return;
			    }
			    $("#form2").attr("action", "<c:url value='/deleteCmt'/>");
			    $("#c_no").val(C_NO);
			    $("#c_group").val(C_GROUP);
			    $("#form2").submit();

			    /* var form = document.form2;

			    form.action="<c:url value='/lendplace/deleteReview'/>";
			    form.R_NO.value=R_NO;
			    form.R_GROUP.value=R_GROUP;
			    form.submit();     */
			}


		 var updatec_no = updatec_content = null;
			function fn_reviewUpdate(c_no){
			    var form = document.form2;
			    var review = document.getElementById("review"+c_no);
			    var reviewDiv = document.getElementById("reviewDiv");
			    reviewDiv.style.display = "";
			    
			    if (updatec_no) {
			        document.body.appendChild(reviewDiv);
			        var oldc_no = document.getElementById("review"+updatec_no);
			        oldc_no.innerText = updatec_content;
			    } 
			    
			    form.c_no.value=c_no;
			    form.c_content.value = review.innerText;
			    review.innerText ="";
			    review.appendChild(reviewDiv);
			    updatec_no = c_no;
			    updatec_content = form.c_content.value;
			    form.c_content.focus();
			} 

			 function fn_reviewUpdateSave(){
			    var form = document.form2;
			    if (form.c_content.value=="") {
			        alert("글 내용을 입력해주세요.");
			        form.c_content.focus();
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
			    
			    var oldReno = document.getElementById("review"+updatec_no);
			    oldReno.innerText = updatec_content;
			    updatec_no = updatec_content = null;
			}


			function hideDiv(id){
			    var div = document.getElementById(id);
			    div.style.display = "none";
			    document.body.appendChild(div);
			}

			function fn_reviewReply(c_no){
			    var form = document.form3;
			    var reply = document.getElementById("review"+c_no);
			    var replyDia = document.getElementById("replyDialog");
			    replyDia.style.display = "";
			    
			    if (updatec_no) {
			    	fn_reviewUpdateCancel();
			    } 
			    
			    form.c_content.value = "";
			    form.c_parent.value=c_no;
			    reply.appendChild(replyDia);
			    form.c_content.focus();
			} 
			function fn_replyReviewCancel(){
			    hideDiv("replyDialog");
			} 

			function fn_replyReviewSave(){
			    var form = document.form3;
			    
			    if (form.c_content.value=="") {
			        alert("글 내용을 입력해주세요.");
			        form.c_content.focus();
			        return;
			    }
			    
			    form.action="<c:url value='/comments' />";
			    form.submit();    
			}
			
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
			geocoder.addr2coord("${gModel.GG_ADDR}", function(status, result) {

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
			        content: '<div style="width:150px;text-align:center;padding:6px 0;">${gModel.GG_PLACE}</div>'
			    });
			    infowindow.open(map, marker);

			    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			    map.setCenter(coords);
			} 
			});
			
	</script>
		</body>
		</html>