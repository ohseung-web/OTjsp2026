<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<header>
	도서관리 프로그램 ver 1.0
</header>
<nav>
	<a href="index.jsp?page=bookList">도서조회</a>
	<a href="index.jsp?page=rentForm">대출신청</a>
	<a href="index.jsp?page=readerList">대출현황조회</a>
	<a href="index.jsp?page=bookStat">도서대출실적</a>
	<a href="index.jsp">홈으로</a>
</nav>