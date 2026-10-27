<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<div class="headerWrap">
	   <table width="1000" id="navi">
	     <tr height="70">
	        <td colspan="6" align="left">
	          <a href="index.jsp"><img src="img/sk_logo.png" height="65"></a>
	        </td>
	     </tr>
	     <tr height="50">
	        <td align="center"><a href="#" class="nav">예약하기</a></td>
	        <td align="center"><a href="#" class="nav">예약확인</a></td>
	        <td align="center"><a href="#" class="nav">게시판</a></td>

	        <c:choose>
	          <%-- 로그인 상태 --%>
	          <c:when test="${not empty sessionScope.id}">

	            <c:choose>
	              <%-- 관리자(admin) : MyPage 없음, 회원조회 메뉴 추가 + "관리자 [로그아웃]" --%>
	              <c:when test="${sessionScope.id eq 'admin'}">
	                <td align="center">
	                   <a href="MemberListCon.do" class="nav">회원조회</a>
	                </td>
	                <td align="center">
	                   <span class="nav">관리자</span>
	                   <a href="LogoutProc.do" class="nav cartnav">[로그아웃]</a>
	                </td>
	              </c:when>

	              <%-- 일반 회원 : MyPage + "kjb1045님 [로그아웃]" --%>
	              <c:otherwise>
	                <td align="center">
	                   <a href="index.jsp?section=member/MyPage.jsp" class="nav">MyPage</a>
	                </td>
	                <td align="center">
	                   <span class="nav"><c:out value="${sessionScope.id}"/>님</span>
	                   <a href="LogoutProc.do" class="nav cartnav">[로그아웃]</a>
	                </td>
	              </c:otherwise>
	            </c:choose>

	          </c:when>

	          <%-- 비로그인 상태 : 회원가입 / 로그인 --%>
	          <c:otherwise>
	            <td align="center">
	               <a href="index.jsp?section=member/MemberJoin.jsp" class="nav cartnav">회원가입</a>
	            </td>
	            <td align="center">
	               <a href="index.jsp?section=login/loginForm.jsp" class="nav cartnav">로그인</a>
	            </td>
	          </c:otherwise>
	        </c:choose>
	     </tr>
	   </table>
	</div>
</header>
