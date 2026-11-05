
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>STAY BLUE - 리뷰 작성</title>
    <link rel="stylesheet" href="style/review.css">
</head>
<body>

<div class="review-layout">

    <!-- 왼쪽 메뉴 -->
    <aside class="review-sidebar">
        <div class="review-logo">
            <div class="logo-icon">▥</div>
            <h2>STAY BLUE</h2>
            <p>HOTEL & RESERVATION</p>
        </div>

        <nav class="review-nav">
            <a href="MyPage.jsp">♙ &nbsp; 마이페이지</a>
            <a href="ReservationList.jsp">▦ &nbsp; 예약내역</a>
            <a href="InquiryList.jsp">☏ &nbsp; 1:1 문의</a>
            <a href="ReviewList.jsp" class="active">☆ &nbsp; 리뷰</a>
            <a href="MemberDelete.jsp">⇥ &nbsp; 회원탈퇴</a>
        </nav>
        <div class="sidebar-photo"></div>
    </aside>

    <main class="review-main">

        <div class="review-banner">
            <div class="banner-icon">✎</div>
            <div>
                <h1>리뷰 작성</h1>
                <p>이용하신 숙소의 솔직한 후기를 남겨주세요.</p>
                <p>여러분의 후기가 다른 여행자에게 도움이 됩니다.</p>
            </div>
        </div>

        <div class="review-container">

            <div class="review-tabs">
                <a href="ReviewList.jsp">▣ &nbsp; 리뷰 목록</a>
                <a href="ReviewWriteForm.jsp" class="active">
                    ✎ &nbsp; 리뷰 작성
                </a>
            </div>

            <div class="review-form-box">
                <h2>숙소 이용 후기 작성</h2>
                <p class="form-guide">
                    이용하신 숙소에 대한 평가를 남겨주세요.
                </p>

                <form action="ReviewWriteProc.jsp" method="post">

                    <div class="form-group">
                        <label>이용 숙소</label>
                        <select name="acc_code" required>
                            <option value="">숙소를 선택하세요</option>
                            <option value="1">오션뷰 호텔</option>
                            <option value="2">블루 리조트</option>
                            <option value="3">시티 호텔</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>숙소 평점</label>
                        <select name="rev_rating" required>
                            <option value="">평점을 선택하세요</option>
                            <option value="5">★★★★★ 매우 만족 (5점)</option>
                            <option value="4">★★★★☆ 만족 (4점)</option>
                            <option value="3">★★★☆☆ 보통 (3점)</option>
                            <option value="2">★★☆☆☆ 불만족 (2점)</option>
                            <option value="1">★☆☆☆☆ 매우 불만족 (1점)</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>리뷰 내용</label>
                        <textarea name="rev_content"
                            placeholder="객실 청결도, 서비스, 시설 등 이용 후기를 작성해 주세요."
                            required></textarea>
                    </div>

                    <div class="review-form-buttons">
                        <button type="button" class="cancel-btn"
                            onclick="location.href='ReviewList.jsp'">
                            목록으로
                        </button>
                        <input type="submit" value="리뷰 등록"
                               class="submit-btn">
                    </div>

                </form>
            </div>

            <div class="review-notice">
                <div class="notice-icon">ⓘ</div>
                <div>
                    <p>· 실제 이용하신 숙소의 후기를 작성해 주세요.</p>
                    <p>· 욕설이나 광고성 내용은 삭제될 수 있습니다.</p>
                </div>
            </div>

        </div>
    </main>
</div>

</body>
</html>
