<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
	<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리</title>
<link rel="stylesheet" href="style/main.css">
</head>
<body>

	<%
	request.setCharacterEncoding("utf-8");	
	String pageName = request.getParameter("page");
	String content = "";
	
	if("teacher.jsp".equals(pageName)){
		content = "teacher.jsp";
	}else if("member.jsp".equals(pageName)){
		content = "member.jsp";
	}else if("result.jsp".equals(pageName)){
		content = "result.jsp";
	}else if("insertProc.jsp".equals(pageName)){
		content = "insertProc.jsp";
	};
	
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<%if(content.equals("")){ %>
		<h2>골프연습장 회원관리 프로그램</h2>
	<%}else{ %>
		<jsp:include page="<%= content %>"></jsp:include>
	<%} %>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>