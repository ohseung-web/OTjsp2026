<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!-- OUT : JSP내장객체로 JSP 페이지에 출력할 내용을 가지고 있는 출력 객체  -->
		<%
			String name ="알리미 어플";
		%>
		스크립트로 표현시 <%=name %> 화면에 출력
		<p><% out.write(name + "이 화면에 출력"); %></p>
</body>
</html>