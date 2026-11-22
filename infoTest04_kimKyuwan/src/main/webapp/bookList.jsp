<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	<h2>도서조회</h2>
	<table class="list c">
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>저자</th>
			<th>1일 대출료</th>
			<th>출판일</th>
		</tr>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sd2 = new SimpleDateFormat("yyyy년MM월dd일");
		
			try{
				con = Util.getConnection();
				
				String sql = "select * from  tbl_book_202301";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					out.print("<tr>");
					out.print("<td>" + rs.getString(1) +"</td>");
					out.print("<td>" + rs.getString(2) +"</td>");
					out.print("<td>" + rs.getString(3) +"</td>");
					out.print("<td>￦" + rs.getInt(4) +"</td>");
					out.print("<td>" + sd2.format(sd.parse(rs.getString(5))) +"</td>");					
					out.print("</tr>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(con!=null) con.close();
					if(pstmt!=null) pstmt.close();
					if(rs!=null) rs.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
		%>
	</table>
</section>