<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- JSTL functions 라이브러리: fn:contains 등 문자열 함수를 쓰기 위해 필요
     (아래 취미 체크박스에서 저장된 값에 "캠핑"이 포함되는지 검사할 때 사용) --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%-- 수정 결과 알림 (고정된 문구만 출력)
     MyPageUpdateProc 서블릿이 처리 후 "MyPage.do?result=값" 으로 redirect 하면,
     그 주소의 result 파라미터를 ${param.result} 로 꺼내서 어떤 알림을 띄울지 결정한다.
     알림 문구는 JSP에 고정해 두므로, 주소창에 어떤 값을 넣어도 스크립트가 삽입될 수 없다. --%>

<%-- result=ok : 수정 성공 시 알림창 출력 --%>
<c:if test="${param.result eq 'ok'}">
	<script>alert("회원정보가 수정되었습니다.");</script>
</c:if>

<%-- result=passfail : 새 비밀번호와 비밀번호 확인이 다를 때 알림창 출력 --%>
<c:if test="${param.result eq 'passfail'}">
	<script>alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");</script>
</c:if>

<div class="joinwrap">
	<h2 align="center">MyPage</h2>
	<form action="MyPageUpdate.do" method="post">
		<table width="500" border="1">
			<tr height="50">
				<td width="150" align="center">아이디</td>
				<td width="350">
					<%-- 아이디는 수정 불가 --%>
					<input type="hidden" value="${mdto.id}" name="id" />
					<input type="text" value="<c:out value='${mdto.id}'/>" readonly>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">새 비밀번호</td>
				<td width="350">
					<input type="password" name="pass" placeholder="변경할 때만 입력하세요">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">새 비밀번호 확인</td>
				<td width="350">
					<input type="password" name="passchk" placeholder="변경할 때만 입력하세요">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">Email</td>
				<td width="350">
					<input type="email" name="email" value="<c:out value='${mdto.email}'/>">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">전화번호</td>
				<td width="350">
					<input type="tel" name="tel" value="<c:out value='${mdto.tel}'/>">
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">관심분야</td>
				<td width="350" align="center">
						<c:forTokens var="item" items="캠핑 등산 영화 독서" delims=" ">
							<input type="checkbox" name="hobby" value="${item}" id="hobby_${item}" 
								<c:if test="${mdto.hobby.contains(item)}">checked</c:if>>
							<label for="hobby_${item}">${item}</label>&nbsp;&nbsp;
						</c:forTokens>
					<%-- <input type="checkbox" name="hobby" value="캠핑" id="camping"
						${fn:contains(mdto.hobby, '캠핑') ? 'checked' : ''}>
					<label for="camping">캠핑</label> &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="등산" id="mount"
						${fn:contains(mdto.hobby, '등산') ? 'checked' : ''}>
					<label for="mount">등산</label> &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="영화" id="movie"
						${fn:contains(mdto.hobby, '영화') ? 'checked' : ''}>
					<label for="movie">영화</label> &nbsp;&nbsp;
					<input type="checkbox" name="hobby" value="독서" id="book"
						${fn:contains(mdto.hobby, '독서') ? 'checked' : ''}>
					<label for="book">독서</label> &nbsp;&nbsp; --%>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">직업</td>
				<td width="350" align="center">
					<select name="job">
						<option value="교사"   ${mdto.job eq '교사'   ? 'selected' : ''}>교사</option>
						<option value="변호사" ${mdto.job eq '변호사' ? 'selected' : ''}>변호사</option>
						<option value="의사"   ${mdto.job eq '의사'   ? 'selected' : ''}>의사</option>
						<option value="기술사" ${mdto.job eq '기술사' ? 'selected' : ''}>기술사</option>
					</select>
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">연령</td>
				<td width="350" align="center">
					<input type="radio" name="age" value="10대" id="teenage" ${mdto.age eq '10대' ? 'checked' : ''}>
					<label for="teenage">10대</label>&nbsp;&nbsp;
					<input type="radio" name="age" value="20대" id="twenty" ${mdto.age eq '20대' ? 'checked' : ''}>
					<label for="twenty">20대</label>&nbsp;&nbsp;
					<input type="radio" name="age" value="30대" id="thirty" ${mdto.age eq '30대' ? 'checked' : ''}>
					<label for="thirty">30대</label>&nbsp;&nbsp;
					<input type="radio" name="age" value="40대" id="forty" ${mdto.age eq '40대' ? 'checked' : ''}>
					<label for="forty">40대</label>&nbsp;&nbsp;
				</td>
			</tr>
			<tr height="50">
				<td width="150" align="center">남기는 말</td>
				<td width="350" align="center">
					<textarea rows="5" cols="40" name="info"><c:out value="${mdto.info}"/></textarea>
				</td>
			</tr>
			<tr height="50">
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<input type="button" value="취소" onclick="location.href='MyPage.do'">
				</td>
			</tr>
		</table>
	</form>
</div>
