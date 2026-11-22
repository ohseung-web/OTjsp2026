<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
	<jsp:include page="header.jsp"/>
	
	<% 
	String section = request.getParameter("section");
	if("".equals(section) || section == null) {
	%>
	<section>
	<h2>도서관리 프로그램</h2>
	</section>
	<%}else{ %>
	<jsp:include page="<%=section %>"/>
	<%} %>
	
	<jsp:include page="footer.jsp"/>
</body>
</html>