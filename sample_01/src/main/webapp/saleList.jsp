<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />

<table border="1" width="500">
		  <tr height="30">
		    <th>판매코드</th>
		    <th>판매일</th>
		    <th>판매수량</th>
		    <th>제과빵</th>
		  </tr>
<% 
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 날짜 형식을 문자에서 Date형식으로 parse한다.
	SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
	// Date형식으로 변환한 날짜를 yy-mm-dd형식으로 출력한다.
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	
	try {
		  con = Util.getConnection();
	      String sql = " select s.pk_sale, s.deal_date, s.deal_count, b.name from tbl_sale s " 
	    		       +"inner join tbl_bread b on s.fk_bread=b.pk_bread";
	      pstmt = con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()){	    	  
%>
		 
		  <tr height="30">
		    <td width="100"><%=rs.getString(1) %></td>
		    <td width="100" align="center"><%=sdf.format(sd.parse(rs.getString(2))) %></td>
		    <td width="100" align="right"><%=rs.getString(3) %>개</td>
		    <td width="200" align="center"><%=rs.getString(4) %></td>		    
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