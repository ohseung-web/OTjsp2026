<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");

	String pk_ride = request.getParameter("pk_ride");
	String name = request.getParameter("name");
	String price = request.getParameter("price");
	String grade = request.getParameter("grade");

	Connection con = null;
	PreparedStatement pstmt = null;
	boolean ok = false;
	
	try {
		  con = Util.getConnection();
	      String sql = "insert into tbl_ride values(?, ?, ?, ?)";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setInt(1, Integer.parseInt(pk_ride));
	      pstmt.setString(2, name);
	      pstmt.setInt(3, Integer.parseInt(price));
	      pstmt.setString(4, grade);
	      
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
	location.href = "rideList.jsp";
<% } else { %>
	alert("등록이 실패하였습니다.");
	history.back();
<% } %>
</script>