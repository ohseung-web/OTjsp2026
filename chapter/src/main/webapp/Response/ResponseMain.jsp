<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	   // get방식으로 넘겨주어서 아래 코드는 사실 안써도 무방하다.	
	   request.setCharacterEncoding("utf-8");
	%>
	<h2><%= request.getParameter("id") %>님 환영합니다.</h2>
</body>
</html>