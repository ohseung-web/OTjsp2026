<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 프로그램</title>
<link rel="stylesheet" href="css/main.css"/>
</head>
<body>
<% 
	// 인코딩 page관련 변수설정
	request.setCharacterEncoding("utf-8");
	String pageName = request.getParameter("page");
	String contentPage = "index.jsp";
	
	// nav 연결부분
	if("bookList".equals(pageName)){
		contentPage = "bookList.jsp";
	}else if("rentForm".equals(pageName)){
		contentPage = "rentForm.jsp";
	}else if("readerList".equals(pageName)){
		contentPage = "readerList.jsp";
	}else if("bookStat".equals(pageName)){
		contentPage = "bookStat.jsp";
	}
%>

<%-- 헤더 가져오기 --%>
<%@ include file = "header.jsp" %>

<%-- 섹션 --%>
<section>
	<%if(contentPage != "index.jsp"){ %>
		<jsp:include page = "<%=contentPage %>"></jsp:include>
	<% }else { %>
		<h2>도서관리 프로그램</h2>
	<% } %>	
</section>

<%-- 푸터 가져오기 --%>
<%@ include file = "footer.jsp" %>
</body>
</html>