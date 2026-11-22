<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="DBPKG.Util" %>

	<h2>도서별 대출실적</h2>
	
	<table class="list">
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>대출건수</th>
			<th>총대출료</th>			
		</tr>
		
		
	
<%
	request.setCharacterEncoding("utf-8");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection con = null;
	
	try {
		con = Util.getConnection();
		String sql = "SELECT tb.BOOK_CODE ,	tb.BOOK_NAME ,   count(tr.book_code) as count  ,	sum(tr.FEE) total_fee fROM TBL_RENT_202301 tr    JOIN TBL_BOOK_202301 tb     on tr.BOOK_CODE = tb.BOOK_CODE group by tb.book_code";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		DecimalFormat df = new DecimalFormat("#,##0");
		
		while(rs.next()) {
			String stFee = df.format(rs.getInt("total_fee"));	
			
		%>
		<tr>
			<td><%= rs.getString("tb.BOOK_CODE")%></td>
			<td style="text-align:right;"><%=rs.getString("tb.BOOK_NAME")%></td>
			<td style="text-align:center;"><%=rs.getString("count")%>건</td>
			<td style="text-align:right;">\<%=stFee%></td>	
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