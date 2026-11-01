<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<h2>강사조회</h2>
<table>
	<tr>
		<th>강사코드</th>
		<th>강사명</th>
		<th>강의명</th>
		<th>수강료</th>
		<th>강사자격취득일</th>
	</tr>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 3자리마다 콤마 출력하는 DecimalFormat 인스턴스화
		DecimalFormat de = new DecimalFormat("#,###");
		// 날짜 형식맞추기 위해 SimpleDateFormat 인스턴스화
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
		
		try{
			con = Util.getConnection();			
			// sql문 작성
			String sql = "select * from TBL_TEACHER_202201";
			// 쿼리실행
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			//반복문
			while(rs.next()){
	%>
				<tr>
					<td><%= rs.getString("TEACHER_CODE") %></td>
					<td><%= rs.getString("TEACHER_NAME") %></td>
					<td><%= rs.getString("CLASS_NAME") %></td>
					<td>￦<%= de.format(rs.getInt("CLASS_PRICE")) %></td>
					<td><%= sf02.format(sf.parse(rs.getString("TEACHER_REGIST_DATE"))) %></td>
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