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
		DecimalFormat df2 = new DecimalFormat("#,###일");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy년MM월");
	    String grade = request.getParameter("grade");

	    if (grade == null) {
	        grade = "일반";
	    }%>
		<h2>대출현황조회</h2>
		<form name="jform" action="index.jsp" method="get">
		<input type ="hidden" name="page" value="readerList.jsp">
		등급: 
		<select name="grade" onchange = "this.form.submit()">
			<option value="일반" <%="일반".equals(grade)?"selected":"" %>>일반</option >
			<option value="우수" <%= "우수".equals(grade)?"selected":"" %>>우수</option >
		</select>
		</form>
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
		
		<%try{

			String sql = "select r.RENT_MONTH, r.R_NO, re.R_NAME,b.BOOK_NAME,r.RENT_DAYS, sum(FEE),re.GRADE"
					+ " from tbl_rent_202301 r inner join tbl_reader_202301 re on r.R_NO = re.R_NO"
					+ " inner join tbl_book_202301 b on r.BOOK_CODE = b.BOOK_CODE"
					+ " where re.GRADE =?"
					+ " GROUP BY"
					+ " r.RENT_MONTH,"
					+ " r.R_NO,"
					+ " re.R_NAME,"
					+ " b.BOOK_NAME,"
					+ " r.RENT_DAYS,"
					+ " re.GRADE";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grade);
			rs = pstmt.executeQuery();
			
				while(rs.next()){%>
					  <tr>
					  	<td><%= sf2.format(sf.parse(rs.getString(1)))%></td>
					  	<td><%= rs.getString(2) %></td>
					  	<td><%= rs.getString(3) %></td>
					  	<td><%= rs.getString(4) %></td>
					  	<td><%= df2.format(rs.getInt(5)) %></td>
					  	<td><%= df.format(rs.getInt(6)) %></td>
					  	<td><%= rs.getString(7)%></td>
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

