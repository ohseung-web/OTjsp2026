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
		    // nav.jsp 에서 넘어온 메뉴 값 (예: main.jsp?page=carList)
		    String pageName = request.getParameter("page");
		
		    // 기본 화면은 home.jsp
		    String contentPage = "home.jsp";
		
		    // 허용한 페이지만 section 에 보여준다
		    if ("carList".equals(pageName)) {
		        contentPage = "carList.jsp";
		    }
		    else if ("driveInsert".equals(pageName)) {
		        contentPage = "driveInsert.jsp";
		    }
		    // 이후 수업에서 메뉴가 추가되면 else if 로 한 줄씩 추가
		    // else if ("driveList".equals(pageName)) { contentPage = "driveList.jsp"; }
		%>
		<div id="wrap">
		
		    <!-- 공통 영역 : 정적 include (내용이 고정) -->
		    <%@ include file="header.jsp" %>
		    <%@ include file="nav.jsp" %>
		
		    <!-- 변경되는 영역 : 액션태그 (실행할 때 파일이 결정됨) -->
		    <section>
		        <jsp:include page="<%= contentPage %>" />
		    </section>
		
		    <%@ include file="footer.jsp" %>
		
		</div>
		
</body>
</html>
