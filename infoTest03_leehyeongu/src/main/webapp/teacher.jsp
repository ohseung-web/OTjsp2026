<%@page import="java.util.concurrent.ExecutionException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사조회</title>
<link rel = "stylesheet" href = "style/main.css">
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<%
	DecimalFormat df = new DecimalFormat("₩#,###");
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf2 = new SimpleDateFormat("yyyy년MM월dd일");
	request.setCharacterEncoding("utf-8");
	Connection con = Util.getConnection();
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from TBL_TEACHER_202201";
	pstmt = con.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	%>
	
	<table>
		<tr>
			<th>강사코드</th>
			<th>강사명</th>
			<th>강의명</th>
			<th>수강료</th>
			<th>강사자격취득일</th>
		</tr>
		
		<% 
		try{
		while(rs.next()){ %>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= df.format(rs.getInt(4))  %></td>
			<td><%= sf2.format(sf.parse(rs.getString(5)))  %></td>
		</tr>
		<%}}catch(Exception e){e.printStackTrace();}finally{
			try{if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null){con.close();}
			}catch(Exception e){
				e.printStackTrace();
			}
		} %>
	</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>