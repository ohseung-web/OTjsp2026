<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // nav.jsp 에서 넘어온 메뉴 값 (예: main.jsp?page=menuList)
    String pageName = request.getParameter("page");

    // 기본 화면은 home.jsp
    String contentPage = "home.jsp";

    // 허용한 페이지만 section 에 보여준다
    if ("menuList".equals(pageName)) {
        contentPage = "menuList.jsp";
    } else if ("menuInsert".equals(pageName)) {
        contentPage = "menuInsert.jsp";
    }
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

    <!-- 상단 : 공통 영역 (정적 include) -->
    <div id="top">
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>
    </div>

    <!-- 변경되는 영역 (액션태그) -->
    <section>
        <jsp:include page="<%= contentPage %>" />
    </section>

    <!-- 하단 : 공통 영역 (정적 include) -->
    <%@ include file="footer.jsp" %>

</div>
</body>
</html>
