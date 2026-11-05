
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>STAY BLUE - 리뷰 게시판</title>
    <link rel="stylesheet" href="style/review.css">
</head>
<body>

<div class="review-layout">

    <!-- 왼쪽 사이드 메뉴 -->
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

    <!-- 오른쪽 본문 -->
    <main class="review-main">

        <!-- 상단 배너 -->
        <div class="review-banner">
            <div class="banner-icon">☆</div>
            <div>
                <h1>리뷰</h1>
                <p>이용하신 숙소에 대한 솔직한 후기를 남겨주세요.</p>
                <p>다른 고객에게도 소중한 도움이 됩니다.</p>
            </div>
        </div>

        <div class="review-container">

            <!-- 상단 탭 -->
            <div class="review-tabs">
                <a href="ReviewList.jsp" class="active">
                    ▣ &nbsp; 리뷰 목록
                </a>
                <a href="ReviewWriteForm.jsp">
                    ✎ &nbsp; 리뷰 작성
                </a>
            </div>

            <!-- 검색 영역 -->
            <form action="ReviewList.jsp" method="get"
                  class="review-search">

                <select name="acc_code">
                    <option value="">전체 숙소</option>
                    <option value="1">오션뷰 호텔</option>
                    <option value="2">블루 리조트</option>
                    <option value="3">시티 호텔</option>
                </select>

                <select name="sort">
                    <option value="new">최신순</option>
                    <option value="rating">평점 높은순</option>
                    <option value="like">좋아요순</option>
                </select>

                <input type="text" name="keyword"
                       placeholder="검색어를 입력하세요.">

                <button type="submit" class="search-btn">
                    검색
                </button>
            </form>

            <!-- 첫 번째 리뷰 -->
            <div class="review-item">
                <img src="img/hotel1.jpg" alt="숙소 사진"
                     class="hotel-img">

                <div class="review-info">
                    <div class="review-info-top">
                        <h3>오션뷰가 정말 최고였어요!</h3>
                        <span>green01　|　2026-11-05 14:20</span>
                    </div>

                    <div class="review-rating">
                        <span class="stars">★★★★★</span>
                        <strong>5.0</strong>
                    </div>

                    <p class="review-text">
                        객실이 깨끗하고 전망이 너무 좋았습니다.
                        직원분들도 친절해서 편하게 쉬다 왔어요.
                        다음에도 꼭 다시 이용하고 싶습니다.
                    </p>
                </div>

                <button type="button" class="like-btn">
                    ♡ 52
                </button>
            </div>

            <!-- 두 번째 리뷰 -->
            <div class="review-item">
                <img src="img/hotel2.jpg" alt="숙소 사진"
                     class="hotel-img">

                <div class="review-info">
                    <div class="review-info-top">
                        <h3>가족 여행으로 만족!</h3>
                        <span>blue23　|　2026-11-04 18:32</span>
                    </div>

                    <div class="review-rating">
                        <span class="stars">★★★★<span class="empty-star">★</span></span>
                        <strong>4.0</strong>
                    </div>

                    <p class="review-text">
                        가족들과 함께 이용했는데 객실이 넓고
                        조용해서 좋았어요. 부대시설도 잘 되어
                        있어서 아이들도 즐거워했습니다.
                    </p>
                </div>

                <button type="button" class="like-btn">
                    ♡ 38
                </button>
            </div>

            <!-- 세 번째 리뷰 -->
            <div class="review-item">
                <img src="img/hotel3.jpg" alt="숙소 사진"
                     class="hotel-img">

                <div class="review-info">
                    <div class="review-info-top">
                        <h3>깔끔하고 가성비 좋아요.</h3>
                        <span>stay77　|　2026-11-03 16:41</span>
                    </div>

                    <div class="review-rating">
                        <span class="stars">★★★★★</span>
                        <strong>5.0</strong>
                    </div>

                    <p class="review-text">
                        가격 대비 시설이 정말 좋습니다.
                        침구도 깨끗하고 위치도 편리했어요.
                        추천합니다!
                    </p>
                </div>

                <button type="button" class="like-btn">
                    ♡ 25
                </button>
            </div>

            <!-- 하단 페이지 번호 -->
            <div class="review-bottom">
                <div class="review-paging">
                    <a href="#">«</a>
                    <a href="#">‹</a>
                    <a href="#" class="active">1</a>
                    <a href="#">2</a>
                    <a href="#">3</a>
                    <a href="#">4</a>
                    <a href="#">5</a>
                    <a href="#">›</a>
                    <a href="#">»</a>
                </div>

                <button type="button" class="write-btn"
                    onclick="location.href='ReviewWriteForm.jsp'">
                    ✎ &nbsp; 리뷰 작성
                </button>
            </div>

            <!-- 안내문 -->
            <div class="review-notice">
                <div class="notice-icon">ⓘ</div>
                <div>
                    <p>· 실제 이용하신 숙소에 대한 리뷰만 작성해 주세요.</p>
                    <p>· 비방, 욕설, 광고성 글은 관리자에 의해 삭제될 수 있습니다.</p>
                    <p>· 리뷰 삭제는 작성자 본인만 가능합니다.</p>
                </div>
            </div>

        </div>
    </main>
</div>

</body>
</html>
