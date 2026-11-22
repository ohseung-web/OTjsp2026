<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<%
	request.setCharacterEncoding("utf-8");
%>
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
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// 숫자 및 날짜 서식 인스턴스
	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월dd일");
	
	try{
		con = Util.getConnection();
		// sql문
		String sql = "select * from TBL_BOOK_202301";
		// pstmt 객체선언
		pstmt = con.prepareStatement(sql);
		// rs 실행
		rs = pstmt.executeQuery();
		// 반복문
		while(rs.next()){
%>
			<tr>
				<td class="c"><%= rs.getString("BOOK_CODE") %></td>
				<td class="c"><%= rs.getString("BOOK_NAME") %></td>
				<td class="c"><%= rs.getString("AUTHOR") %></td>
				<td class="c">￦<%= df.format(rs.getInt("DAY_FEE")) %></td>
				<td class="c"><%= sf02.format(sf.parse(rs.getString("PUBLISH_DATE"))) %></td>
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

