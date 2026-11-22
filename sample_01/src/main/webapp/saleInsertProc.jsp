<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%
	request.setCharacterEncoding("UTF-8");

	String pk_sale = request.getParameter("pk_sale");
	String deal_date = request.getParameter("deal_date");
	String fk_bakery = request.getParameter("fk_bakery");
	String fk_bread = request.getParameter("fk_bread");
	String deal_count = request.getParameter("deal_count");

	Connection con = null;
	PreparedStatement pstmt = null;
	boolean ok = false;
	
	try {
		  con = Util.getConnection();
	      String sql = "insert into tbl_sale values(?, ?, ?, ?, ?)";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, pk_sale);
	      pstmt.setString(2, deal_date);
	      pstmt.setInt(3, Integer.parseInt(deal_count));
	      pstmt.setString(4, fk_bakery);
	      pstmt.setString(5, fk_bread);
	      
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
	alert("판매등록이 정상적으로 되었습니다.");
	location.href = "index.jsp";
<% } else { %>
	alert("판매등록이 실패하였습니다.");
	history.back();
<% } %>
</script>