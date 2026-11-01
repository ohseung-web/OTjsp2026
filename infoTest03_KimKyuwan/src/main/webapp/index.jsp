<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/main.css">
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<% 
	String pageName = "";
	if(null != request.getParameter("pageName")) pageName = request.getParameter("pageName");
	if(pageName == null || pageName.equals("")) {
	%>
		<section>
			<h2>골프연습장 회원관리 프로그램</h2>
		</section>
	
	<% 
	}else{
	%>
	
	<jsp:include page="<%=pageName %>"></jsp:include>
	
	<%
	}
	%>
	
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>