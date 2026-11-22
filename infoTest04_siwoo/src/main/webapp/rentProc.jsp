<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>


<%
    request.setCharacterEncoding("utf-8");
    String rent_month = request.getParameter("rent_month");
    String r_no = request.getParameter("r_no");
    String book_code = request.getParameter("book_code");
    int rent_days = Integer.parseInt(request.getParameter("rent_days"));
    int fee = Integer.parseInt(request.getParameter("fee"));

    Connection con = null;
    PreparedStatement pstmt = null;
    try {
        con = Util.getConnection();
        String sql = "INSERT INTO TBL_RENT_202301 (RENT_MONTH, R_NO, BOOK_CODE, RENT_DAYS, FEE) VALUES (?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, rent_month);
        pstmt.setString(2, r_no);
        pstmt.setString(3, book_code);
        pstmt.setInt(4, rent_days);
        pstmt.setInt(5, fee);
        pstmt.executeUpdate();
%>
<script>
    alert("대출신청이 정상적으로 완료되었습니다!");
    location.href = "index.jsp?page=bookList";
</script>
<%
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
        if(con != null) try { con.close(); } catch(SQLException e) {}
    }
%>