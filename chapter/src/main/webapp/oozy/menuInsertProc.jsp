<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // POST 한글 깨짐 방지 : getParameter() 보다 먼저 실행
    request.setCharacterEncoding("UTF-8");

    String menuName = request.getParameter("menuName");
    String category = request.getParameter("category");
    String price    = request.getParameter("price");
    String status   = request.getParameter("status");
    String info     = request.getParameter("info");

    // TODO : DB 연동 단계에서 메뉴테이블 INSERT 코드를 작성한다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OOZY COFFEE</title>
<link rel="stylesheet" href="css/coffee.css">
</head>
<body>
<div id="wrap">

    <div id="top">
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>
    </div>

    <section>
        <h3>메뉴등록 확인</h3>
        <table class="list">
            <tr><th>메뉴명</th><td><%= menuName %></td></tr>
            <tr><th>분류</th><td><%= category %></td></tr>
            <tr><th>가격</th><td><%= price %> 원</td></tr>
            <tr><th>판매상태</th><td><%= "Y".equals(status) ? "판매중" : "SEASON OUT" %></td></tr>
            <tr><th>설명</th><td><%= info %></td></tr>
        </table>
    </section>

    <%@ include file="footer.jsp" %>

</div>
</body>
</html>
