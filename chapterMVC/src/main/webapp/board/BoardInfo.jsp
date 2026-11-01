<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <link rel="stylesheet" href="style/boardinfo.css" />

<div class="rewrap"> -->

<link rel="stylesheet" href="style/boardwrite.css">
<div class="boardwrap">

    <h2>게시글 보기</h2>
    <table width="600" border="1">
        <tr height="40">
            <td align="center" width="120">글번호</td>
            <td align="center" width="180">${bdto.num }</td>
            <td align="center" width="120">조회수</td>
            <td align="center" width="180">${bdto.readcount }</td>
        </tr>
        <tr height="40">
            <td align="center" width="120">작성자</td>
            <td align="center" width="180">${bdto.writer }</td>
            <td align="center" width="120">작성일</td>
            <td align="center" width="180">${bdto.reg_date }</td>
        </tr>
        <tr height="40">
            <td align="center" width="120">이메일</td>
            <td align="center" colspan="3">${bdto.email }</td>
        </tr>
        <tr height="40">
            <td align="center" width="120">제목</td>
            <td align="center" colspan="3">${bdto.subject }</td>
        </tr>
        <tr height="80">
            <td align="center" width="120">글내용</td>
            <td align="center" colspan="3">${bdto.content }</td>
        </tr>
        <tr height="40">
            <td align="center" colspan="4">
                <!-- 데이터를 읽어들여야 하기 때문에 servlet인 ~.do로 먼저 넘겨주고 다시 view-JSP파일로 넘겨주어야 함을 주의하자 -->
                <%-- <input type="button" value="답글쓰기" onclick="location.href='BoardReWriterCon.do?num=${bdto.num}&ref=${bdto.ref}&re_step=${bdto.re_step}'"> --%>
                
                <%-- 관리자(admin) 로그인 상태일 때만 [답글쓰기] 버튼 출력 --%>
				<c:if test="${sessionScope.id eq 'admin'}">
				    <input type="button" value="답글쓰기" onclick="location.href='BoardReWriterCon.do?num=${bdto.num}&ref=${bdto.ref}&re_step=${bdto.re_step}'">
				</c:if>
                
                <%-- 2. 수정하기 / 삭제하기 버튼: 관리자가 아닐 때(또는 작성자 본인일 때)만 노출 --%>
				<%-- 만약 관리자는 남의 글을 수정/삭제 못 하게 막고 싶다면 아래처럼 admin이 아닐 때만 노출시킵니다. --%>
				<c:if test="${sessionScope.id ne 'admin' && not empty sessionScope.id}">
				    <input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bdto.num}'">
				    <input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bdto.num}'">
				</c:if>

				<%-- <input type="button" value="목록보기" onclick="location.href='BoardListCon.do'">
                <input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bdto.num}'">
                <input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bdto.num}'"> --%>
                <input type="button" value="목록보기" onclick="location.href='BoardListCon.do'">
                
                
                <%-- 1. [답글쓰기] 버튼: 원글이고 관리자일 때만 노출 --%>
				<%-- <c:if test="${sessionScope.id eq 'admin' && bdto.re_step == 0}">
				    <input type="button" value="답글쓰기" onclick="location.href='BoardReWriterCon.do?num=${bdto.num}&ref=${bdto.ref}&re_step=${bdto.re_step}'">
				</c:if> --%>
				
				<%-- 2. [수정하기] / [삭제하기] 버튼 권한 제어 --%>
				<%-- <c:choose> --%>
				    <%-- 케이스 A: 관리자(admin)가 로그인한 경우 --%>
				    <%-- <c:when test="${sessionScope.id eq 'admin'}"> --%>
				        <%-- 관리자는 자신이 쓴 답변 글(re_step == 1)일 때만 수정/삭제 가능 --%>
				        <%-- <c:if test="${bdto.re_step == 1}">
				            <input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bdto.num}'">
				            <input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bdto.num}'">
				        </c:if>
				    </c:when> --%>
				    
				    <%-- 케이스 B: 일반 회원이 로그인한 경우 (본인 글일 때만 수정/삭제 허용하고 싶다면 기존 로직 유지) --%>
				   <%--  <c:otherwise>
				        <c:if test="${sessionScope.id eq bdto.id}">
				            <input type="button" value="수정하기" onclick="location.href='BoardUpdateCon.do?num=${bdto.num}'">
				            <input type="button" value="삭제하기" onclick="location.href='BoardDeleteCon.do?num=${bdto.num}'">
				        </c:if>
				    </c:otherwise>
				</c:choose> --%>
				
				<!-- <input type="button" value="목록보기" onclick="location.href='BoardListCon.do'"> -->
            </td>
        </tr>
    </table>
</div>