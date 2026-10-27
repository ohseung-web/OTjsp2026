<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<Header>
		<div class="headerWrap">
		   <table width="1000" id="navi">
		     <tr height="70">
		        <td colspan="4" align="left">
		          <a href="index.jsp" ><img src="img/sk_logo.png" height="65"></a>
		        </td>
		     </tr>
		     <tr height="50">
		        <td align="center" width="200" >
		           <a href="#" class="nav">예약하기</a>
		        </td>
		        <td align="center" width="200">
		           <a href="#" class="nav">예약확인</a>
		        </td>
		        <td align="center" width="200" >
		           <a href="#" class="nav">게시판</a>
		        </td>
		        <!-- <td align="center" width="200" >
		           <a href="index.jsp?section=member/MemberJoin.jsp" class="nav cartnav">회원가입</a>
		        </td>
		        <td align="center" width="200" >
		           <a href="index.jsp?section=login/loginForm.jsp" class="nav cartnav">로그인</a>
		        </td> -->
		        <c:choose>
		          <%-- 로그인 상태 : kjb1045님 / 로그아웃 --%>
		          <c:when test="${not empty sessionScope.id}">
		            <td align="center" width="200">
		               <span class="nav"><c:out value="${sessionScope.id}"/>님</span>
		            </td>
		            <td align="center" width="200">
		               <a href="LogoutProc.do" class="nav cartnav">로그아웃</a>
		            </td>
		          </c:when>
		          <%-- 비로그인 상태 : 회원가입 / 로그인 --%>
		          <c:otherwise>
		            <td align="center" width="200" >
		               <a href="index.jsp?section=member/MemberJoin.jsp" class="nav cartnav">회원가입</a>
		            </td>
		            <td align="center" width="200" >
		               <a href="index.jsp?section=login/loginForm.jsp" class="nav cartnav">로그인</a>
		            </td>
		          </c:otherwise>
		      </c:choose>
		     </tr>
		     
		     
		     
		     
		     
		     
		   </table>
		</div>
	</Header>
</body>
</html>

