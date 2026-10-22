<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<jsp:include page="header.jsp" />
<section>
	<h2>주행내역조회</h2>
	<%
		request.setCharacterEncoding("utf-8");

		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root";
		String password = "12345678";

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DecimalFormat df = new DecimalFormat("#,###");
	%>
	<table>
		<tr>
			<th>주행일자</th><th>차량번호</th><th>모델</th><th>출발km</th>
			<th>도착km</th><th>부서명</th><th>주유금액</th><th>관리</th>
		</tr>
	<%
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

			String sql = "select d.drv_date, d.car_no, c.car_model, d.drv_start, d.drv_end, "
			           + "p.dept_name, d.drv_money "
			           + "from tbl_drive d "
			           + "join tbl_car c on d.car_no = c.car_no "
			           + "join tbl_dept p on d.dept_code = p.dept_code "
			           + "order by d.car_no, d.drv_date desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String drvDate = rs.getString("drv_date");   // 20230301
				String carNo   = rs.getString("car_no");
				String dateView = drvDate.substring(0,4) + "년" + drvDate.substring(4,6) + "월" + drvDate.substring(6,8) + "일";
	%>
		<tr>
			<td><%= dateView %></td>
			<td><%= carNo %></td>
			<td><%= rs.getString("car_model") %></td>
			<td class="right"><%= df.format(rs.getInt("drv_start")) %></td>
			<td class="right"><%= df.format(rs.getInt("drv_end")) %></td>
			<td><%= rs.getString("dept_name") %></td>
			<td class="right">₩<%= df.format(rs.getInt("drv_money")) %></td>
			<td>
				<a href="driveUpdateForm.jsp?drv_date=<%= drvDate %>&car_no=<%= carNo %>">수정</a> |
				<a href="javascript:delConfirm('<%= drvDate %>','<%= carNo %>')">삭제</a>
			</td>
		</tr>
	<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null)    { try { rs.close(); }    catch (Exception e) {} }
			if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
			if (con != null)   { try { con.close(); }   catch (Exception e) {} }
		}
	%>
	</table>
</section>
<jsp:include page="footer.jsp" />

<script type="text/javascript">
	function delConfirm(drvDate, carNo) {
		if (confirm("[" + drvDate + " / " + carNo + "] 주행내역을 삭제하시겠습니까?")) {
			location.href = "driveDeleteProc.jsp?drv_date=" + drvDate + "&car_no=" + carNo;
		}
	}
</script>
