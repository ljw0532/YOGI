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
<meta charset="UTF-8">
<title>멤버 프로필 창</title>
<script type="text/javascript">
function report(m_pno) {
	window.opener.location.href="http://localhost:8080/yogi/report/reportForm?m_pno="+m_pno;
	self.close();
}
function end(){
	self.close();
}
</script>
<style type="text/css">
.circle-cropper {
  background-repeat: no-repeat;
  background-size: cover;
  background-position: 50%;
  border-radius: 50%;
  width: 200px;
  height: 200px;
}

.btn{
	border: 1px solid transparent;
	text-align: center;
	border-radius: .25em;
	background-color: #FFC300;
	padding: 10px;
}
</style>
</head>
<body>

<div align="center" style="background-color: #f3f3f3">
	<form:form commandName="user" name="user" method="post" enctype="multipart/form-data">
		<div style="padding: 15px; background-color: #FFC300;">
				<font style="font-weight: bold; font-size: x-large; ">[${userInfo.M_NAME }]</font>'s Profile
			</div>
		<div style="padding-top: 30px;">
			<div class="circle-cropper" style="background-image:url(/yogi/resources/upload/${userInfo.M_PROFILE });"></div>
		</div>
		<div style="padding-top: 30px;">
			<input type="hidden" name="m_no" value="${userInfo.M_NO }">
			<div style="padding: 10px; background-color: white;">
				<font>ID : </font><font style="font-weight: bold;">${userInfo.M_ID }</font>
			</div>
			<div style="padding: 10px;">
				<font>이름 : </font><font>${userInfo.M_NAME}</font>
			</div>
			<div style="padding: 10px; background-color: white;">
				<font>등급 : </font><font>${userInfo.M_LV }</font>
			</div>
			<div style="padding: 10px;">
				<font>페널티 : </font><font color="red">${userInfo.M_PENALTY }</font>
			</div>
		</div>
		<div style="padding-top: 40px; padding-bottom: 10px;">
			<c:if test="${group !='0' }">
			<input class="btn" type="button" value="신고하기" onclick="report('${userInfo.M_NO }')">
			</c:if>
			<input class="btn" style="background-color: gray;" type="button" value="닫기" onclick="end()">
		</div>
	</form:form>
</div>
</body>
</html>