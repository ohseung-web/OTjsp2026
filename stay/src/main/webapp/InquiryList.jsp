<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>머물:多 | 1:1 문의</title>
<link rel="stylesheet" href="style/inquiry.css">
</head>
<body>
	<header class="top">
		<a class="logo" href="index.jsp">⌂ 머물<span>:多</span></a>
		<nav>
			<a href="index.jsp">홈</a><a href="BookingList.jsp">예약조회</a><a
				class="current" href="InquiryList.jsp">1:1 문의</a><a
				href="LoginForm.jsp">로그인</a>
		</nav>
	</header>
	<div class="banner">
		<small>HELP CENTER</small>
		<h1>1:1 문의</h1>
		<p>여행 중 궁금한 점을 편하게 남겨주세요.</p>
	</div>
	<main class="container">
		<div class="heading">
			<div>
				<h2>나의 문의내역</h2>
				<p>문의내용과 답변 진행 상태를 확인하세요.</p>
			</div>
			<a class="primary" href="InquiryWriteForm.jsp">＋ 문의 작성</a>
		</div>
		<div class="toolbar">
			<span>전체 문의 <strong>3</strong>건 <em>(화면 예시)</em></span>
			<form action="InquiryList.jsp" method="get">
				<select name="searchType"><option value="title">제목</option>
					<option value="content">내용</option></select><input name="keyword"
					placeholder="검색어 입력">
				<button>검색</button>
			</form>
		</div>
		<div class="table-wrap">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>답변 상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>3</td>
						<td class="subject"><a href="InquiryDetail.jsp?in_code=3">체크인
								시간을 변경할 수 있나요?</a></td>
						<td>2026-11-05</td>
						<td><span class="status wait">답변대기</span></td>
					</tr>
					<tr>
						<td>2</td>
						<td class="subject"><a href="InquiryDetail.jsp?in_code=2">예약
								취소 관련 문의드립니다.</a></td>
						<td>2026-11-03</td>
						<td><span class="status done">답변완료</span></td>
					</tr>
					<tr>
						<td>1</td>
						<td class="subject"><a href="InquiryDetail.jsp?in_code=1">주차
								이용이 가능한가요?</a></td>
						<td>2026-10-30</td>
						<td><span class="status done">답변완료</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="paging">
			‹ <b>1</b> 2 3 ›
		</div>
		<div class="notice">
			<strong>안내사항</strong>
			<p>· 1:1 문의는 로그인한 회원만 작성할 수 있습니다.</p>
			<p>· 문의 답변은 관리자 확인 후 등록됩니다.</p>
			<p>· 이 화면은 DB 연결 전 디자인 예시입니다.</p>
		</div>
	</main>
</body>
</html>