<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 세션네임 페이지</h2>
	<%
	   //String name1 = request.getParameter("name");
	   // Type mismatch: cannot convert from Object to String
	   // 다운캐스팅 해야한다.
	   String name2 = (String)session.getAttribute("name1");
	
	%>
	<%= name2 %>님 환영합니다.
</body>
</html>