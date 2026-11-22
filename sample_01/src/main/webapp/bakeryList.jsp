<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />

<table border="1" width="400">
		  <tr height="30">
		    <th>제과코드</th>
		    <th>제과명</th>
		    <th>가격</th>
		  </tr>
<% 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 날짜 형식을 문자에서 Date형식으로 parse한다.
    DecimalFormat df = new DecimalFormat("￦#,##0 원");
	
	try {
		  con = Util.getConnection();
	      String sql = " select * from tbl_bread order by pk_bread asc " ;
	      pstmt = con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()){	    	  
%>
		 
		  <tr height="30">
		    <td width="100"><%=rs.getString(1) %></td>
		    <td width="170" align="center"><%=rs.getString(2) %></td>
		    <td width="130" align="right"><%=df.format(rs.getInt(3)) %></td>		    
		  </tr>
<%
	      } 
	} catch (Exception e) {
	  e.printStackTrace();
	} finally {
	  try {
	    if (pstmt != null) pstmt.close();
	    if (con != null) con.close();
	  } catch (Exception e) { e.printStackTrace(); }
	}
%>
</table>
<jsp:include page="footer.jsp" />