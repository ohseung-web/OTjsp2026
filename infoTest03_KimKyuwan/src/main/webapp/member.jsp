<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.*" %>


<section>
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
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DecimalFormat de = new DecimalFormat("￦#,##0");
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sd2 = new SimpleDateFormat("yyyy년MM월");
		
		try{
			con = Util.getConnection();
			
			String sql = "select c.REGIST_MONTH REGIST_MONTH, c.C_NO C_NO, m.C_NAME C_NAME, t.CLASS_NAME CLASS_NAME, c.CLASS_AREA CLASS_AREA, t.CLASS_PRICE CLASS_PRICE, m.GRADE GRADE "
					   	+"from TBL_MEMBER_202201 m " 
						+"inner join TBL_CLASS_202201 c on m.C_NO = c.C_NO "
						+"inner join TBL_TEACHER_202201 t on t.TEACHER_CODE = c.TEACHER_CODE";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td>"+ sd2.format(sd.parse(rs.getString(1))) +"</td>");
				out.print("<td>"+ rs.getString(2) +"</td>");
				out.print("<td>"+ rs.getString(3) +"</td>");
				out.print("<td>"+ rs.getString(4) +"</td>");
				out.print("<td>"+ rs.getString(5) +"</td>");
				out.print("<td>"+ de.format(rs.getInt(6)) +"</td>");
				out.print("<td>"+ rs.getString(7) +"</td>");
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