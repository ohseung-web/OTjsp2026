<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 프로그램 ver 1.0</title>
</head>
<link rel="stylesheet" href="css/main.css">

<body>	
	<%
		request.setCharacterEncoding("utf-8");
	
		String pageName = request.getParameter("page");
		String contentName = "index.jsp";
		
		if("bookList".equals(pageName)) {
			contentName="bookList.jsp";
		} else if ("rentForm".equals(pageName)) {
			contentName ="rentForm.jsp";
		} else if ("rentProc".equals(pageName)) {
			contentName ="rentProc.jsp";
		} else if ("readerList".equals(pageName)) {
			contentName ="readerList.jsp";
		} else if ("bookStat".equals(pageName)) {
			contentName ="bookStat.jsp";
		} 
	%>


	<jsp:include page="header.jsp"></jsp:include>
	<section>
			<% if(contentName != "index.jsp") { %>
			<jsp:include page="<%=contentName %>" />
			
			<% } else { %>			
			<h2 style="font-weight:bold" >도서관리 프로그램</h2>
			<%}%>	
	</section>
	<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>