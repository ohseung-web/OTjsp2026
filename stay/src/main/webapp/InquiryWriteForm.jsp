<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>머물:多 | 문의 작성</title>
<link rel="stylesheet" href="style/inquiry.css">
</head>
<body>
	<header class="top">
		<a class="logo" href="index.jsp">⌂ 머물<span>:多</span></a>
		<nav>
			<a href="index.jsp">홈</a><a class="current" href="InquiryList.jsp">1:1
				문의</a><a href="LoginForm.jsp">로그인</a>
		</nav>
	</header>
	<div class="banner">
		<small>HELP CENTER</small>
		<h1>문의 작성</h1>
		<p>문의하실 내용을 자세히 입력해 주세요.</p>
	</div>
	<main class="container">
		<section class="write-card">
			<h2>1:1 문의 작성</h2>
			<form action="InquiryWriteProc.jsp" method="post">
				<label for="in_title">문의 제목</label><input id="in_title"
					name="in_title" maxlength="50" required placeholder="문의 제목을 입력하세요"><label
					for="in_content">문의 내용</label>
				<textarea id="in_content" name="in_content" rows="10" required
					placeholder="문의 내용을 입력하세요"></textarea>
				<p class="hint">작성일과 회원코드는 서버에서 자동으로 등록합니다.</p>
				<div class="actions">
					<a href="InquiryList.jsp" class="outline">취소</a>
					<button type="submit" class="primary">문의 등록</button>
				</div>
			</form>
		</section>
	</main>
</body>
</html>