<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
  /* DB 접속 정보 */
  String driver = "com.mysql.cj.jdbc.Driver";
  String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
  String user = "root";
  String password = "12345678";

  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
%>
<jsp:include page="header.jsp" />
<section>
  <h2>회원매출조회</h2>
  <table>
    <tr><th>회원번호</th><th>회원성명</th><th>고객등급</th><th>매출</th></tr>
<%
  try {
    Class.forName(driver);
    con = DriverManager.getConnection(url, user, password);
    String sql = "SELECT m1.custno, m1.custname, "
               + "CASE m1.grade WHEN 'A' THEN 'VIP' WHEN 'B' THEN '일반' ELSE '직원' END AS gname, "
               + "SUM(m2.price) AS total "
               + "FROM member_tbl_02 m1 INNER JOIN money_tbl_02 m2 ON m1.custno = m2.custno "
               + "GROUP BY m1.custno, m1.custname, m1.grade ORDER BY total DESC";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
    while (rs.next()) {
%>
    <tr>
      <td><%= rs.getInt("custno") %></td>
      <td><%= rs.getString("custname") %></td>
      <td><%= rs.getString("gname") %></td>
      <td style="text-align:right"><%= String.format("₩%,d", rs.getLong("total")) %></td>
    </tr>
<%
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (con != null) con.close();
    } catch (Exception e) { e.printStackTrace(); }
  }
%>
  </table>
  <!-- <p style="text-align:center"><a class="link" href="gradeForm.jsp">등급별 통계</a></p> -->
</section>
<jsp:include page="footer.jsp" />
