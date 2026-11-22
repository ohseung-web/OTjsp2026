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
		DecimalFormat df2 = new DecimalFormat("####건");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy년MM월dd일");
		try{
			String sql = "select r.BOOK_CODE,BOOK_NAME, count(r.BOOK_CODE),sum(FEE) from tbl_rent_202301 r" 
					+ " inner join tbl_book_202301 b on r.BOOK_CODE = b.BOOK_CODE"
					+ " group by r.BOOK_CODE"
					+ " order by sum(FEE) desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();%>
			
			<h2>도서별 대출실적</h2>
			
			<table class="list">
				<tr>
				<th>도서코드</th>
				<th>도서명</th>
				<th>대출건수</th>
				<th>총대출료</th>
				</tr>
				<% while(rs.next()){%>
					  <tr>
					  	<td><%= rs.getString(1) %></td>
					  	<td><%= rs.getString(2) %></td>
					  	<td><%= df2.format(rs.getInt(3))%></td>
					  	<td><%= df.format(rs.getInt(4)) %></td>
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
