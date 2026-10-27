<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
    #listwrap {
	width: 800px;
	margin: 40px auto;
		}
		
		#listwrap h2 {
			text-align: center;
			margin-bottom: 20px;
		}
		
		.listtable {
			width: 100%;
			border-collapse: collapse;
			text-align: center;
		}
		
		.listtable th {
			background-color: #f1f3f5;
			padding: 12px;
			border-bottom: 2px solid #ccc;
		}
		
		.listtable td {
			padding: 12px;
			border-bottom: 1px solid #e5e5e5;
		}
		
		.listtable tr:hover td {
			background-color: #fafafa;
		}
		
		.listtable a {
			color: #333;
			text-decoration: none;
		}
		
		.listtable a:hover {
			text-decoration: underline;
		}
</style>
</head>
<body>
<div id=listwrap>
	<h2 align="center"> 모든 회원 보기</h2>
    <table class="listtable">
    	<tr height="40" >
    		<td align="center" width="50">아이디</td>
    		<td align="center" width="200">이메일</td>
    		<td align="center" width="150">전화</td>
    		<td align="center" width="150">취미</td>
    		<td align="center" width="150">직업</td>
    		<td align="center" width="100">나이</td>
    	</tr>
    	<c:forEach var="mdto" items="${m }">
    		<tr height="40">
    			<td align="center" width="50">${mdto.id }</td>
	    		<td align="center" width="200"><a href="#">${mdto.email }</a></td>
	    		<td align="center" width="150">${mdto.tel }</td>
	    		<td align="center" width="150">${mdto.hobby }</td>
	    		<td align="center" width="150">${mdto.job }</td>
	    		<td align="center" width="100">${mdto.age }</td>
    		</tr>
    	</c:forEach>
    </table>
</div>
</body>
</html>