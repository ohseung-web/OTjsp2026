<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량주행관리 프로그램</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
<%
    // POST 한글 깨짐 방지 : getParameter() 보다 먼저 실행해야 한다
    request.setCharacterEncoding("UTF-8");

    String driveDate = request.getParameter("driveDate");
    String carNo     = request.getParameter("carNo");
    String startKm   = request.getParameter("startKm");
    String endKm     = request.getParameter("endKm");
    String deptCode  = request.getParameter("deptCode");
    String oilCost   = request.getParameter("oilCost");

    // TODO : DB 연동 단계에서 여기에 주행내역테이블 INSERT 코드를 작성한다
%>
<div id="wrap">

    <%@ include file="header.jsp" %>
    <%@ include file="nav.jsp" %>

    <section>
        <h3>주행내역등록 확인</h3>
        <table class="list">
            <tr><th>주행일자</th><td><%= driveDate %></td></tr>
            <tr><th>차량번호</th><td><%= carNo %></td></tr>
            <tr><th>출발Km</th><td><%= startKm %> km</td></tr>
            <tr><th>도착km</th><td><%= endKm %> km</td></tr>
            <tr><th>부서코드</th><td><%= deptCode %></td></tr>
            <tr><th>주유금액</th><td><%= oilCost %> 원</td></tr>
        </table>
    </section>

    <%@ include file="footer.jsp" %>

</div>
</body>
</html>
