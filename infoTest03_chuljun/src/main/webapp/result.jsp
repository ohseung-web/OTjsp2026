<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>
    
<%
	request.setCharacterEncoding("utf-8");
%>
<h2>강사매출현황</h2>
<table>
	<tr>
		<th>강사코드</th>
		<th>강의명</th>
		<th width = "150">강사명</th>
		<th width = "150">총매출</th>
	</tr>
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		// 3자리마다 콤마 DecimalFormat 인스턴스
		DecimalFormat df = new DecimalFormat("#,###");
		
		try{
			con = Util.getConnection();
			// 쿼리문 실행
			String sql = "select t.TEACHER_CODE, t.CLASS_NAME, t.TEACHER_NAME, "
					+ "sum(c.TUITION) as sum from TBL_TEACHER_202201 t "
					+ "inner join TBL_CLASS_202201 c  "
					+ "on t.TEACHER_CODE = c.TEACHER_CODE "
					+ "group by t.TEACHER_CODE";
			// 쿼리실행
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
	%>
				<tr>
					<td><%= rs.getString("t.TEACHER_CODE")%></td>
					<td><%= rs.getString("t.CLASS_NAME")%></td>
					<td style="text-align: center; width : 150px; padding-left:90px;"><%= rs.getString("t.TEACHER_NAME")%></td>
					<td style = "text-align: center; width : 150px; padding-left:60px;">￦<%= df.format(rs.getInt("sum"))%></td>
				</tr>
	<%			
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!= null) rs.close();
				if(pstmt!= null) pstmt.close();
				if(con!= null) con.close();
			}catch(Exception e){e.printStackTrace();}
		}
	
	%>
	
</table>
