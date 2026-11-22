<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>

<h2>도서조회</h2>
<table class="list">
    <tr>
        <th>도서코드</th>
        <th>도서명</th>
        <th>저자</th>
        <th>1일 대출료</th>
        <th>출판일</th>
    </tr>
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            String sql = "SELECT BOOK_CODE, BOOK_NAME, AUTHOR, DAY_FEE, PUBLISH_DATE FROM TBL_BOOK_202301";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String bookCode = rs.getString("BOOK_CODE");
                String bookName = rs.getString("BOOK_NAME");
                String author = rs.getString("AUTHOR");
                int dayFee = rs.getInt("DAY_FEE");
                String pubDate = rs.getString("PUBLISH_DATE");
                
                String pubDateFormatted = pubDate;
                if(pubDate != null && pubDate.length() == 8) {
                    pubDateFormatted = pubDate.substring(0, 4) + "년 " + pubDate.substring(4, 6) + "월 " + pubDate.substring(6, 8) + "일";
                }
    %>
    <tr>
        <td class="c"><%= bookCode %></td>
        <td><%= bookName %></td>
        <td><%= author %></td>
        <td class="r">₩<%= String.format("%,d", dayFee) %></td>
        <td class="c"><%= pubDateFormatted %></td>
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