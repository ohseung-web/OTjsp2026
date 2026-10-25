<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 변수를 JSTL 방식으로 선언한다. -->
    <c:set var="i" value="4" />
    <%-- c:set은 옆의 기능과 같다. <% request.setAttribute("i", 4) %> --%>
    
    
    <!-- JSTL에서 c:if문의 test안의 조건은 반드시 EL표현식을 사용해야 한다.  -->
	<c:if test="${i>3}">
		안녕하세요
	</c:if>
	
	<!-- 반복문 -->
	<c:forEach var="i" begin="1" end="10" step="${i+1}">
	   점심시간 <br>
	</c:forEach>
	
	<h3> 변수 설정</h3>
	<c:set var="name">홍길동</c:set>
	<c:set var="age" value="25" />
	나의 이름은 <c:out value="${name}" /><br/>
	나의 나이는 <c:out value="${age}" />입니다.
	
	<h3>변수 삭제</h3>
	<c:remove var="name"/>
	나의 이름은 <c:out value="${name}" /><br/>
	나의 나이는 <c:out value="${age}" /><br/>
	나의 키는 <c:out value="${height}" />입니다.
	
	
	
</body>
</html>