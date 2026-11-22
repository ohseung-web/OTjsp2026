<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="DBPKG.Util" %>

	<h2>도서조회</h2>
	
	<table class="list">
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>저자</th>
			<th>1일 대출료</th>
			<th>출판일</th>
		</tr>
		
		
	
<%
	request.setCharacterEncoding("utf-8");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection con = null;
	
	try {
		con = Util.getConnection();
		String sql = "SELECT * FROM TBL_BOOK_202301";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String pDate = rs.getString("publish_date");
			String publishDate = pDate.substring(0, 4) + "년" + pDate.substring(4, 6) + "월" + pDate.substring(6, 8) + "일";
			
		%>
		<tr>
			<td><%= rs.getString("book_code")%></td>
			<td><%=rs.getString("book_name")%></td>
			<td><%=rs.getString("author")%></td>
			<td>\<%=rs.getInt("day_fee")%></td>
			<td><%=publishDate%></td>
		</tr>	
			
			
		<%}		
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (con != null) con.close();
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

%>
</table>