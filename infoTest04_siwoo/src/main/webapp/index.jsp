<%@page import="org.apache.jasper.compiler.Node.IncludeAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");
    String pageName = request.getParameter("page");
    String contentPage = "index.jsp"; 
        
    if("bookList".equals(pageName)){
        contentPage = "bookList.jsp";
    }else if("bookStat".equals(pageName)){
        contentPage = "bookStat.jsp";
    }else if("readerList".equals(pageName)){
        contentPage = "readerList.jsp";
    }else if("rentForm".equals(pageName)){
        contentPage = "rentForm.jsp";
    }else if("rentProc".equals(pageName)){
        contentPage = "rentProc.jsp";
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관리 프로그램</title>
<link rel="stylesheet" href="style/main.css">
</head>
<body>

    <jsp:include page="header.jsp" />

    <section>
    <% if(pageName == null || "".equals(pageName)){ %>
        <h2>도서관리 프로그램</h2>    
    <% } else { %>
        <jsp:include page="<%= contentPage %>" />
    <% } %>
    </section>

    <jsp:include page="footer.jsp" />

</body>
</html>