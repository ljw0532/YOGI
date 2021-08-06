<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>회원정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<meta name="author" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/animate.css">
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/checkBox.css">
	<!-- Icomoon Icon Fonts-->
	<!-- <link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/icomoon.css"> -->
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/bootstrap.css">
	<!-- Flexslider  -->
	<!-- <link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/flexslider.css"> -->
	<!-- Flaticons  -->
	<!-- <link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/fonts/flaticon/font/flaticon.css"> -->
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/owl.carousel.min.css">
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="http://localhost:8080/yogi/resources/bootstrap/css/style.css">

	<!-- Modernizr JS -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/modernizr-2.6.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	var phone_check1 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var phone_check2 = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var pw_check = 0;

	function insert() {
		var join = document.userinput

		if (join.m_password.value == "") {
			alert("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}

		if (userinput.m_password.value.length < 4) {
			alert("최소 4자리 이상 입력해주세요!");
			userinput.m_password.focus();
			return false;
		}

		if (join.m_password_check.value == "") {
			alert("비밀번호를 한번 더 입력해주세요!");
			join.m_password.focus();
			return false;
		}
		
		if (join.m_password_check.value != join.m_password.value) {
			alertify.error("비밀번호를 틀리게 입력하셨습니다...");
			join.m_password.focus();
			return false;
		} 

		if (join.m_phone.value == "") {
			alert("전화번호를 입력해주세요");
			join.m_phone.focus();
			return false;
		}
		if (join.m_email.value == "") {
			alert("이메일을 입력해주세요");
			join.m_email.focus();
			return false;
		}

		if (!join.m_phone.value.match(phone_check1) && !join.m_phone.value.match(phone_check2)) {
			alert("전화번호 형식이 잘못되었습니다. 다시 입력해주세요.");
			/* alertify.log("예) 010-1234-1234<br> 또는 02-123-1234"); */
			 join.m_phone.focus();
			return false;
		}
		if(pw_check != 1){
			alert("비밀번호를 확인해 주세요.");
			join.m_password.focus();
			return false;
		}
		alert("회원정보 수정 완료!");
		join.submit();
	}
	
	function del(){
		//회원탈퇴 기능 만들기
		var url = "/yogi/members/delMem?id=" + document.userinput.m_id.value;
		var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400";
		window.open(url,"",option);
	}
	
	
	function checkPwd(){
		var pw1 = document.userinput.m_password.value;
		var pw2 = document.userinput.m_password_check.value;
		if(pw1!=pw2){
			document.getElementById('checkcheck').className="alert alert-danger";
			document.getElementById('checkcheck').innerHTML = "동일한 암호를 입력하세요.";
			pw_check=0;
		}else{
			document.getElementById('checkcheck').className="alert alert-success";
			document.getElementById('checkcheck').innerHTML = "암호가 확인되었습니다.";
			pw_check=1;
		}
	}
	
</script>
<style>
dt { float: left;
font-family: 'icomoon';
font-size: 10px;
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
		<li><a href="http://localhost:8080/yogi/lendplace/list">Lendplace</a></li>
		<li class="colorlib-active"><a href="http://localhost:8080/yogi/mypage/mypageView">MyPage</a></li>
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
<!-- 사이드 바 -->

<div id="colorlib-main">
<div class="colorlib-contact">
<div class="colorlib-narrow-content">
	<div class="row">
		<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
			<span class="heading-meta">Modify</span>
			<h2 class="colorlib-heading">회원 정보 수정</h2>
		</div>
	</div>
	<form:form commandName="member" name="userinput" method="post" enctype="multipart/form-data">
		<table>
		<tr>
			<td>
				ID
				<div class="form-group">
					<input type="text" name="m_id" id="m_id" style="font-weight:bold;"class="form-control" value = ${members.m_id } readonly>
				</div>
				Profile
				<div class="form-group">
					<input type="file" class="btn btn-primary btn-send-message" name="file">
				</div>
				Password
				<div class="form-group">
					<input type="password" name="m_password" class="form-control"  onkeyup="checkPwd()"/>
				</div>
				PasswordCheck
				<div class="form-group">
					<input type="password" name="m_password_check" class="form-control"  onkeyup="checkPwd()"/>
				</div>
				<div id="checkcheck" class="alert alert-danger" style="width:400px;">동일한 암호를 입력하세요.</div>	
				Name
				<div class="form-group">
					<input type="text" class="form-control" name="m_name" style="font-weight:bold;" value=${members.m_name } readonly>
				</div>
				Phone
				<div class="form-group">
					<input type="text" class="form-control"  name="m_phone" value=${members.m_phone} placeholder="ex) 010-0000-0000">
				</div>
				Email
				<div class="form-group">
					<input type="text" class="form-control"  name="m_email" value=${members.m_email} placeholder="ex) yomi@yogi.com">
				</div>
		</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>
		관심사
		<dl>
			<c:if test="${interest[0] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="실외활동" checked></dt><dt>&nbsp;실외활동&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[0] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="실외활동"></dt><dt>&nbsp;실외활동&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[1] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="패션" checked></dt><dt>&nbsp;패션&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[1] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="패션"></dt><dt>&nbsp;패션&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[2] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="맛집"checked></dt><dt>&nbsp;맛집&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[2] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="맛집"></dt><dt>&nbsp;맛집&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[3] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="게임" checked></dt><dt>&nbsp;게임</dt>
			</c:if>
			<c:if test="${interest[3] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="게임"></dt><dt>&nbsp;게임</dt>
			</c:if>		
			<span style="color:WHITE">WElCOMETOYOGI</span> 
		</dl>
		<dl>
			<c:if test="${interest[4] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="동물" checked></dt><dt>&nbsp;동물&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[4] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="동물"></dt><dt>&nbsp;동물&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[5] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="보드게임" checked></dt><dt>&nbsp;보드게임&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[5] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="보드게임"></dt><dt>&nbsp;보드게임&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[8] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="춤" checked></dt><dt>&nbsp;춤&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[8] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="춤"></dt><dt>&nbsp;춤&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[14] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="공예" checked></dt><dt>&nbsp;공예&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[14] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="공예"></dt><dt>&nbsp;공예&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		<dl>
			<c:if test="${interest[6] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="전시/공연" checked></dt><dt>&nbsp;전시/공연&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[6] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="전시/공연"></dt><dt>&nbsp;전시/공연&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[7] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="취업/스터디" checked></dt><dt>&nbsp;취업/스터디&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[7] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="취업/스터디"></dt><dt>&nbsp;취업/스터디&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[9] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="독서/토론" checked></dt><dt>&nbsp;독서/토론&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[9] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="독서/토론"></dt><dt>&nbsp;독서/토론&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		<dl>
			<c:if test="${interest[10] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="음악" checked></dt><dt>&nbsp;음악&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[10] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="음악"></dt><dt>&nbsp;음악&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[12] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="여행" checked></dt><dt>&nbsp;여행&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[12] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="여행"></dt><dt>&nbsp;여행&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[13] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="웰빙" checked></dt><dt>&nbsp;웰빙&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[13] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="웰빙"></dt><dt>&nbsp;웰빙&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[11] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="언어교환" checked></dt><dt>&nbsp;언어교환&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${interest[11] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_field" value="언어교환"></dt><dt>&nbsp;언어교환&nbsp;&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		
		<br>선호지역
		<dl>
			<c:if test="${area[0] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="종로구" checked></dt><dt>&nbsp;종로구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[0] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="종로구"></dt><dt>&nbsp;종로구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[1] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="중구" checked></dt><dt>&nbsp;중구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[1] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="중구"></dt><dt>&nbsp;중구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[2] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="용산구"checked></dt><dt>&nbsp;용산구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[2] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="용산구"></dt><dt>&nbsp;용산구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[3] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="성동구" checked></dt><dt>&nbsp;성동구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[3] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="성동구"></dt><dt>&nbsp;성동구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>			
			<c:if test="${area[4] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="광진구" checked></dt><dt>&nbsp;광진구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[4] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="광진구"></dt><dt>&nbsp;광진구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		<dl>
			<c:if test="${area[5] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="동대문구" checked></dt><dt>&nbsp;동대문구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[5] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="동대문구"></dt><dt>&nbsp;동대문구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[6] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="중랑구" checked></dt><dt>&nbsp;중랑구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[6] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="중랑구"></dt><dt>&nbsp;중랑구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[7] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="성북구" checked></dt><dt>&nbsp;성북구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[7] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="성북구"></dt><dt>&nbsp;성북구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[8] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강북구" checked></dt><dt>&nbsp;강북구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[8] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강북구"></dt><dt>&nbsp;강북구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[9] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="도봉구" checked></dt><dt>&nbsp;도봉구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[9] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="도봉구"></dt><dt>&nbsp;도봉구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		<dl>
			<c:if test="${area[10] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="노원구" checked></dt><dt>&nbsp;노원구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[10] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="노원구"></dt><dt>&nbsp;노원구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[11] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="은평구" checked></dt><dt>&nbsp;은평구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[11] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="은평구"></dt><dt>&nbsp;은평구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[12] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="서대문구" checked></dt><dt>&nbsp;서대문구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[12] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="서대문구"></dt><dt>&nbsp;서대문구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[13] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="마포구" checked></dt><dt>&nbsp;마포구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[13] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="마포구"></dt><dt>&nbsp;마포구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[14] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="양천구" checked></dt><dt>&nbsp;양천구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[14] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="양천구"></dt><dt>&nbsp;양천구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		<dl>
			<c:if test="${area[15] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강서구" checked></dt><dt>&nbsp;강서구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[15] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강서구"></dt><dt>&nbsp;강서구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[16] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="구로구" checked></dt><dt>&nbsp;구로구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[16] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="구로구"></dt><dt>&nbsp;구로구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[17] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="금천구" checked></dt><dt>&nbsp;금천구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[17] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="금천구"></dt><dt>&nbsp;금천구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[18] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="영등포구" checked></dt><dt>&nbsp;영등포구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[18] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="영등포구"></dt><dt>&nbsp;영등포구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[19] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="동작구" checked></dt><dt>&nbsp;동작구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[19] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="동작구"></dt><dt>&nbsp;동작구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		<dl>
			<c:if test="${area[20] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="관악구" checked></dt><dt>&nbsp;관악구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[20] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="관악구"></dt><dt>&nbsp;관악구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[21] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="서초구" checked></dt><dt>&nbsp;서초구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[21] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="서초구"></dt><dt>&nbsp;서초구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[22] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강남구" checked></dt><dt>&nbsp;강남구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[22] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강남구"></dt><dt>&nbsp;강남구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[23] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="송파구" checked></dt><dt>&nbsp;송파구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[23] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="송파구"></dt><dt>&nbsp;송파구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>			
			<c:if test="${area[24] eq 'check'}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강동구" checked></dt><dt>&nbsp;강동구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<c:if test="${area[24] eq null}">
				<dt><input type="checkbox" class="option-input checkbox" name="m_fav_area" value="강동구"></dt><dt>&nbsp;강동구&nbsp;&nbsp;&nbsp;</dt>
			</c:if>
			<span style="color:WHITE">WElCOMETOYOGI</span>
		</dl>
		</td>
	</tr>
	</table>
	<div class="form-group">
		<input type="button" value="회원정보수정!" onclick="insert()" class="btn btn-primary btn-send-message"/>
	</div>
	</form:form>
	<div class="form-group">
		<input type="button" value="회원탈퇴" onclick="del()" class="btn btn-primary btn-send-message"/>
	</div>
	
</div>
</div>
</div>

	<!-- jQuery -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/sticky-kit.min.js"></script>
	<!-- Owl carousel -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/jquery.countTo.js"></script>
	
	<!-- MAIN JS -->
	<script src="http://localhost:8080/yogi/resources/bootstrap/js/main.js"></script>

</body>
</html>

