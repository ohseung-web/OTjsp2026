<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join Error</title>
</head>
<body>
	
	<%-- 1. page 지시자에 EL이 꺼져 있는 경우
	<%@ page isELIgnored="true" %>   이게 있으면 EL이 무시됨 --%>
	
	<script type="text/javascript">
	   alert("${msg}");
	   location.href ="member/MemberJoin.jsp";
	</script>
</body>
</html>