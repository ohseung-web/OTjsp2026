<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<h2>대출현황조회</h2>
<%-- select --%>
<div class="combo" style="text-align:center;">
	<select>
		<option value="일반">일반</option>
		<option value="우수">우수</option>
	</select>
</div>
<table class="list">
	<tr>
		<th>대출월</th>
		<th>회원번호</th>
		<th>회원명</th>
		<th>도서명</th>
		<th>대출일수</th>
		<th>대출료</th>
		<th>등급</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
	SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년MM월");
	
	try{
		con = Util.getConnection();
		// sql문 작성
		String sql = "select rent.RENT_MONTH, reader.R_NO, reader.R_NAME, book.BOOK_NAME, "
			+ "rent.RENT_DAYS, rent.FEE, reader.GRADE from TBL_RENT_202301 rent "
			+ "inner join TBL_READER_202301 reader on rent.R_NO = reader.R_NO "
			+ "inner join TBL_BOOK_202301 book on rent.BOOK_CODE = book.BOOK_CODE";
			// + "where reader.GRADE = ?";
		// pstmt 선언
		pstmt = con.prepareStatement(sql);
		// ?에 대입
		/* pstmt.setString(1, )) */
		// rs 선언
		rs = pstmt.executeQuery();
		//반복문
		while(rs.next()){
%>
			<tr>
				<td class="c"><%= sf02.format(sf.parse(rs.getString("rent.RENT_MONTH"))) %></td>
				<td class="c"><%= rs.getString("reader.R_NO") %></td>
				<td class="c"><%= rs.getString("reader.R_NAME") %></td>
				<td class="c"><%= rs.getString("book.BOOK_NAME") %></td>
				<td class="c"><%= rs.getInt("rent.RENT_DAYS") %>일</td>
				<td class="c">￦<%= df.format(rs.getInt("rent.FEE")) %></td>
				<td class="c"><%= rs.getString("reader.GRADE") %></td>
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