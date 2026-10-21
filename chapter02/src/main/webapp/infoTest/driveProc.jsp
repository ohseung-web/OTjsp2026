<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    request.setCharacterEncoding("utf-8");

    String drvDate  = request.getParameter("drvDate");
    String carNo    = request.getParameter("carNo");
    int    drvStart = Integer.parseInt(request.getParameter("drvStart"));
    int    drvEnd   = Integer.parseInt(request.getParameter("drvEnd"));
    String deptCode = request.getParameter("deptCode");
    int    drvMoney = Integer.parseInt(request.getParameter("drvMoney"));

    Connection con = null;
    PreparedStatement pstmt = null;

    String driver   = "com.mysql.cj.jdbc.Driver";
    String url      = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
    String user     = "root";
    String password = "12345678";

    try {
        Class.forName(driver);
        con = DriverManager.getConnection(url, user, password);

        String sql = "INSERT INTO TBL_DRIVE VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, drvDate);
        pstmt.setString(2, carNo);
        pstmt.setInt(3, drvStart);
        pstmt.setInt(4, drvEnd);
        pstmt.setString(5, deptCode);
        pstmt.setInt(6, drvMoney);
        pstmt.executeUpdate();
		%>
		        <script>
		            alert("주행내역이 정상적으로 등록 되었습니다!");
		            location.href = "index.jsp";
		        </script>
		<%
		    } catch (Exception e) {
		        e.printStackTrace();
		%>
		        <script>
		            alert("등록에 실패했습니다.");
		            history.back();
		        </script>
		<%
		    } finally {
		        if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
		        if (con != null)   { try { con.close(); }   catch (Exception e) {} }
		    }
		%>
</body>
</html>