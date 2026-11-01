<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%
	request.setCharacterEncoding("UTF-8");

	String registMonth = request.getParameter("regist_month");
	String cNo         = request.getParameter("c_no");
	String classArea   = request.getParameter("class_area");
	String tuition     = request.getParameter("tuition");
	String teacherCode = request.getParameter("teacher_code");

	Connection con = null;
	PreparedStatement pstmt = null;
	boolean ok = false;
	
	try {
		  con = Util.getConnection();
	      String sql = "insert into TBL_CLASS (REGIST_MONTH, C_NO, CLASS_AREA, TUITION, TEACHER_CODE) "
	                 + "values (?, ?, ?, ?, ?)";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, registMonth);
	      pstmt.setString(2, cNo);
	      pstmt.setString(3, classArea);
	      pstmt.setInt(4, (int) Double.parseDouble(tuition));
	      pstmt.setString(5, teacherCode);
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
	alert("수강신청이 정상적으로 완료되었습니다!");
	location.href = "index.jsp";
<% } else { %>
	alert("수강신청 처리에 실패했습니다. (이미 신청된 수강월/회원번호일 수 있습니다)");
	history.back();
<% } %>
</script>
