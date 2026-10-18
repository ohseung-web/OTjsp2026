<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- 주석 : Ctrl + Shift + /  -->
    <!-- 아래 선언문은 자바의 멤버변수가 된다. -->
	<%! public void inCremment(){} %>
	<!-- 아래 선언문은 전역변수 또는 멤버변수가 된다. -->
	<%! int i=0; %>
	<!-- 아래 스크립트릿은 지역변수가 된다.  -->
	<%  int i=0; %>
</body>
</html>

