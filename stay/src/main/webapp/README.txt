머물:多 JSP 디자인 파일 안내

JSP 5개: index.jsp, MemberJoinForm.jsp, LoginForm.jsp, InquiryList.jsp, InquiryWriteForm.jsp
CSS 4개: style/main.css, style/join.css, style/login.css, style/inquiry.css

1. 폴더 구조 그대로 src/main/webapp 아래에 복사하세요.
2. img 폴더에 main-banner.jpg, seoul.jpg, busan.jpg, jeju.jpg, gyeongju.jpg, yeosu.jpg, hotel1.jpg, hotel2.jpg, hotel3.jpg 사진을 넣으세요.
3. 모든 숙소/가격/문의 목록은 디자인 예시입니다.
4. MemberJoinProc.jsp, LoginProc.jsp, InquiryWriteProc.jsp, InquiryDetail.jsp, AccommodationList.jsp, AccommodationDetail.jsp, BookingList.jsp, GuestBookingLookup.jsp 등은 아직 구현하지 않은 연결 대상입니다.
5. 실제 DB 저장/조회, 로그인 세션, 본인 문의만 보기, 입력값 서버 검증, 비밀번호 해시, CSRF 보호 등은 별도로 구현해야 합니다.
6. PPT의 성별 tinyint 값 의미는 명시되지 않았으므로 폼의 1/2 값은 예시입니다. 서버/DB와 맞춰 변경하세요.
7. 회원 테이블의 us_password varchar(20)은 해시 저장에 부족하므로 VARCHAR(255) 등으로 조정하는 것을 권장합니다.
