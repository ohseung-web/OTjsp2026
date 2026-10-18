<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%
	 	// 사용자의 정보가 저장되어있는 객체 request의 getParameter()를 이용하여 사용자의 정보를 추출
	 	// request.getParameter("Requestlogin.jsp파일의 id입력하는 input택으의 name을 작성한다.")
	 	String id = request.getParameter("id"); //사용장의 id값을 읽어들여서 변수 id에 저장하시오.
	 	String pass = request.getParameter("pass"); //사용장의 pass값을 읽어들여서 변수 pass에 저장하시오.
	 %>
	 <h1>여기는 RequestForword 페이지 입니다.</h1>
	 <h2>당신의 아이디는 <%= id %>이고, 패스워드는 <%= pass %>입니다.</h2>
</body>
</html>