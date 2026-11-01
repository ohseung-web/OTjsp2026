<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="DBPKG.Util" %>

<h2>회원정보조회</h2>
<table>
	<tr>
		<th>수강월</th>
		<th>회원번호</th>
		<th>회원명</th>
		<th>강의명</th>
		<th>강의장소</th>
		<th>수강료</th>
		<th>등급</th>
	</tr>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 숫자 DecimalFormat 선언
		DecimalFormat df = new DecimalFormat("#,###");
		// 날짜 SimpleDateFormat 선언
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월");
		
		try{
			con = Util.getConnection();
			// sql문 작성
			String sql = "select c.REGIST_MONTH, m.C_NO, m.C_NAME, t.CLASS_NAME, c.CLASS_AREA, c.TUITION, m.GRADE "
					+ "from TBL_MEMBER_202201 m inner join TBL_CLASS_202201 c on m.C_NO = c.C_NO "
					+ "inner join TBL_TEACHER_202201 t on c.TEACHER_CODE = t.TEACHER_CODE";
			// 쿼리문실행
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			// 반복문
			while(rs.next()){
	%>
					<tr>
						<td><%= sf02.format(sf.parse(rs.getString("c.REGIST_MONTH"))) %></td>
						<td><%= rs.getString("m.C_NO") %></td>
						<td><%= rs.getString("m.C_NAME") %></td>
						<td><%= rs.getString("t.CLASS_NAME") %></td>
						<td><%= rs.getString("c.CLASS_AREA") %></td>
						<td>￦<%= df.format(rs.getInt("c.TUITION")) %></td>
						<td><%= rs.getString("m.GRADE") %></td>
					</tr>
	<%			
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			}catch(Exception e){e.printStackTrace();}
		}
	
	%>
	
</table>
