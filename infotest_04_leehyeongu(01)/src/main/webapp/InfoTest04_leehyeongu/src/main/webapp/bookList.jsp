<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = Util.getConnection();
		DecimalFormat df = new DecimalFormat("₩#,##0");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy년MM월dd일");
		try{
			String sql = "select * from TBL_BOOK_202301";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();%>
			
			<h2>도서조회</h2>
			
			<table class="list">
				<tr>
				<th>도서코드</th>
				<th>도서명</th>
				<th>저자</th>
				<th>1일 대출료</th>
				<th>출판일</th>
				</tr>
				<% while(rs.next()){%>
					  <tr>
					  	<td><%= rs.getString(1) %></td>
					  	<td><%= rs.getString(2) %></td>
					  	<td><%= rs.getString(3) %></td>
					  	<td><%= df.format(rs.getInt(4)) %></td>
					  	<td><%= sf2.format(sf.parse(rs.getString(5)))   %></td>
					  </tr>                                   
					
				<%}%>
			</table>

		<% }catch(Exception e){
			e.printStackTrace();
		}finally{
			try{if(pstmt != null)pstmt.close();
			if(rs != null)rs.close();
			if(con != null)con.close();}
			catch(Exception e){
				e.printStackTrace();
			}
		}%>


