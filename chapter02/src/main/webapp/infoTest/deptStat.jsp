<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import ="java.sql.*" %>    
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
		
		    DecimalFormat kmFmt    = new DecimalFormat("#,###");     // 600
		    DecimalFormat moneyFmt = new DecimalFormat("₩#,###");    // ₩95,000
	 %>
		<h3>(부서별) 주행통계</h3>
		
		<table class="list">
		    <tr>
		        <th>부서코드</th>
		        <th>부서명</th>
		        <th>총운행거리</th>
		        <th>총주유금액</th>
		    </tr>
		<%
		    try {
		        Class.forName(driver);
		        con = DriverManager.getConnection(url, user, password);
		
		        String sql = "SELECT p.DEPT_CODE, p.DEPT_NAME, "
		                   + "       SUM(d.DRV_END - d.DRV_START) AS TOTAL_KM, "
		                   + "       SUM(d.DRV_MONEY) AS TOTAL_MONEY "
		                   + "FROM TBL_DRIVE d "
		                   + "JOIN TBL_DEPT p ON d.DEPT_CODE = p.DEPT_CODE "
		                   + "GROUP BY p.DEPT_CODE "
		                   + "ORDER BY p.DEPT_CODE";
		        pstmt = con.prepareStatement(sql);
		        rs = pstmt.executeQuery();
		
		        while (rs.next()) {
		%>
		    <tr>
		        <td><%= rs.getString("DEPT_CODE") %></td>
		        <td><%= rs.getString("DEPT_NAME") %></td>
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