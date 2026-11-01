<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />
<section>
<h1>강사매출현황</h1>
<table width="500" border="1">
  <tr height="40" align="center">
  	<td align="center">강사코드</td>
  	<td align="center">강의명</td>
  	<td align="center">강사명</td>
  	<td align="center">총매출</td>
  </tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		  con = Util.getConnection();
	      String sql = "select t.TEACHER_CODE, t.CLASS_NAME, t.TEACHER_NAME, ifnull(sum(c.TUITION), 0) "
	                 + "from TBL_TEACHER t left join TBL_CLASS c "
	                 + "on t.TEACHER_CODE = c.TEACHER_CODE "
	                 + "group by t.TEACHER_CODE, t.CLASS_NAME, t.TEACHER_NAME "
	                 + "order by t.TEACHER_CODE";
	      pstmt =con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()){
%>
      <tr height="40" align="center">
      	<td align="center"><%= rs.getString(1) %></td>
      	<td align="center"><%= rs.getString(2) %></td>
      	<td align="right"><%= rs.getString(3) %></td>
      	<td align="right"><%= String.format("₩%,d",  rs.getInt(4)) %></td>
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
