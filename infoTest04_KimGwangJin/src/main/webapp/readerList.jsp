<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="DBPKG.Util" %>

	<h2>대출현황조회</h2>
	
	<p>등급:</p> 
	<select name="grade" onchange="changeGrade(this.value)">
		<option value="0" selected>전체</option>
		<option value="1">일반</option>
		<option value="2">우수</option>
	</select>
	
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
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection con = null;
	
	String grade= request.getParameter("grade");
	System.out.println("grade value : " + grade);
	try {
		con = Util.getConnection();
		String sql="";
		/*  if("전체".equals(grade) || "".equals(grade)) {*/
			sql = "SELECT  tr.RENT_MONTH   , 	trd.R_NO   , 	trd.R_NAME   ,	tb.BOOK_NAME   ,	tr.RENT_DAYS   ,	tr.FEE   ,	trd.GRADE fROM TBL_RENT_202301 tr        JOIN TBL_READER_202301 trd             on tr.R_NO = trd.R_NO        JOIN TBL_BOOK_202301 tb             on tr.book_code = tb.book_code";
			pstmt = con.prepareStatement(sql);
	/* 	} else {
			sql = "SELECT  tr.RENT_MONTH   , 	trd.R_NO   , 	trd.R_NAME   ,	tb.BOOK_NAME   ,	tr.RENT_DAYS   ,	tr.FEE   ,	trd.GRADE fROM TBL_RENT_202301 tr        JOIN TBL_READER_202301 trd             on tr.R_NO = trd.R_NO        JOIN TBL_BOOK_202301 tb             on tr.book_code = tb.book_code where trd.grade = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, grade);
		} */		
		
		rs = pstmt.executeQuery();
		DecimalFormat df = new DecimalFormat("#,##0");
		while(rs.next()) {
			String pDate = rs.getString("tr.RENT_MONTH");
			String rentMonth = pDate.substring(0, 4) + "년" + pDate.substring(4, 6) + "월";
			String strFee = df.format(rs.getInt("tr.FEE"));
		%>
		<tr>
			<td><%=rentMonth%></td>
			<td><%=rs.getString("trd.R_NO")%></td>
			<td><%=rs.getString("trd.R_NAME")%></td>
			<td><%=rs.getString("tb.BOOK_NAME")%></td>
			<td><%=rs.getInt("tr.RENT_DAYS")%>일</td>
			<td>\<%=strFee%></td>
			<td><%=rs.getString("trd.GRADE")%></td>
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

<script type="text/javascript">
	function changeGrade(target) {
		console.log(target);
		let targetValue = target == 0 ? "전체" : 
			target == 1 ? "일반" : "우수";
		location.href="index.jsp?page=readerList&&grade="+targetValue		
	}

</script>

