<%@page import="java.text.DecimalFormat"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
	
	
<h2>도서별 대출실적</h2>
<table class="list">
    <tr>
        <th>도서코드</th>
        <th>도서명</th>
        <th>대출건수</th>
        <th>총대출료</th>
    </tr>
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            String sql = "SELECT A.BOOK_CODE, BOOK_NAME, COUNT(*) AS CNT, SUM(FEE) AS TOTAL_FEE " +
                         "FROM TBL_RENT_202301 A, TBL_BOOK_202301 B " +
                         "WHERE A.BOOK_CODE = B.BOOK_CODE " +
                         "GROUP BY A.BOOK_CODE, BOOK_NAME " +
                         "ORDER BY TOTAL_FEE DESC";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String bookCode = rs.getString("BOOK_CODE");
                String bookName = rs.getString("BOOK_NAME");
                int cnt = rs.getInt("CNT");
                int totalFee = rs.getInt("TOTAL_FEE");
    %>
    <tr>
        <td class="c"><%= bookCode %></td>
        <td class="r"><%= bookName %></td>
        <td class="c"><%= cnt %>건</td>
        <td class="r">₩<%= String.format("%,d", totalFee) %></td>
    </tr>
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try { rs.close(); } catch(SQLException e) {}
            if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if(con != null) try { con.close(); } catch(SQLException e) {}
        }
    %>
</table>