<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<%
	// 인코딩
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	
	// 대출신청, 메시지 체크 변수
	boolean msgChk = false;
	
	// rentForm 에서 가져온 데이터
	String rentMonth = request.getParameter("rentMonth");
	String rNo = request.getParameter("rNo");
	String bookCode = request.getParameter("bookCode");
	Integer rentDays = Integer.parseInt(request.getParameter("rentDays"));
	Integer fee = Integer.parseInt(request.getParameter("fee"));
	
	try{
		con = Util.getConnection();
		// Sql문 작성
		String sql = "insert into TBL_RENT_202301 values (?,?,?,?,?)";
		// pstmt 선언
		pstmt = con.prepareStatement(sql);
		// ?에 대입
		pstmt.setString(1, rentMonth);
		pstmt.setString(2, rNo);
		pstmt.setString(3, bookCode);
		pstmt.setInt(4, rentDays);
		pstmt.setInt(5, fee);
		
		// 1이면 실행 / 0이면 실패
		// 0보다 크면 msgChk는 true 값 가짐
		msgChk = pstmt.executeUpdate() > 0;
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		}catch(Exception e){e.printStackTrace();}
	}
%>
<%-- msgChk가 true면 도서대출 성공 / false면 도서대출 실패 --%>
<script>
<%	if(msgChk){ %>
		alert("대출신청이 정상적으로 완료되었습니다!");
		location.href="index.jsp";
<% }else {%>
		alert('');
		history.go(-1);
<% } %>
}
</script>
