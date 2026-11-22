<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>


<%
    String grade = request.getParameter("grade");
    if(grade == null) {
        grade = "";
    }
%>
<script>
function searchGrade(e) {
    var val = e.value;
    location.href = "index.jsp?page=readerList&grade=" + val;
}
</script>

<h2>대출현황조회</h2>
등급 : 
<select name="grade" onchange="searchGrade(this)">
    <option value="" <%= "".equals(grade) ? "selected" : "" %>>전체</option>
    <option value="일반" <%= "일반".equals(grade) ? "selected" : "" %>>일반</option>
    <option value="우수" <%= "우수".equals(grade) ? "selected" : "" %>>우수</option>
</select>
<br><br>

<table class="list">
    <tr>
        <th>대출월</th>
        <th>회원번호</th>
        <th>회원명</th>
        <th>도서명</th>
        <th>대출일수</th>
        <th>대출료</th>
        <th>등급</th>
    </tr>
    <%
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            String sql = "SELECT RENT_MONTH, A.R_NO, R_NAME, BOOK_NAME, RENT_DAYS, FEE, GRADE " +
                         "FROM TBL_RENT_202301 A, TBL_READER_202301 B, TBL_BOOK_202301 C " +
                         "WHERE A.R_NO = B.R_NO AND A.BOOK_CODE = C.BOOK_CODE";
            
            if(!grade.equals("")) {
                sql += " AND GRADE = ?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, grade);
            } else {
                pstmt = con.prepareStatement(sql);
            }
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                String rentMonth = rs.getString("RENT_MONTH");
                if(rentMonth != null && rentMonth.length() == 6) {
                    rentMonth = rentMonth.substring(0, 4) + "년 " + rentMonth.substring(4, 6) + "월";
                }
                String rNo = rs.getString("R_NO");
                String rName = rs.getString("R_NAME");
                String bookName = rs.getString("BOOK_NAME");
                int rentDays = rs.getInt("RENT_DAYS");
                int fee = rs.getInt("FEE");
                String rGrade = rs.getString("GRADE");
    %>
    <tr>
        <td><%= rentMonth %></td>
        <td><%= rNo %></td>
        <td><%= rName %></td>
        <td><%= bookName %></td>
        <td><%= rentDays %>일</td>
        <td>₩<%= String.format("%,d", fee) %></td>
        <td><%= rGrade %></td>
    </tr>
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) try { rs.close(); } catch(Exception e) {}
            if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if(con != null) try { con.close(); } catch(Exception e) {}
        }
    %>
</table>