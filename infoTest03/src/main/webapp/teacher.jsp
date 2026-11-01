<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />
<section>
<h1>강사조회</h1>
<table width="500" border="1">
  <tr height="40" align="cetner">
  	<td align="center">강사코드</td>
  	<td align="center">강사명</td>
  	<td align="center">강의명</td>
  	<td align="center">수강료</td>
  	<td align="center">강사자격취득일</td>
  </tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	SimpleDateFormat sfread = new SimpleDateFormat("yyyyMMdd");// DB 값 읽기용
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월dd일");// 화면 출력용
	
	try {
		  con = Util.getConnection();
	      String sql ="select * from tbl_teacher";
	      pstmt =con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()){
%>
      <tr height="40" align="center">
      	<td align="center"><%= rs.getInt(1) %></td>
      	<td align="center"><%= rs.getString(2) %></td>
      	<td align="center"><%= rs.getString(3) %></td>
      	<td align="center"><%= String.format("₩%,d",  rs.getInt(4)) %></td>
      	<td align="center"><%= sf.format(sfread.parse(rs.getString(5))) %></td>
      </tr>  
<%	    	  
	      }
	  
	} finally {
	  try {
	    if (rs != null) rs.close();
	    if (pstmt != null) pstmt.close();
	    if (con != null) con.close();
	  } catch (Exception e) { e.printStackTrace(); }
	}

%>
</table>
</section>
<jsp:include page="footer.jsp"/>