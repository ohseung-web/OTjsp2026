<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String driver   = "com.mysql.cj.jdbc.Driver";
    String url      = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
    String user     = "root";
    String password = "12345678";

    DecimalFormat kmFmt    = new DecimalFormat("#,###");
    DecimalFormat moneyFmt = new DecimalFormat("₩#,###");
		%>
		<h3>(제조사별) 주행통계</h3>
		
		<table class="list">
		    <tr>
		        <th>제조사</th>
		        <th>차량수</th>
		        <th>총운행거리</th>
		        <th>총주유금액</th>
		    </tr>
		<%
		    try {
		        Class.forName(driver);
		        con = DriverManager.getConnection(url, user, password);
		
		        String sql = "SELECT c.CAR_COMPANY, "
		                   + "       COUNT(DISTINCT c.CAR_NO) AS CAR_CNT, "
		                   + "       IFNULL(SUM(d.DRV_END - d.DRV_START), 0) AS TOTAL_KM, "
		                   + "       IFNULL(SUM(d.DRV_MONEY), 0) AS TOTAL_MONEY "
		                   + "FROM TBL_CAR c "
		                   + "LEFT JOIN TBL_DRIVE d ON c.CAR_NO = d.CAR_NO "
		                   + "GROUP BY c.CAR_COMPANY "
		                   + "ORDER BY TOTAL_MONEY DESC";
		        pstmt = con.prepareStatement(sql);
		        rs = pstmt.executeQuery();
		
		        while (rs.next()) {
		%>
		    <tr>
		        <td><%= rs.getString("CAR_COMPANY") %></td>
		        <td style="text-align:right;"><%= rs.getInt("CAR_CNT") %></td>
		        <td style="text-align:right;"><%= kmFmt.format(rs.getInt("TOTAL_KM")) %></td>
		        <td style="text-align:right;"><%= moneyFmt.format(rs.getInt("TOTAL_MONEY")) %></td>
		    </tr>
		<%
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        out.println("DB fail");
		    } finally {
		        if (rs != null)    { try { rs.close(); }    catch (Exception e) {} }
		        if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
		        if (con != null)   { try { con.close(); }   catch (Exception e) {} }
		    }
		%>
		</table>
</body>
</html>