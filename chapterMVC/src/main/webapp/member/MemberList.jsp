<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="listwrap">
	<h2>모든 회원 보기</h2>

	<%-- 검색 영역 : GET 방식이라 검색 결과 주소를 복사/새로고침해도 유지된다. --%>
	<form action="MemberListCon.do" method="get" class="searchbox">
		<select name="searchType">
			<option value="id"    ${searchType == 'email' ? '' : 'selected'}>아이디</option>
			<option value="email" ${searchType == 'email' ? 'selected' : ''}>이메일</option>
		</select>
		<input type="text" name="keyword" value="<c:out value='${keyword}'/>"
			placeholder="검색어를 입력하세요">
		<input type="submit" value="검색" class="btn-search">
		<input type="button" value="전체보기" class="btn-all"
			onclick="location.href='MemberListCon.do'">
	</form>

	<%-- 검색어가 있을 때만 결과 건수 표시 --%>
	<c:if test="${not empty keyword}">
		<p class="searchinfo">
			'<c:out value="${keyword}"/>' 검색 결과 <b>${fn:length(m)}</b>명
		</p>
	</c:if>

	<table class="listtable">
		<tr height="40">
			<th width="100">아이디</th>
			<th width="200">이메일</th>
			<th width="150">전화</th>
			<th width="150">취미</th>
			<th width="100">직업</th>
			<th width="80">나이</th>
		</tr>

		<%-- 조회 결과가 없을 때 --%>
		<c:if test="${empty m}">
			<tr height="60">
				<td colspan="6" class="nodata">조회된 회원이 없습니다.</td>
			</tr>
		</c:if>

		<c:forEach var="mdto" items="${m}">
			<tr height="40">
				<td><c:out value="${mdto.id}"/></td>
				<td><c:out value="${mdto.email}"/></td>
				<td><c:out value="${mdto.tel}"/></td>
				<td><c:out value="${mdto.hobby}"/></td>
				<td><c:out value="${mdto.job}"/></td>
				<td><c:out value="${mdto.age}"/></td>
			</tr>
		</c:forEach>
	</table>
</div>
