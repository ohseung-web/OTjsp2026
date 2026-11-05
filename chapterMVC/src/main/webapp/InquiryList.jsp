<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 게시판</title>
    <link rel="stylesheet" href="style/inquiry.css">
</head>
<body>

<div class="inquirywrap">

    <!-- 상단 제목 -->
    <div class="inquiryheader">
        <h2>1:1 문의</h2>
        <p>궁금한 점이나 문의사항을 남겨주세요.</p>
        <p>빠르고 친절하게 답변드리겠습니다.</p>
    </div>

    <div class="inquirybox">

        <!-- 메뉴 -->
        <div class="inquirymenu">
            <a href="InquiryList.jsp" class="active">문의 목록</a>
            <a href="InquiryWriteForm.jsp">문의 등록</a>
        </div>

        <!-- 검색 영역 -->
        <form action="InquiryList.jsp" method="get"
              class="inquirysearch">

            <select name="searchType">
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>

            <input type="text" name="keyword"
                   placeholder="검색어를 입력하세요">

            <input type="submit" value="검색">
        </form>

        <!-- 문의 목록 -->
        <table class="inquirytable">
            <thead>
                <tr>
                    <th width="12%">글번호</th>
                    <th width="48%">제목</th>
                    <th width="25%">작성일</th>
                    <th width="15%">상태</th>
                </tr>
            </thead>

            <tbody>
                <tr>
                    <td>1057</td>
                    <td class="subject">
                        <a href="#">예약 취소 가능한가요?</a>
                    </td>
                    <td>2026-11-05</td>
                    <td>
                        <span class="status complete">답변완료</span>
                    </td>
                </tr>

                <tr>
                    <td>1056</td>
                    <td class="subject">
                        <a href="#">객실 추가 요금 문의드립니다.</a>
                    </td>
                    <td>2026-11-04</td>
                    <td>
                        <span class="status complete">답변완료</span>
                    </td>
                </tr>

                <tr>
                    <td>1055</td>
                    <td class="subject">
                        <a href="#">결제 오류가 발생했어요.</a>
                    </td>
                    <td>2026-11-04</td>
                    <td>
                        <span class="status waiting">답변대기</span>
                    </td>
                </tr>

                <tr>
                    <td>1054</td>
                    <td class="subject">
                        <a href="#">예약 변경에 대해 문의드립니다.</a>
                    </td>
                    <td>2026-11-03</td>
                    <td>
                        <span class="status complete">답변완료</span>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- 하단 버튼 -->
        <div class="inquirybottom">
            <div class="paging">
                <a href="#" class="selected">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
            </div>

            <button type="button" class="writebtn"
                    onclick="location.href='InquiryWriteForm.jsp'">
                문의 등록
            </button>
        </div>

        <!-- 안내문 -->
        <div class="inquirynotice">
            <p>※ 문의하신 글은 마이페이지에서 확인하실 수 있습니다.</p>
            <p>※ 답변이 등록되면 '답변완료' 상태로 변경됩니다.</p>
            <p>※ 비공개 문의는 본인만 열람할 수 있습니다.</p>
        </div>

    </div>
</div>

</body>
</html>