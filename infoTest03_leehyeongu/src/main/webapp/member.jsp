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
<title>회원 정보 조회</title>
<link rel = "stylesheet" href ="style/main.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
	<% 
		DecimalFormat df = new DecimalFormat("₩#,###");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy년MM월");
		request.setCharacterEncoding("utf-8");
		Connection con = Util.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select REGIST_MONTH, m.C_NO, m.C_NAME, t.CLASS_NAME, CLASS_AREA, TUITION,m.GRADE "
				+ "from tbl_class_202201 c "
				+ "inner join tbl_member_202201 m on m.C_NO = c.C_NO "
				+ "inner join tbl_teacher_202201 t on t.TEACHER_CODE = c.TEACHER_CODE ";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
	%>
	<table>
		<tr>
			<th>수강일</th>
			<th>회원번호</th>
			<th>힉원명</th>
			<th>강의명</th>
			<th>강의장소</th>
			<th>수강료</th>
			<th>등급</th>
		</tr>
		<% while(rs.next()){%>
		<tr>
			<td><%= sf2.format(sf.parse(rs.getString(1)))   %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=df.format(Integer.parseInt(rs.getString(6)))%></td>
			<td><%=rs.getString(7) %></td>
		</tr>
		<%} %>
	</table>
	
</section>
<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>