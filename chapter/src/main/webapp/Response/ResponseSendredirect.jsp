<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- response : 웹 브라우저의 요청에 대한 응답 정보를 저장하고 있는 겍체 
	     redirect : "방향을 다시 돌린다(재지정한다)"의 뜻으로 서버즉에서 다른페이지로 떠넘겨 줄때 사용한다.
	-->
	<h2> 로그인 페이지 </h2>
	<form action="ResponseloginProc.jsp" method="post">
		<table width="400" border="1" class="login-table">
			<tr height="60">
				<td align="center" width="150" class="label">아이디</td>
				<td align="left" width="250">
					<input type="text" name="id">
				</td>
			</tr>
			<tr height="60">
				<td align="center" width="150" class="label">패스워드</td>
				<td align="left" width="250">
					<input type="password" name="pass">
				</td>
			</tr>
			<tr height="60">
				<td colspan="2" align="center" width="150">
					<input type="submit" value="전송">				
				</td>
			</tr>
		</table>
	</form>
</body>
</html>