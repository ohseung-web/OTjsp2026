<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");

	String pk_usage = request.getParameter("pk_usage");
	String usage_date = request.getParameter("usage_date");
	String fk_customer = request.getParameter("fk_customer");
	String pk_ride = request.getParameter("pk_ride");

	Connection con = null;
	PreparedStatement pstmt = null;
	boolean ok = false;
	
	try {
		  con = Util.getConnection();
	      String sql = "insert into tbl_usage values(?, ?, ?, ?)";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setInt(1, Integer.parseInt(pk_usage));
	      pstmt.setString(2, usage_date);
	      pstmt.setInt(3, Integer.parseInt(fk_customer));
	      pstmt.setInt(4, Integer.parseInt(pk_ride));
	      
	      ok = pstmt.executeUpdate() > 0;
	      
	} catch (Exception e) {
	  e.printStackTrace();
	} finally {
	  try {
	    if (pstmt != null) pstmt.close();
	    if (con != null) con.close();
	  } catch (Exception e) { e.printStackTrace(); }
	}
%>
<script>
<% if (ok) { %>
	alert("정상적으로 처리되었습니다.");
	location.href = "usageList.jsp";
<% } else { %>
	alert("등록이 실패하였습니다.");
	history.back();
<% } %>
</script>