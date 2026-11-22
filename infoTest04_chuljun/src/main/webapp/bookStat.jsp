<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

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
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DecimalFormat df = new DecimalFormat("#,###");
	
	try{
		con = Util.getConnection();
		// sql문 작성 
		String sql = "select book.BOOK_CODE, book.BOOK_NAME, count(rent.BOOK_CODE) as cnt, "
			+"sum(rent.FEE) as sum from TBL_RENT_202301 rent inner join TBL_BOOK_202301 book "
			+ "on rent.BOOK_CODE = book.BOOK_CODE group by rent.BOOK_CODE";
		// pstmt 선언
		pstmt = con.prepareStatement(sql);
		// rs선언
		rs = pstmt.executeQuery();
		// 반복문
		while(rs.next()){
%>
			<tr>
				<td class="c"><%= rs.getString("book.BOOK_CODE") %></td>
				<td class="c"><%= rs.getString("book.BOOK_NAME") %></td>
				<td class="c"><%= rs.getInt("cnt") %>건</td>
				<td class="c">￦<%= df.format(rs.getInt("sum")) %></td>
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
