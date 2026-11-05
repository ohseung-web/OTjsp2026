<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>머물:多 | 로그인</title>
<link rel="stylesheet" href="style/login.css">
</head>
<body>
	<div class="auth-layout">
		<aside class="brand-side">
			<a class="brand" href="index.jsp">⌂ 머물<span>:多</span></a>
			<p>전국 주요 10대 명소 숙소 예약 플랫폼</p>
			<div class="brand-copy">
				<small>WELCOME BACK</small>
				<h1>
					다시,<br>머물:多에서<br>여행을 이어가세요.
				</h1>
				<p>새로운 쉼표를 찾아 떠나는 여행</p>
			</div>
		</aside>
		<main class="auth-main">
			<section class="auth-card">
				<h2>로그인</h2>
				<p class="sub">회원 로그인 후 예약·찜·문의 서비스를 이용할 수 있습니다.</p>
				<form action="LoginProc.jsp" method="post">
					<label for="us_email">이메일</label><input type="email" id="us_email"
						name="us_email" maxlength="30" required placeholder="이메일을 입력하세요"><label
						for="us_password">비밀번호</label><input type="password"
						id="us_password" name="us_password" required
						placeholder="비밀번호를 입력하세요">
					<button type="submit">로그인</button>
				</form>
				<div class="divider">또는</div>
				<a class="outline-btn" href="MemberJoinForm.jsp">회원가입</a><a
					class="guest-link" href="GuestBookingLookup.jsp">비회원 예약조회 →</a>
				<p class="bottom">
					<a href="index.jsp">← 메인으로 돌아가기</a>
				</p>
			</section>
		</main>
	</div>
</body>
</html>