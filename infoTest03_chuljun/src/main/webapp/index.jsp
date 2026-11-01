<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 메인페이지</title>
<link rel="stylesheet" href="css/main.css"/>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String pageName = request.getParameter("page");
	String contentPage = "index.jsp";
	
	// nav 부분 연결하는 부분
	if("teacher".equals(pageName)){
		contentPage = "teacher.jsp";
	}else if("insert".equals(pageName)){
		contentPage = "insert.jsp";
	}else if("member".equals(pageName)){
		contentPage = "member.jsp";
	}else if("result".equals(pageName)){
		contentPage = "result.jsp";
	}
	
%>

<%-- 헤더 및 nav include 파일로 가져오기  --%>
<%@ include file = "header.jsp" %>

<%-- section --%>
<section>
	<% if(contentPage != "index.jsp"){ %>
		<jsp:include page="<%= contentPage %>"></jsp:include>
	<% }else { %>
		<h2>골프연습장 회원관리 프로그램</h2>
	<% } %>
</section>

<%-- 푸터 가져오기 --%>
<%@ include file = "footer.jsp" %>

</body>
</html>