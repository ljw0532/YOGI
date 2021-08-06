<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>요기요기 모여라b</title>
 	<!-- Bootstrap core CSS -->
    <link href="http://localhost:8080/yogi/resources/first/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="http://localhost:8080/yogi/resources/first/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://localhost:8080/yogi/resources/first/css/coming-soon.min.css" rel="stylesheet">


<script>
function insert() {
		var join = document.userinput
		if (join.m_id.value == "") {
			alert("아이디를 입력해주세요");
			join.m_id.focus();
			return false;
		}
		
		if (join.m_password.value == "") {
			alert("비밀번호를 입력해주세요");
			join.m_password.focus();
			return false;
		}
		join.submit();
}
</script>
</head>

<body>
	<div class="overlay"></div>
	<video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
		<source src="http://localhost:8080/yogi/resources/first/mp4/bg.mp4" type="video/mp4">
	</video>

    <div class="masthead">
      <div class="masthead-bg"></div>
      <div class="container h-100">
        <div class="row h-100">
          <div class="col-12 my-auto">
            <div class="masthead-content text-white py-5 py-md-0">
              <h1 class="mb-3">YOGI</h1>
              <p class="mb-5">Welcome to YOGI! You can find some friends who have the <strong>same interest</strong>!
                Sign up for meet new friends. And have a great time! >__O</p>
              
              <div class="input-group input-group-newsletter">
              <form:form commandName="member" name="userinput" method="post">
				<c:choose>
					<c:when test="${'none' eq cookieID}">
						<div class="input-group-append">
							<input type="text" class="form-control" name="m_id" placeholder="ID">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="password" class="form-control"name="m_password" placeholder="PASSWORD">&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-secondary" type="button"  onclick="insert()">&nbsp;&nbsp;&nbsp;LogIn&nbsp;&nbsp;&nbsp;</button>							
						</div>
						<input type="checkbox" name="idSave" id="idSave"  value="save"/>Remember ID/PW&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="mb-5" style="color:white" href="http://localhost:8080/yogi/members/createForm"><strong>Sign In</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="mb-5" style="color:white" href="http://localhost:8080/yogi/members/find"><strong>Find ID/PW</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div style="position: relative; top: -100px;">
						<a href="<c:url value='/kakaoLogin' />">
						<img src="/yogi/resources/image/kakao_account_login_btn_medium_narrow.png" onmouseover="this.src='/yogi/resources/image/kakao_account_login_btn_medium_narrow_ov.png';" onmouseout="this.src='/yogi/resources/image/kakao_account_login_btn_medium_narrow.png';"/></a>
						<a href="<c:url value='/naverLogin' />">
						<img src="/yogi/resources/image/Log_in_with_NAVER_Official_Green.PNG" style="width: 340px; height: 300px;"/></a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="input-group-append">
							<input type="text" class="form-control" name="m_id" placeholder="ID" value="${cookieID}" >&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="password" class="form-control"name="m_password" placeholder="PASSWORD" value="${cookiePW}">&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-secondary" type="button"  onclick="insert()">&nbsp;&nbsp;&nbsp;LogIn&nbsp;&nbsp;&nbsp;</button>
						</div>
						<input type="checkbox" name="idSave" id="idSave" value="save" checked/>Remember ID/PW&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="mb-5" style="color:white" href="http://localhost:8080/yogi/members/createForm"><strong>Sign In</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<a class="mb-5" style="color:white" href="http://localhost:8080/yogi/members/find"><strong>Find ID/PW</strong></a>&nbsp;&nbsp;&nbsp;&nbsp;
						<div style="position: relative; top: 20px;">
						<a href="<c:url value='/kakaoLogin' />">
						<img src="/yogi/resources/image/kakao_account_login_btn_medium_narrow.png" onmouseover="this.src='/yogi/resources/image/kakao_account_login_btn_medium_narrow_ov.png';" onmouseout="this.src='/yogi/resources/image/kakao_account_login_btn_medium_narrow.png';"/></a>
						<a href="<c:url value='/naverLogin' />">
						<img src="/yogi/resources/image/Log_in_with_NAVER_Official_Green.PNG" style="width: 200px; height: 49px;"/></a>
						</div>
					</c:otherwise>
				</c:choose>
				<br>
			</form:form>
			</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="social-icons">
      <ul class="list-unstyled text-center mb-0">
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-twitter"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-facebook"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-instagram"></i>
          </a>
        </li>
      </ul>
    </div>
    
   	<!-- 팝업창을 눈에 보이지 않게 띄우기 위해 설정한 iframe -->
	<iframe width=0 height=0 name="hiddenframe1" style="display:none;"></iframe>
	<iframe width=0 height=0 name="hiddenframe2" style="display:none;"></iframe>
    <!-- Bootstrap core JavaScript -->
    <script src="http://localhost:8080/yogi/resources/first/vendor/jquery/jquery.min.js"></script>
    <script src="http://localhost:8080/yogi/resources/first/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="http://localhost:8080/yogi/resources/first/js/coming-soon.min.js"></script>
	
	<script type="text/javascript">
	window.onload = function () {
		window.open("https://developers.kakao.com/logout", "hiddenframe1", "width=1, height=1, left=0, top=0,  scrollbars=no,status=no,toolbar=no,menubar=no,resizeable=no,location=no");
		window.open("http://nid.naver.com/nidlogin.logout", "hiddenframe2", "width=1, height=1, left=0, top=0,  scrollbars=no,status=no,toolbar=no,menubar=no,resizeable=no,location=no");
	}
	</script>
  </body>

</html>