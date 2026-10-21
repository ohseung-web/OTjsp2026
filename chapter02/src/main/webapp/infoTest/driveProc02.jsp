<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역등록</title>
</head>
<body>
		<%
		    request.setCharacterEncoding("utf-8");
		
		    String drvDate  = request.getParameter("drvDate");
		    String carNo    = request.getParameter("carNo");
		    String drvStart = request.getParameter("drvStart");
		    String drvEnd   = request.getParameter("drvEnd");
		    String deptCode = request.getParameter("deptCode");
		    String drvMoney = request.getParameter("drvMoney");
		
		    /* 입력값 검사: 하나라도 걸리면 msg에 메시지를 담는다. */
		    String msg = null;
		
		    if (drvDate == null || drvDate.isEmpty()) {
		        msg = "주행일자가 입력되지 않았습니다!";
		    } else if (carNo == null || carNo.isEmpty()) {
		        msg = "차량번호가 입력되지 않았습니다!";
		    } else if (drvStart == null || drvStart.isEmpty()) {
		        msg = "출발Km가 입력되지 않았습니다!";
		    } else if (drvEnd == null || drvEnd.isEmpty()) {
		        msg = "도착km가 입력되지 않았습니다!";
		    } else if (deptCode == null || deptCode.isEmpty()) {
		        msg = "부서코드가 선택되지 않았습니다!";
		    } else if (drvMoney == null || drvMoney.isEmpty()) {
		        msg = "주유금액이 입력되지 않았습니다!";
		    }
		
		    if (msg != null) {
		        /* 검사에 걸리면 알림창 → 이전 페이지로 이동 (DB 처리는 하지 않음) */
		%>
		        <script type="text/javascript">
		            alert("<%= msg %>");
		            history.go(-1);
		        </script>
		<%
		    } else {
		        /* 검사를 모두 통과했을 때만 DB에 저장 */
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
		            pstmt.setInt(3, Integer.parseInt(drvStart));
		            pstmt.setInt(4, Integer.parseInt(drvEnd));
		            pstmt.setString(5, deptCode);
		            pstmt.setInt(6, Integer.parseInt(drvMoney));
		            pstmt.executeUpdate();
		%>
		            <script type="text/javascript">
		                alert("주행내역이 정상적으로 등록 되었습니다!");
		                location.href = "index.jsp";
		            </script>
		<%
		        } catch (Exception e) {
		            e.printStackTrace();
		%>
		            <script type="text/javascript">
		                alert("등록에 실패했습니다.");
		                history.back();
		            </script>
		<%
		        } finally {
		            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
		            if (con != null)   { try { con.close(); }   catch (Exception e) {} }
		        }
		    }
		%>
</body>
</html>