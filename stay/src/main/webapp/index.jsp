<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>머물:多 | 전국 숙소 예약</title>
<link rel="stylesheet" href="style/main.css">
</head>
<body>
	<header class="top">
		<div class="top-inner">
			<a class="logo" href="index.jsp">⌂ 머물<span>:多</span></a>
			<nav>
				<a href="index.jsp">홈</a> <a href="AccommodationList.jsp">숙소검색</a> <a
					href="BookingList.jsp">예약조회</a> <a href="InquiryList.jsp">1:1
					문의</a>
			</nav>
			<div class="user-links">
				<a href="LoginForm.jsp">로그인</a> <a class="join"
					href="MemberJoinForm.jsp">회원가입</a>
			</div>
		</div>
	</header>
	<section class="hero">
		<div class="hero-inner">
			<small>YOUR JOURNEY, YOUR STAY</small>
			<h1>
				머물 수 있는 곳이 많은<br>우리들의 여행, <span>머물:多</span>
			</h1>
			<p>전국 주요 10대 명소의 특별한 숙소를 만나보세요.</p>
		</div>
	</section>
	<main>
		<form class="search-box" action="AccommodationList.jsp" method="get">
			<div>
				<label for="ci_name">여행지</label><select name="ci_name" id="ci_name"><option
						value="">전체 지역</option>
					<option>서울</option>
					<option>부산</option>
					<option>제주</option>
					<option>인천</option>
					<option>평창</option>
					<option>안동</option>
					<option>여수</option>
					<option>경주</option>
					<option>제천</option>
					<option>태안</option></select>
			</div>
			<div>
				<label for="checkin">체크인</label><input type="date" name="checkin"
					id="checkin">
			</div>
			<div>
				<label for="checkout">체크아웃</label><input type="date" name="checkout"
					id="checkout">
			</div>
			<div>
				<label for="people">인원</label><select name="people" id="people"><option
						value="2">성인 2명</option>
					<option value="1">성인 1명</option>
					<option value="3">성인 3명</option>
					<option value="4">성인 4명</option></select>
			</div>
			<button>숙소 검색</button>
		</form>
		<section class="section">
			<div class="section-title">
				<div>
					<small>STAY YOUR WAY</small>
					<h2>어떤 숙소를 찾으세요?</h2>
				</div>
			</div>
			<div class="types">
				<a href="AccommodationList.jsp?ac_type=호텔"><span>▤</span>호텔</a><a
					href="AccommodationList.jsp?ac_type=모텔"><span>▥</span>모텔</a><a
					href="AccommodationList.jsp?ac_type=펜션"><span>⌂</span>펜션</a>
			</div>
		</section>
		<section class="section">
			<div class="section-title">
				<div>
					<small>EXPLORE KOREA</small>
					<h2>인기 여행지</h2>
					<p>전국 주요 10개 지역에서 특별한 하루를 만나보세요.</p>
				</div>
			</div>
			<div class="cities">
				<a href="AccommodationList.jsp?ci_name=서울" class="city"><img
					src="img/seoul.jpg" alt="서울"><strong>서울</strong></a><a
					href="AccommodationList.jsp?ci_name=부산" class="city"><img
					src="img/busan.jpg" alt="부산"><strong>부산</strong></a><a
					href="AccommodationList.jsp?ci_name=제주" class="city"><img
					src="img/jeju.jpg" alt="제주"><strong>제주</strong></a><a
					href="AccommodationList.jsp?ci_name=경주" class="city"><img
					src="img/gyeongju.jpg" alt="경주"><strong>경주</strong></a><a
					href="AccommodationList.jsp?ci_name=여수" class="city"><img
					src="img/yeosu.jpg" alt="여수"><strong>여수</strong></a>
			</div>
			<p class="city-more">
				<a href="AccommodationList.jsp">전체 지역 숙소 보기 →</a>
			</p>
		</section>
		<section class="section">
			<div class="section-title">
				<div>
					<small>CURATED STAYS</small>
					<h2>추천 숙소</h2>
					<p>여행의 설렘을 더해줄 공간을 소개합니다.</p>
				</div>
				<a href="AccommodationList.jsp">전체보기 →</a>
			</div>
			<div class="stays">
				<a class="stay" href="AccommodationDetail.jsp?ac_code=1"><img
					src="img/hotel1.jpg" alt="숙소 예시 1">
				<div>
						<small>제주 · 호텔</small>
						<h3>제주 오션뷰 호텔</h3>
						<p>바다를 품은 편안한 휴식</p>
						<strong>129,000원~ <em>/ 1박 예시</em></strong>
					</div></a><a class="stay" href="AccommodationDetail.jsp?ac_code=2"><img
					src="img/hotel2.jpg" alt="숙소 예시 2">
				<div>
						<small>부산 · 펜션</small>
						<h3>부산 블루 펜션</h3>
						<p>감성 가득한 바닷가 숙소</p>
						<strong>99,000원~ <em>/ 1박 예시</em></strong>
					</div></a><a class="stay" href="AccommodationDetail.jsp?ac_code=3"><img
					src="img/hotel3.jpg" alt="숙소 예시 3">
				<div>
						<small>서울 · 호텔</small>
						<h3>서울 시티 호텔</h3>
						<p>도심 속 여유로운 하루</p>
						<strong>119,000원~ <em>/ 1박 예시</em></strong>
					</div></a>
			</div>
		</section>
		<section class="cta">
			<div>
				<small>MEOMULDA TRAVEL</small>
				<h2>여행의 시작부터 마지막까지</h2>
				<p>예약조회와 1:1 문의를 한곳에서 편리하게 이용하세요.</p>
			</div>
			<a href="BookingList.jsp">나의 예약 확인 →</a>
		</section>
	</main>
	<footer>
		머물:多 · 전국 주요 10대 명소 숙소 예약 플랫폼<br>
		<small>2조 학생 프로젝트 · 디자인 시안</small>
	</footer>
</body>
</html>