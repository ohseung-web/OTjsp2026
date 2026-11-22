<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 프로그램</title>
<link rel="stylesheet" href="style/main.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
		String pageName = request.getParameter("page");
		String content = "";
		if("bookList.jsp".equals(pageName)){
			content = "bookList.jsp";
		}else if("bookStat.jsp".equals(pageName)){
			content = "bookStat.jsp";
		}else if("readerList.jsp".equals(pageName)){
			content= "readerList.jsp";
		}else if("rentForm.jsp".equals(pageName)){
			content = "rentForm.jsp";
		}else if("index.jsp".equals(pageName)){
			content = "index.jsp";
		}
	%>
	

	
	<section>
	<%if(content.isEmpty()){%>
		<h2>도서관리 프로그램</h2>
	<%}else{%>
	<jsp:include page="<%= content %>"></jsp:include>
	<%} %>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
