<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
<script>
	function myReportList() {
		window.open('/yogi/mypage/reportHistory','report',"width=500, height=400, left=450, top=100" );
		
	}
</script>
</head>
<body>
<table border="0" width=1000px align=center>
      <h1 align="center">마이 페이지</h1>
</table>


<div align="center">
<!-- 프로필 사진 띄우기 -->
<table>
<tr>
	<td>${session_m_id }님  
	<c:if test="${member.M_GRADE lt 50 }">
	<img src="/yogi/resources/image/lv-b.png">
	</c:if>
		
	<c:if test="${member.M_GRADE ge 50 && member.M_GRADE lt 100}">
	<img src="/yogi/resources/image/lv-s.png">
	</c:if>
	
	<c:if test="${member.M_GRADE ge 100 && member.M_GRADE lt 200}">
	<img src="/yogi/resources/image/lv-g.png">
	</c:if>
	
	<c:if test="${member.M_GRADE ge 200 && member.M_GRADE lt 300}">
	<img src="/yogi/resources/image/lv-v.png">
	</c:if>
	
	<c:if test="${member.M_GRADE ge 300 && member.M_GRADE le 400}">
	<img src="/yogi/resources/image/lv-w.png">
	</c:if>
	</td>
	
</tr>

<tr>
<td>회원님은 "${member.M_LV }" 이십니다 !</td>
</tr>

<tr>
<td>보유 포인트 :  ${member.M_GRADE }
</tr>

<tr>
	<td>
		<input type="button" value="프로필 수정" /><br /><!-- 프로필 수정 링크 연결 추가 -->
	</td>
</tr>

<tr>
	<td>신고 횟수 : ${member.M_PENALTY }</td>
</tr>

<tr>
	<td><input type="button" onclick="myReportList();" value="신고내역 확인하기" />
	</td>
</tr>
</table>
</div>
<br />
<div align="center">
<a href="<c:url value='/mypage/writeHistory'/>">내가 개설한 모임</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<c:url value='/mypage/meetHistory'/>">내가 참여한 모임</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<c:url value='/mypage/zzimHistory'/>">나의 찜 목록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="<c:url value='/mypage/placebookHistory'/>">장소 신청 내역</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>

</body>
</html>