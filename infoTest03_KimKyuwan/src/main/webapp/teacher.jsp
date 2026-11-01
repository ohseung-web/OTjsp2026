<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.*" %>


<section>
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
		
		DecimalFormat de = new DecimalFormat("￦#,##0");
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sd2 = new SimpleDateFormat("yyyy년MM월dd일");
		
		try{
			con = Util.getConnection();
			
			String sql = "select * from TBL_TEACHER_202201";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>"+ rs.getString(1) +"</td>");
				out.print("<td>"+ rs.getString(2) +"</td>");
				out.print("<td>"+ rs.getString(3) +"</td>");
				out.print("<td>"+ de.format(rs.getInt(4)) +"</td>");
				out.print("<td>"+ sd2.format(sd.parse(rs.getString(5))) +"</td>");
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