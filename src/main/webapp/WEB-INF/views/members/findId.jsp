<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 결과창!</title>
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
<script>
	function end(){
		window.opener.location.href="http://localhost:8080/yogi/";
		self.close();
	}
</script>
<body>
<div class="super_container">

	<div class="register">
		<div class="container-fluid">
			<div class="row row-eq-height">
				<div class="col-lg-6 nopadding">

					<div class="register_section d-flex flex-column align-items-center justify-content-center">
						<div class="register_content text-center">
							<h1 class="register_title">YOUR ID IS<br><span>" ${member.m_id} "</span></h1>
							<div class="button button_1 register_button mx-auto trans_200"><a href="#" onclick="end()">Let's go to LogIn!</a></div>
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