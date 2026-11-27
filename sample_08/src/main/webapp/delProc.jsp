<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");

	int pk_usage = Integer.parseInt(request.getParameter("pk_usage"));

	Connection con = null;
	PreparedStatement pstmt = null;
	boolean ok = false;
	
	try {
		  con = Util.getConnection();
	      String sql = "delete from tbl_usage where pk_usage=?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setInt(1, pk_usage);
	      
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
	alert("삭제를 실패하였습니다.");
	history.back();
<% } %>
</script>