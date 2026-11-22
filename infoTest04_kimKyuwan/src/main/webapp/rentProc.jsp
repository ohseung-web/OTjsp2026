<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String RENT_MONTH = request.getParameter("RENT_MONTH");
String R_NO = request.getParameter("R_NO");
String BOOK_CODE = request.getParameter("BOOK_CODE");
int RENT_DAYS = Integer.parseInt(request.getParameter("RENT_DAYS"));
int FEE = Integer.parseInt(request.getParameter("FEE"));


try {
	con = Util.getConnection();

	String sql = "insert into tbl_rent_202301 values(?,?,?,?,?)";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, RENT_MONTH);
	pstmt.setString(2, R_NO);
	pstmt.setString(3, BOOK_CODE);
	pstmt.setInt(4, RENT_DAYS);
	pstmt.setInt(5, FEE);

	int result = pstmt.executeUpdate();
	
	
	if(result == 1){
		out.print("<script type='text/javascript'>");
		out.print("alert('대출신청이 정상적으로 완료되었습니다!');");
		out.print("location.href= 'index.jsp';");
		out.print("</script>");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		if (con != null)
	con.close();
		if (pstmt != null)
	pstmt.close();
		if (rs != null)
	rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

%>