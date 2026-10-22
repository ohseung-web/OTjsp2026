<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역 삭제 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String drvDate = request.getParameter("drv_date");
		String carNo   = request.getParameter("car_no");

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "12345678";

		Connection con = null;
		PreparedStatement pstmt = null;

		String msg = null;

		if (drvDate == null || drvDate.trim().isEmpty() || carNo == null || carNo.trim().isEmpty()) {
			msg = "잘못된 접근입니다!";
		} else {
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);

				// 복합키(주행일자 + 차량번호) 모두 조건으로 사용
				String sql = "delete from tbl_drive where drv_date=? and car_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, drvDate);
				pstmt.setString(2, carNo);

				int result = pstmt.executeUpdate();

				if (result > 0) {
					msg = "주행내역이 정상적으로 삭제되었습니다!";
				} else {
					msg = "존재하지 않는 주행내역입니다!";
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "DB 오류";
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
				if (con != null)   { try { con.close(); }   catch (Exception e) {} }
			}
		}
	%>
	<script type="text/javascript">
		alert("<%= msg %>");
		location.href = "driveList.jsp";
	</script>
</body>
</html>
