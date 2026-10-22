<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역 수정 처리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String drvDate   = request.getParameter("drv_date");
		String carNo     = request.getParameter("car_no");
		String drvStart  = request.getParameter("drv_start");
		String drvEnd    = request.getParameter("drv_end");
		String deptCode  = request.getParameter("dept_code");
		String drvMoney  = request.getParameter("drv_money");

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "12345678";

		Connection con = null;
		PreparedStatement pstmt = null;

		String msg = null;
		boolean ok = false;   // true면 목록으로 이동, false면 이전 화면으로

		if (drvDate == null || drvDate.trim().isEmpty() || carNo == null || carNo.trim().isEmpty()) {
			msg = "잘못된 접근입니다!";
		} else {
			try {
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);

				// 복합키(주행일자 + 차량번호) 모두 조건으로 사용
				String sql = "update tbl_drive set drv_start=?, drv_end=?, dept_code=?, drv_money=? "
				           + "where drv_date=? and car_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(drvStart));
				pstmt.setInt(2, Integer.parseInt(drvEnd));
				pstmt.setString(3, deptCode);
				pstmt.setInt(4, Integer.parseInt(drvMoney));
				pstmt.setString(5, drvDate);
				pstmt.setString(6, carNo);

				int result = pstmt.executeUpdate();

				if (result > 0) {
					msg = "주행내역이 정상적으로 수정되었습니다!";
					ok = true;
				} else {
					msg = "수정에 실패했습니다!";
				}
			} catch (Exception e) {
				e.printStackTrace();
				msg = "수정에 실패했습니다!";
			} finally {
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
				if (con != null)   { try { con.close(); }   catch (Exception e) {} }
			}
		}
	%>
	<script type="text/javascript">
		alert("<%= msg %>");
		<% if (ok) { %>
			location.href = "driveList.jsp";
		<% } else { %>
			history.back();
		<% } %>
	</script>
</body>
</html>
