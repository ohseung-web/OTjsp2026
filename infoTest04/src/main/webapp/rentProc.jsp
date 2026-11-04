<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%
	request.setCharacterEncoding("UTF-8");
	String month = request.getParameter("rent_month");
	String rno   = request.getParameter("r_no");
	String code  = request.getParameter("book_code");
	int days = Integer.parseInt(request.getParameter("rent_days"));
	int fee  = Integer.parseInt(request.getParameter("fee"));
	String msg = "대출신청이 정상적으로 완료되었습니다!";
	String url = "index.jsp";
	try (Connection con = Util.getConnection();
	     PreparedStatement ps = con.prepareStatement(
	       "insert into TBL_RENT_202301 (RENT_MONTH, R_NO, BOOK_CODE, RENT_DAYS, FEE) values (?,?,?,?,?)")) {
		ps.setString(1, month); ps.setString(2, rno); ps.setString(3, code);
		ps.setInt(4, days);     ps.setInt(5, fee);
		ps.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
		msg = "대출신청에 실패했습니다. (같은 달에 이미 신청한 회원일 수 있습니다)";
		url = "rentForm.jsp";
	}
%>
<script>
	alert("<%=msg%>");
	location.href = "<%=url%>";
</script>
