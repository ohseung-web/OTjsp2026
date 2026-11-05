<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style/member.css">
</head>
<body>


<div class="memberwrap">
    <div class="joinbox">
        <div class="joinlogo">STAY BLUE</div>
        <h2>회원가입</h2>
        <p>특별한 여행을 위한 첫걸음</p>

        <form action="MemberJoinProc.jsp" method="post">
            <label>아이디</label>
            <input type="text" name="id"
                   placeholder="아이디를 입력하세요" required>

            <label>비밀번호</label>
            <input type="password" name="pass"
                   placeholder="비밀번호를 입력하세요" required>

            <label>비밀번호 확인</label>
            <input type="password" name="passchk"
                   placeholder="비밀번호를 다시 입력하세요" required>

            <label>이름</label>
            <input type="text" name="name"
                   placeholder="이름을 입력하세요" required>

            <label>이메일</label>
            <input type="email" name="email"
                   placeholder="example@email.com">

            <label>전화번호</label>
            <input type="tel" name="tel"
                   placeholder="010-1234-5678">

            <input type="submit" value="회원가입" class="joinbtn">
        </form>

        <div class="joinfooter">
            이미 회원이신가요?
            <a href="Login.jsp">로그인</a>
        </div>
    </div>
</div>
	
</body>
</html>