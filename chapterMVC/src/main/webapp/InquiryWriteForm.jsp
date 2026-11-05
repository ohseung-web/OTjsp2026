
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>1:1 문의 등록</title>
    <link rel="stylesheet" href="style/inquiry.css">
</head>
<body>

<div class="inquirywrap">

    <div class="inquiryheader">
        <h2>1:1 문의 등록</h2>
        <p>궁금한 내용을 자세히 작성해 주세요.</p>
    </div>

    <div class="inquirybox writebox">

        <form action="InquiryWriteProc.jsp" method="post">

            <div class="writegroup">
                <label>문의 제목</label>
                <input type="text" name="inq_title"
                       placeholder="문의 제목을 입력하세요" required>
            </div>

            <div class="writegroup">
                <label>문의 내용</label>
                <textarea name="inq_content"
                          placeholder="문의하실 내용을 입력하세요"
                          required></textarea>
            </div>

            <div class="writebottom">
                <button type="button" class="listbtn"
                        onclick="location.href='InquiryList.jsp'">
                    목록으로
                </button>

                <input type="submit" class="writebtn"
                       value="문의 등록">
            </div>

        </form>
    </div>
</div>

</body>
</html>
