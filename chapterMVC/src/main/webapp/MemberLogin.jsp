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
    <div class="memberbox">
        <div class="memberlogo">STAY BLUE</div>

        <h2>로그인</h2>
        <p class="subtitle">편안한 여행을 시작해 보세요.</p>

        <form action="loginProc.do" method="post">
            <div class="formgroup">
                <label>아이디</label>
                <input type="text" name="id"
                       placeholder="아이디를 입력하세요" required>
            </div>

            <div class="formgroup">
                <label>비밀번호</label>
                <input type="password" name="password"
                       placeholder="비밀번호를 입력하세요" required>
            </div>

            <input type="submit" class="mainbtn" value="로그인">
        </form>

        <div class="memberfooter">
            아직 회원이 아니신가요?
            <a href="MemberJoinForm.jsp">회원가입</a>
        </div>
    </div>
</div>
</body>
</html>