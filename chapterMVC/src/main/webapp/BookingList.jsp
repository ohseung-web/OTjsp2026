
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>STAY BLUE - 예약내역</title>
    <link rel="stylesheet" href="style/booking.css">
</head>
<body>

<div class="booking-layout">

    <!-- 왼쪽 사이드 메뉴 -->
    <aside class="booking-sidebar">

        <div class="booking-logo">
            <div class="logo-icon">▥</div>
            <h2>STAY BLUE</h2>
            <p>HOTEL & RESERVATION</p>
        </div>

        <nav class="booking-nav">
            <a href="MyPage.jsp">♙ &nbsp; 마이페이지</a>
            <a href="BookingList.jsp" class="active">
                ▦ &nbsp; 예약내역
            </a>
            <a href="InquiryList.jsp">☏ &nbsp; 1:1 문의</a>
            <a href="ReviewList.jsp">☆ &nbsp; 리뷰</a>
            <a href="MemberDelete.jsp">⇥ &nbsp; 회원탈퇴</a>
        </nav>

        <div class="sidebar-photo"></div>
    </aside>

    <!-- 오른쪽 메인 화면 -->
    <main class="booking-main">

        <!-- 상단 배너 -->
        <div class="booking-banner">
            <div class="banner-icon">▦</div>
            <div>
                <h1>예약내역</h1>
                <p>예약하신 숙소와 일정을 확인해 보세요.</p>
                <p>편안하고 즐거운 여행을 준비하세요.</p>
            </div>
        </div>

        <div class="booking-container">

            <!-- 예약 상태별 메뉴 -->
            <div class="booking-tabs">
                <a href="BookingList.jsp" class="active">
                    전체 예약
                </a>
                <a href="BookingList.jsp?status=complete">
                    예약 완료
                </a>
                <a href="BookingList.jsp?status=cancel">
                    취소 내역
                </a>
            </div>

            <div class="booking-title">
                <h2>나의 예약내역</h2>
                <p>예약하신 숙소 정보를 확인할 수 있습니다.</p>
            </div>

            <!-- 첫 번째 예약 -->
            <div class="booking-card">

                <div class="booking-card-header">
                    <div>
                        <span class="booking-number">
                            예약번호 : 202611050001
                        </span>
                        <span class="booking-date">
                            예약일 : 2026-11-05
                        </span>
                    </div>

                    <span class="booking-status complete">
                        예약완료
                    </span>
                </div>

                <div class="booking-card-body">

                    <img src="img/hotel1.jpg"
                         alt="숙소 사진" class="booking-img">

                    <div class="booking-info">
                        <h3>오션뷰 호텔</h3>
                        <p class="room-name">디럭스 오션룸</p>

                        <div class="booking-dates">
                            <p>
                                <strong>체크인</strong>
                                2026-11-15
                            </p>
                            <p>
                                <strong>체크아웃</strong>
                                2026-11-17
                            </p>
                        </div>

                        <p class="booking-nights">2박 3일</p>
                    </div>
                </div>

                <div class="booking-card-footer">
                    <button class="detail-btn"
                        onclick="location.href='BookingDetail.jsp?book_code=1'">
                        예약 상세보기
                    </button>

                    <button class="cancel-btn"
                        onclick="location.href='BookingDetail.jsp?book_code=1'">
                        예약 취소
                    </button>
                </div>
            </div>

            <!-- 두 번째 예약 -->
            <div class="booking-card">

                <div class="booking-card-header">
                    <div>
                        <span class="booking-number">
                            예약번호 : 202610200002
                        </span>
                        <span class="booking-date">
                            예약일 : 2026-10-15
                        </span>
                    </div>

                    <span class="booking-status used">
                        이용완료
                    </span>
                </div>

                <div class="booking-card-body">

                    <img src="img/hotel2.jpg"
                         alt="숙소 사진" class="booking-img">

                    <div class="booking-info">
                        <h3>시티 호텔</h3>
                        <p class="room-name">스탠다드 트윈룸</p>

                        <div class="booking-dates">
                            <p>
                                <strong>체크인</strong>
                                2026-10-20
                            </p>
                            <p>
                                <strong>체크아웃</strong>
                                2026-10-22
                            </p>
                        </div>

                        <p class="booking-nights">2박 3일</p>
                    </div>
                </div>

                <div class="booking-card-footer">
                    <button class="detail-btn"
                        onclick="location.href='BookingDetail.jsp?book_code=2'">
                        예약 상세보기
                    </button>

                    <button class="review-btn"
                        onclick="location.href='ReviewWriteForm.jsp'">
                        리뷰 작성
                    </button>
                </div>
            </div>

            <!-- 세 번째 예약 : 취소 -->
            <div class="booking-card">

                <div class="booking-card-header">
                    <div>
                        <span class="booking-number">
                            예약번호 : 202610100003
                        </span>
                        <span class="booking-date">
                            예약일 : 2026-10-10
                        </span>
                    </div>

                    <span class="booking-status canceled">
                        예약취소
                    </span>
                </div>

                <div class="booking-card-body">

                    <img src="img/hotel1.jpg"
                         alt="숙소 사진" class="booking-img">

                    <div class="booking-info">
                        <h3>오션뷰 호텔</h3>
                        <p class="room-name">스탠다드 더블룸</p>

                        <div class="booking-dates">
                            <p><strong>체크인</strong> 2026-10-25</p>
                            <p><strong>체크아웃</strong> 2026-10-26</p>
                        </div>

                        <p class="cancel-date">
                            취소일 : 2026-10-12
                        </p>
                    </div>
                </div>

                <div class="booking-card-footer">
                    <button class="detail-btn"
                        onclick="location.href='BookingDetail.jsp?book_code=3'">
                        예약 상세보기
                    </button>
                </div>
            </div>

            <!-- 페이지 번호 -->
            <div class="booking-paging">
                <a href="#">«</a>
                <a href="#">‹</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">›</a>
                <a href="#">»</a>
            </div>

            <!-- 안내문 -->
            <div class="booking-notice">
                <div class="notice-icon">ⓘ</div>
                <div>
                    <p>· 예약한 숙소와 이용 일정을 확인할 수 있습니다.</p>
                    <p>· 예약 취소는 숙소의 취소 규정에 따라 처리됩니다.</p>
                    <p>· 이용 완료된 숙소는 리뷰를 작성할 수 있습니다.</p>
                </div>
            </div>

        </div>
    </main>
</div>

</body>
</html>
