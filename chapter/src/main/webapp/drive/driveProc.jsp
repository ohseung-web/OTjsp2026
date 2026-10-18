<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String drvDate   = request.getParameter("drvDate");
	String carNo     = request.getParameter("carNo");
	String drvStart  = request.getParameter("drvStart");
	String drvEnd    = request.getParameter("drvEnd");
	String deptCode  = request.getParameter("deptCode");
	String drvMoney  = request.getParameter("drvMoney");

	String errorMsg = null;

	if(drvDate == null || drvDate.trim().isEmpty()){
		errorMsg = "주행일자가 입력되지 않았습니다!";
	}else if(carNo == null || carNo.trim().isEmpty()){
		errorMsg = "차량번호가 입력되지 않았습니다!";
	}else if(drvStart == null || drvStart.trim().isEmpty()){
		errorMsg = "출발Km가 입력되지 않았습니다!";
	}else if(drvEnd == null || drvEnd.trim().isEmpty()){
		errorMsg = "도착km가 입력되지 않았습니다!";
	}else if(deptCode == null || deptCode.trim().isEmpty()){
		errorMsg = "부서코드가 선택되지 않았습니다!";
	}else if(drvMoney == null || drvMoney.trim().isEmpty()){
		errorMsg = "주유금액이 입력되지 않았습니다!";
	}

	if(errorMsg != null){
	%>
		<script type="text/javascript">
			alert("<%= errorMsg %>");
			history.go(-1);
		</script>
	<%
		}else{
	%>
		<h2 align="center">주행내역 확인</h2>
		<table align="center" border="1">
			<tr><th>주행일자</th><td><%= drvDate %></td></tr>
			<tr><th>차량번호</th><td><%= carNo %></td></tr>
			<tr><th>출발Km</th><td><%= drvStart %> km</td></tr>
			<tr><th>도착km</th><td><%= drvEnd %> km</td></tr>
			<tr><th>부서코드</th><td><%= deptCode %></td></tr>
			<tr><th>주유금액</th><td><%= drvMoney %> 원</td></tr>
		</table>
	<%
		}
	%>
</body>
</html>