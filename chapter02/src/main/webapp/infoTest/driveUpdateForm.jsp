<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	ResultSet rs = null;

	boolean found = false;
	int drvStart = 0, drvEnd = 0, drvMoney = 0;
	String deptCode = "";

	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);

		// 복합키(주행일자 + 차량번호)로 기존 정보 조회
		String sql = "select drv_start, drv_end, dept_code, drv_money "
		           + "from tbl_drive where drv_date=? and car_no=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, drvDate);
		pstmt.setString(2, carNo);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			found = true;
			drvStart = rs.getInt("drv_start");
			drvEnd   = rs.getInt("drv_end");
			deptCode = rs.getString("dept_code");
			drvMoney = rs.getInt("drv_money");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)    { try { rs.close(); }    catch (Exception e) {} }
		if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
		if (con != null)   { try { con.close(); }   catch (Exception e) {} }
	}

	if (!found) {
%>
<script type="text/javascript">
	alert("존재하지 않는 주행내역입니다!");
	location.href = "driveList.jsp";
</script>
<%
	} else {
%>
<jsp:include page="header.jsp" />
<section>
	<h2>주행내역수정</h2>
	<form name="frm" method="post" action="driveUpdateProc.jsp">
		<table>
			<tr><th>주행일자</th>
				<td class="left"><input type="text" name="drv_date" value="<%= drvDate %>" readonly></td></tr>
			<tr><th>차량번호</th>
				<td class="left"><input type="text" name="car_no" value="<%= carNo %>" readonly></td></tr>
			<tr><th>출발Km</th>
				<td class="left"><input type="text" name="drv_start" value="<%= drvStart %>"> km</td></tr>
			<tr><th>도착km</th>
				<td class="left"><input type="text" name="drv_end" value="<%= drvEnd %>"> km</td></tr>
			<tr><th>부서코드</th>
				<td class="left">
					<select name="dept_code">
						<option value="">부서</option>
						<option value="10" <%= "10".equals(deptCode) ? "selected" : "" %>>[10]영업부</option>
						<option value="20" <%= "20".equals(deptCode) ? "selected" : "" %>>[20]총무부</option>
						<option value="30" <%= "30".equals(deptCode) ? "selected" : "" %>>[30]구매부</option>
						<option value="40" <%= "40".equals(deptCode) ? "selected" : "" %>>[40]개발부</option>
					</select>
				</td></tr>
			<tr><th>주유금액</th>
				<td class="left"><input type="text" name="drv_money" value="<%= drvMoney %>"> 원</td></tr>
			<tr><td colspan="2">
				<input type="button" value="주행내역수정" onclick="checkForm()">
				<input type="button" value="다시쓰기" onclick="resetForm()">
			</td></tr>
		</table>
	</form>
</section>
<jsp:include page="footer.jsp" />

<script type="text/javascript">
	function checkForm() {
		var f = document.frm;

		if (f.drv_start.value.trim() == "") {
			alert("출발Km가 입력되지 않았습니다!"); f.drv_start.focus(); return;
		}
		if (f.drv_end.value.trim() == "") {
			alert("도착km가 입력되지 않았습니다!"); f.drv_end.focus(); return;
		}
		if (f.dept_code.value == "") {
			alert("부서코드가 선택되지 않았습니다!"); f.dept_code.focus(); return;
		}
		if (f.drv_money.value.trim() == "") {
			alert("주유금액이 입력되지 않았습니다!"); f.drv_money.focus(); return;
		}
		if (isNaN(f.drv_start.value)) {
			alert("출발Km는 숫자만 입력해야 합니다!"); f.drv_start.focus(); return;
		}
		if (isNaN(f.drv_end.value)) {
			alert("도착km는 숫자만 입력해야 합니다!"); f.drv_end.focus(); return;
		}
		if (isNaN(f.drv_money.value)) {
			alert("주유금액은 숫자만 입력해야 합니다!"); f.drv_money.focus(); return;
		}
		if (Number(f.drv_end.value) < Number(f.drv_start.value)) {
			alert("도착km는 출발km보다 크거나 같아야 합니다!"); f.drv_end.focus(); return;
		}
		f.submit();
	}

	function resetForm() {
		if (confirm("수정 전 정보로 되돌립니다!")) {
			document.frm.reset();            // value 속성(DB에서 읽은 값)으로 복원
			document.frm.drv_start.focus();
		}
	}
</script>
<%
	}
%>
