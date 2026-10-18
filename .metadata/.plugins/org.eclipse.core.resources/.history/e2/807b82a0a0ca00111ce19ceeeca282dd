<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Reauestlogin에서 넘어온 아이디와 패스워드를 읽어드림 -->
	<!-- 정보를 읽어들이는 방법 2가지
	     1) Request 내장객체를 이용한다., Request는 자바코드이므로 스크립트릿을 이용한다.
	     2) 단, Request의 범위는 Requestlogin.jsp에서 action으로 넘겨주었던 RequestloginProc.jsp
	        까지이다. 아래 a태그의 RequestForword.jsp는 자료를 넘겨줄수 없다.
	 -->
	 <%
	 	// 사용자의 정보가 저장되어있는 객체 request의 getParameter()를 이용하여 사용자의 정보를 추출
	 	// request.getParameter("Requestlogin.jsp파일의 id입력하는 input택으의 name을 작성한다.")
	 	String id = request.getParameter("id"); //사용장의 id값을 읽어들여서 변수 id에 저장하시오.
	 	String pass = request.getParameter("pass"); //사용장의 pass값을 읽어들여서 변수 pass에 저장하시오.
	 %>
	 <h2>당신의 아이디는 <%= id %>이고, 패스워드는 <%= pass %>입니다.</h2>
	 <a href="RequestForword.jsp">다음페이지</a>
</body>
</html>