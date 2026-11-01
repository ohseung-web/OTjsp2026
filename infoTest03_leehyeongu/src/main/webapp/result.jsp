<%@page import="DBPKG.Util"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사매출현황</title>
<link rel = "stylesheet" href ="style/main.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<% 
		DecimalFormat df = new DecimalFormat("₩#,###");
	
	
	Connection con = Util.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select t.TEACHER_CODE, CLASS_NAME, TEACHER_NAME, sum(TUITION)"
				+ " from tbl_teacher_202201 t inner join tbl_class_202201 c on t.TEACHER_CODE = c.TEACHER_CODE"
				+ " group by TEACHER_CODE";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
	%>
	
		
		<table>
			<tr>
				<th>강사코드</th>
				<th>강의명</th>
				<th>강사명</th>
				<th>총매출</th>
			</tr>
	<%try{while(rs.next()){%>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= df.format(Integer.parseInt(rs.getString(4))) %></td>
		</tr>
	<%}}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
		}catch(Exception e){e.printStackTrace();}
	}%>
		</table>
	</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>