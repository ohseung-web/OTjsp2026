	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="java.text.DecimalFormat" %>
	<%
	    request.setCharacterEncoding("utf-8");
	    String carNo = request.getParameter("carNo");   // 선택한 차량번호 (처음 접속 시 null)
	
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	
	    String driver   = "com.mysql.cj.jdbc.Driver";
	    String url      = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	    String user     = "root";
	    String password = "12345678";
	
	    SimpleDateFormat inFmt  = new SimpleDateFormat("yyyyMMdd");
	    SimpleDateFormat outFmt = new SimpleDateFormat("yyyy년MM월dd일");
	    DecimalFormat kmFmt     = new DecimalFormat("#,###");
	    DecimalFormat moneyFmt  = new DecimalFormat("₩#,###");
	%>
	<script type="text/javascript">
	function checkForm() {
	    let f = document.carFrm;
	
	    if (f.carNo.value == "") {
	        alert("차량번호가 선택되지 않았습니다!");
	        f.carNo.focus();
	        return;
	    }
	    f.submit();
	}
	</script>
	
	<h3>차량별주행조회</h3>
	
	<form name="carFrm" method="get" action="index.jsp">
	    <input type="hidden" name="page" value="carDrive">
	    <div style="text-align:center; margin-bottom:20px;">
	        <select name="carNo">
	            <option value="">차량선택</option>
	<%
	    /* 콤보박스: 차량 테이블에서 읽어서 option 반복 출력 */
	    try {
	        Class.forName(driver);
	        con = DriverManager.getConnection(url, user, password);
	
	        String sql = "SELECT CAR_NO, CAR_MODEL FROM TBL_CAR ORDER BY CAR_NO";
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	
	        while (rs.next()) {
	            String no = rs.getString("CAR_NO");
	%>
	            <option value="<%= no %>" <%= no.equals(carNo) ? "selected" : "" %>>
	                [<%= no %>] <%= rs.getString("CAR_MODEL") %>
	            </option>
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
	        </select>
	        <input type="button" value="조회" onclick="checkForm()">
	    </div>
	</form>
	
	<%
	    /* 차량을 선택해서 조회한 경우에만 주행내역 출력 */
	    if (carNo != null && !carNo.equals("")) {
	%>
	<table class="list">
	    <tr>
	        <th>주행일자</th>
	        <th>출발km</th>
	        <th>도착km</th>
	        <th>운행거리</th>
	        <th>부서명</th>
	        <th>주유금액</th>
	    </tr>
	<%
	        try {
	            Class.forName(driver);
	            con = DriverManager.getConnection(url, user, password);
	
	            String sql = "SELECT d.DRV_DATE, d.DRV_START, d.DRV_END, "
	                       + "       (d.DRV_END - d.DRV_START) AS DISTANCE, "
	                       + "       p.DEPT_NAME, d.DRV_MONEY "
	                       + "FROM TBL_DRIVE d "
	                       + "JOIN TBL_DEPT p ON d.DEPT_CODE = p.DEPT_CODE "
	                       + "WHERE d.CAR_NO = ? "
	                       + "ORDER BY d.DRV_DATE DESC";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, carNo);
	            rs = pstmt.executeQuery();
	
	            while (rs.next()) {
	%>
	    <tr>
	        <td><%= outFmt.format(inFmt.parse(rs.getString("DRV_DATE"))) %></td>
	        <td><%= kmFmt.format(rs.getInt("DRV_START")) %></td>
	        <td><%= kmFmt.format(rs.getInt("DRV_END")) %></td>
	        <td><%= kmFmt.format(rs.getInt("DISTANCE")) %></td>
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
	<%
	    }
	%>