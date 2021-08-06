<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ID/PW찾기</title>
<meta charset="utf-8">
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
<script>
function findID() {
	
	var find = document.findId;
	if (find.m_name.value == "") {
		alert("이름을 입력해주세요");
		find.m_name.focus();
		return false;
	}
		
	if (find.m_phone.value == "") {
		alert("핸드폰 번호를 입력해주세요");
		find.m_phone.focus();
		return false;
	} 
	var url = "/yogi/findId?name=" + find.m_name.value+"&phone="+find.m_phone.value;
	var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400";
	window.open(url,"",option);
}

function findPw() {
	var find = document.findPW;
	
	if (find.m_id.value == "") {
		alert("아이디를 입력해주세요");
		find.m_id.focus();
		return false;
	}
	if (find.m_name.value == "") {
		alert("이름을 입력해주세요");
		find.m_name.focus();
		return false;
	}
	if (find.m_phone.value == "") {
		alert("핸드폰 번호를 입력해주세요");
		find.m_phone.focus();
		return false;
	}
	var url = "/yogi/findPW?name=" + find.m_name.value+"&phone="+find.m_phone.value+"&id="+find.m_id.value;
	var option = "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=400";
	window.open(url,"",option);
}
</script>
</head>
<body>

<a href="http://localhost:8080/yogi/"><div class="hero_slider_left hero_slider_nav trans_200" style="top:30px; left:20px;"><span class="trans_200">prev</span></div></a>

<div class="super_container">

	<div class="register">
		<div class="container-fluid">
			<div class="row row-eq-height">
				<div class="col-lg-6 nopadding">

					<div class="register_section d-flex flex-column align-items-center justify-content-center">
						<div class="register_content text-center">
						<form:form commandName="member" name="findId" method="post">
							<h1 class="register_title">Did you forget your ID?<br><span>Find your ID!</span></h1>
							<p class="register_text"> Did you ever forget your Id or password and cry with tears? Do not cry!<br>If you input your name and password you can find your ID!</p>
							<input id="search_form_name" class="input_field search_form_name" type="text" name="m_name" placeholder="Name" required="required" data-error="Course name is required.">
							<input id="search_form_category" class="input_field search_form_category" type="text" name="m_phone"placeholder="ex) 010-1234-1234"  maxlength="13"required="required" data-error="Course name is required.">
							<div class="button button_1 register_button mx-auto trans_200"><a href="#" onclick="findID()">Let's Find ID</a></div>
						</form:form>
						</div>
					</div>

				</div>

				<div class="col-lg-6 nopadding">
					
					<!-- Search -->

					<div class="search_section d-flex flex-column align-items-center justify-content-center">
						<div class="search_content text-center">
						<form:form commandName="member" name="findPW" method="post">
						<br>
							<br><h1 class="search_title">You can also find your password</h1><br><br><br><br>
								<input class="input_field search_form_name" type="text" name="m_id" placeholder="Input your ID"/>
								<input class="input_field search_form_category" type="text" name="m_name" placeholder="Input your Name"/>
								<input class="input_field search_form_category" type="text" name="m_phone"placeholder="ex) 010-1234-1234"  maxlength="13">
								<button id="search_submit_button" type="button" onclick="findPw()" class="search_submit_button trans_200" value="Submit">I... want... my password!</button>
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