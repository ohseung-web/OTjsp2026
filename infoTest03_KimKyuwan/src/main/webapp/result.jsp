<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.*" %>


<section>
	<h2>강사매출현황</h2>
	<table>
		<tr>
			<th width="100">강사코드</th>
			<th width="100">강의명</th>
			<th width="100">강사명</th>
			<th width="100">총매출</th>
		</tr>
		<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DecimalFormat de = new DecimalFormat("￦#,##0");
		
		try{
			con = Util.getConnection();
			
			String sql = "select t.TEACHER_CODE TEACHER_CODE, t.CLASS_NAME CLASS_NAME, t.TEACHER_NAME TEACHER_NAME, sum(c.TUITION) TUITION "
						+"from TBL_TEACHER_202201 t "
						+"inner join TBL_CLASS_202201 c on t.TEACHER_CODE = c.TEACHER_CODE "
						+"group by t.TEACHER_CODE";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>"+ rs.getString(1) +"</td>");
				out.print("<td>"+ rs.getString(2) +"</td>");
				out.print("<td class='right'>"+ rs.getString(3) +"</td>");
				out.print("<td class='right'>"+ de.format(rs.getInt(4)) +"</td>");
				out.print("</tr>");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){e.printStackTrace();}
		}
		
	%>
	</table>
</section>