<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>    
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
		
		    SimpleDateFormat inFmt  = new SimpleDateFormat("yyyyMMdd");        // DB 값 읽기용
		    SimpleDateFormat outFmt = new SimpleDateFormat("yyyy년MM월dd일");   // 화면 출력용
		    DecimalFormat kmFmt     = new DecimalFormat("#,###");              // 10,000
		    DecimalFormat moneyFmt  = new DecimalFormat("₩#,###");             // ₩25,000
		%>
		<h3>주행내역조회</h3>
		
		<table class="list">
		    <tr>
		        <th>주행일자</th>
		        <th>차량번호</th>
		        <th>모델</th>
		        <th>출발km</th>
		        <th>도착km</th>
		        <th>부서명</th>
		        <th>주유금액</th>
		    </tr>
		<%
		    try {
		        Class.forName(driver);
		        con = DriverManager.getConnection(url, user, password);
		
		        String sql = "SELECT d.DRV_DATE, d.CAR_NO, c.CAR_MODEL, d.DRV_START, d.DRV_END, "
		                   + "       p.DEPT_NAME, d.DRV_MONEY "
		                   + "FROM TBL_DRIVE d "
		                   + "JOIN TBL_CAR c  ON d.CAR_NO = c.CAR_NO "
		                   + "JOIN TBL_DEPT p ON d.DEPT_CODE = p.DEPT_CODE "
		                   + "ORDER BY d.CAR_NO, d.DRV_DATE DESC";
		        pstmt = con.prepareStatement(sql);
		        rs = pstmt.executeQuery();
		
		        while (rs.next()) {
		%>
		    <tr>
		        <td><%= outFmt.format(inFmt.parse(rs.getString("DRV_DATE"))) %></td>
		        <td><%= rs.getString("CAR_NO") %></td>
		        <td><%= rs.getString("CAR_MODEL") %></td>
		        <td><%= kmFmt.format(rs.getInt("DRV_START")) %></td>
		        <td><%= kmFmt.format(rs.getInt("DRV_END")) %></td>
		        <td><%= rs.getString("DEPT_NAME") %></td>
		        <td><%= moneyFmt.format(rs.getInt("DRV_MONEY")) %></td>
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