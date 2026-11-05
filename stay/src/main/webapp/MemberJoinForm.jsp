<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>머물:多 | 회원가입</title>
<link rel="stylesheet" href="style/join.css">
</head>
<body>
	<div class="auth-layout">
		<aside class="brand-side">
			<a class="brand" href="index.jsp">⌂ 머물<span>:多</span></a>
			<p>전국 주요 10대 명소 숙소 예약 플랫폼</p>
			<div class="brand-copy">
				<small>WELCOME TO MEOMULDA</small>
				<h1>
					지금,<br>머물:多와 함께<br>특별한 여행을 시작하세요.
				</h1>
				<p>당신의 여행이 편안하게 머무는 곳</p>
			</div>
		</aside>
		<main class="auth-main">
			<section class="auth-card">
				<h2>회원가입</h2>
				<p class="sub">간단한 정보로 머물다의 다양한 서비스를 이용하세요.</p>
				<form action="MemberJoinProc.jsp" method="post"
					onsubmit="return checkJoin()">
					<label for="us_name">이름</label><input id="us_name" name="us_name"
						maxlength="20" required placeholder="이름을 입력하세요"> <label
						for="us_email">이메일</label><input type="email" id="us_email"
						name="us_email" maxlength="30" required
						placeholder="example@email.com"> <label for="us_password">비밀번호</label><input
						type="password" id="us_password" name="us_password" required
						placeholder="비밀번호를 입력하세요" autocomplete="new-password"> <label
						for="password_check">비밀번호 확인</label><input type="password"
						id="password_check" required placeholder="비밀번호를 다시 입력하세요"
						autocomplete="new-password"> <label for="us_phone">휴대폰번호</label><input
						id="us_phone" name="us_phone" type="tel" pattern="[0-9]{10,11}"
						maxlength="11" required placeholder="숫자만 입력 (01012345678)">
					<label for="us_birth">생년월일</label><input type="date" id="us_birth"
						name="us_birth" required> <label>성별</label>
					<div class="radio-row">
						<label><input type="radio" name="us_gender" value="1"
							required> 남성</label><label><input type="radio"
							name="us_gender" value="2"> 여성</label>
					</div>
					<label class="agree"><input type="checkbox" required>
						이용약관 및 개인정보 수집·이용에 동의합니다.</label>
					<button type="submit">회원가입</button>
					<p class="bottom">
						이미 계정이 있으신가요? <a href="LoginForm.jsp">로그인</a>
					</p>
				</form>
			</section>
		</main>
	</div>
	<script>function checkJoin(){var a=document.getElementById('us_password').value;var b=document.getElementById('password_check').value;if(a!==b){alert('비밀번호가 일치하지 않습니다.');return false;}return true;}</script>
</body>
</html>