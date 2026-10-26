<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 테스트</title>
<style>
   .wrap{
        width: 500px;
        margin: 20px auto;
     }
     table {
	    border-collapse: collapse;
     }
     input{
     	width : 300px;
     	height: 30px;
     }
     input[type='submit'],input[type='reset']{
        width : 150px;
        cursor: pointer;
     }
</style>
</head>
<body>
<div class="wrap">
	<h2 align="center"> 회원가입 </h2>
		<form action="MemberTestProc.do" method="post">
			<table  width="500" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350">
						<input type="text" name="id" placeholder="아이디를 입력하세요">
					</td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">비밀번호</td>
					<td width="350">
						<input type="password" name="pass" placeholder="영문과 숫자만 입력하세요">
					</td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">Email</td>
					<td width="350">
						<input type="email" name="email" placeholder="@를 포함하여 입력하세요">
					</td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350">
						<input type="tel" name="tel" placeholder="010-0000-0000의 형식으로 입력하세요">
					</td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">주소</td>
					<td width="350">
						<input type="text" name="address" placeholder="주소 입력하세요">
					</td>	
				</tr>
				<tr height="50">
					<td colspan="2" align="center">
						<input type="submit" value="회원가입">					
						<input type="reset" value="취소">					
					</td>
				</tr>
			</table>
		</form>
</div>		
</body>
</html>