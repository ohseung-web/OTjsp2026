<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.util.Base64" %>
<%@ page import="javax.crypto.SecretKeyFactory" %>
<%@ page import="javax.crypto.spec.PBEKeySpec" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
	   PBKDF2 (포트폴리오 권장)

       SHA-256은 계산이 너무 빨라서 공격자가 초당 수십억 번 대입할 수 있어요. 
       PBKDF2는 일부러 반복 계산(수만 번) 해서 속도를 늦추는 방식이라 훨씬 안전합니다. 
       자바 기본 라이브러리에 들어 있어서 별도 설치도 필요 없어요.
	
	 -->
	 <%
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");

		// 1) 랜덤 솔트 생성
		byte[] saltBytes = new byte[16];
		new SecureRandom().nextBytes(saltBytes);

		// 2) PBKDF2 설정: 비밀번호, 솔트, 반복횟수, 결과 길이(비트)
		int iterations = 100000;
		PBEKeySpec spec = new PBEKeySpec(pass.toCharArray(), saltBytes, iterations, 256);

		// 3) 해시 계산
		SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
		byte[] hashBytes = skf.generateSecret(spec).getEncoded();

		String salt = Base64.getEncoder().encodeToString(saltBytes);
		String hashedPass = Base64.getEncoder().encodeToString(hashBytes);
	%>
		<h2>당신의 아이디는 <%= id %>입니다.</h2>
		<h3>솔트 : <%= salt %></h3>
		<h3>PBKDF2 해시 : <%= hashedPass %></h3>
</body>
</html>