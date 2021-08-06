<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 재설정!</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Course Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/yogi/resources/course-master/styles/bootstrap4/bootstrap.min.css">
<link href="http://localhost:8080/yogi/resources/course-master/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/yogi/resources/course-master/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/yogi/resources/course-master/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/yogi/resources/course-master/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/yogi/resources/course-master/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="http://localhost:8080/yogi/resources/course-master/styles/responsive.css">
<style>
#checkPwd{
  color : red;
  font-size: 12px;
}
</style>
<script>
function checkPW() {
	
	var find = document.resetPassword;
	if (find.m_password.value == "") {
		alert("비밀번호를 입력해주세요");
		find.m_password.focus();
		return false;
	}
	if (find.m_password_check.value == "") {
		alert("비밀번호를 한번 더 입력해주세요");
		find.m_password_check.focus();
		return false;
	}
	find.submit();
}

function check(){
	var pw1 = document.resetPassword.m_password.value;
	var pw2 = document.resetPassword.m_password_check.value;
	if(pw1!=pw2){
		document.getElementById('checkPwd').style.color = "red";
		document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
	}else{
		document.getElementById('checkPwd').style.color = "black";
		document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
	}
}
</script>
</head>
<body>
	<div class="super_container">
	<div class="register">
		<div class="container-fluid">
			<div class="row row-eq-height">
				<div class="col-lg-6 nopadding">

					<div class="register_section d-flex flex-column align-items-center justify-content-center">
						<div class="register_content text-center">
						<form:form commandName="member" name="resetPassword" method="post">
							<h1 class="register_title">"${member.m_id}" Please Input <br><span>new password</span></h1>
							<input class="input_field search_form_name" type="password" name="m_password" onkeyup="check()" placeholder="Input new password!">
							<input class="input_field search_form_category" type="password" name="m_password_check" onkeyup="check()" placeholder="Please Enter One more time"/>
							<div id="checkPwd">동일한 암호를 입력하세요.</div>
							<input type="hidden" name="m_id" value=${member.m_id} />
							<div class="button button_1 register_button mx-auto trans_200"><a href="#" onclick="checkPW()">Re Set Password!</a></div>
						</form:form>
						</div>
					</div>

				</div>

				
			</div>
		</div>
	</div>
</div>
	
<script src="http://localhost:8080/yogi/resources/course-master/js/jquery-3.2.1.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/styles/bootstrap4/popper.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/styles/bootstrap4/bootstrap.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/greensock/TweenMax.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/greensock/TimelineMax.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/scrollmagic/ScrollMagic.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/greensock/animation.gsap.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/greensock/ScrollToPlugin.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/scrollTo/jquery.scrollTo.min.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/plugins/easing/easing.js"></script>
<script src="http://localhost:8080/yogi/resources/course-master/js/custom.js"></script>	
</body>
</html>