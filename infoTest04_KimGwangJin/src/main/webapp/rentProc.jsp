<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="DBPKG.Util" %>




	
<%
	request.setCharacterEncoding("utf-8");
		
	PreparedStatement pstmt = null;
	Connection con = null;
	
	String rentMonth = request.getParameter("rentMonth");
	String rName = request.getParameter("rName");
	String rNo = request.getParameter("rNo");
	String bookName = request.getParameter("bookName");
	String bookCode = request.getParameter("bookCode");
	String rentDays = request.getParameter("rentDays");
	String fee = request.getParameter("fee");	
	String msg = "";
	
	
	try {
		con = Util.getConnection();
		String sql = "INSERT INTO TBL_RENT_202301 VALUE(?, ?, ?, ?, ?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, rentMonth);
		pstmt.setString(2, rNo);
		pstmt.setString(3, bookCode);
		pstmt.setInt(4, Integer.parseInt(rentDays));
		pstmt.setInt(5, Integer.parseInt(fee));	
		
		pstmt.executeUpdate();
		
		msg = "대출신청이 정상적으로 완료되었습니다.";	
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (con != null) con.close();			
			if (pstmt != null) pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


%>	


<script type="text/javascript">
<% if (msg != "") { %>
	alert("<%=msg%>");
	location.href="index.jsp";
<%} else { %>
	alert("에러발생");

<% } %>

</script>
 
	
