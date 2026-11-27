<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");

	String pk_customer = request.getParameter("pk_customer");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String free_pass = request.getParameter("free_pass");

	Connection con = null;
	PreparedStatement pstmt = null;
	boolean ok = false;
	
	try {
		  con = Util.getConnection();
	      String sql = "insert into tbl_customer values(?, ?, ?, ?)";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setInt(1, Integer.parseInt(pk_customer));
	      pstmt.setString(2, name);
	      pstmt.setInt(3, Integer.parseInt(age));
	      pstmt.setString(4, free_pass);
	      
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
	alert("정상적으로 처리 되었습니다.");
	location.href = "customerList.jsp";
<% } else { %>
	alert("등록이 실패하였습니다.");
	history.back();
<% } %>
</script>