<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />

<table border="1" width="700">
		  <tr height="30">
		    <th>제과점명</th>
		    <th>지역</th>
		    <th>설명</th>
		    <th>판매수량</th>
		    <th>매출</th>
		  </tr>
<% 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 날짜 형식을 문자에서 Date형식으로 parse한다.
    DecimalFormat df = new DecimalFormat("#,##0원");
	
	try {
		  con = Util.getConnection();
	      String sql = "select k.name, k.address, k.etc, sum(s.deal_count) as count,"
	    		       +" sum(s.deal_count * b.price) as total"
	    		       +" from tbl_bakery k INNER JOIN tbl_sale s ON s.fk_bakery = k.pk_bakery"
	    		       +" INNER JOIN tbl_bread b ON b.pk_bread = s.fk_bread "
	    		       +" GROUP BY k.pk_bakery, k.name, k.address, k.etc"
	    		       +" order by k.name asc";
	      pstmt = con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()){	    	  
%>
		 
		  <tr height="30">
		    <td width="100"><%=rs.getString(1) %></td>
		    <td width="50" align="center"><%=rs.getString(2) %></td>
		    <td width="300" align="left"><%=rs.getString(3) %></td>		    
		    <td width="100" align="right"><%=rs.getInt(4) %>개</td>		    
		    <td width="150" align="right"><%=df.format(rs.getInt(5)) %></td>		    
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