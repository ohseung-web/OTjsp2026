<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection con = null;
		try{
			request.setCharacterEncoding("UTF-8");
		 con = Util.getConnection();
			String month = request.getParameter("month");
			String Rcode = request.getParameter("Rcode");
			String code = request.getParameter("code");
			int date = Integer.parseInt(request.getParameter("date")) ;
			int pri = Integer.parseInt(request.getParameter("pri"));
			
			String sql = "insert into TBL_RENT_202301 (RENT_MONTH,R_NO,BOOK_CODE,RENT_DAYS,FEE) values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, month);
			pstmt.setString(2, Rcode);
			pstmt.setString(3, code);
			pstmt.setInt(4, date);
			pstmt.setInt(5, pri);
			int result = pstmt.executeUpdate();
			
			if(result > 0){%>
		    <script>
		        alert("도서 대출 신청이 완료되었습니다.");
		        location.href = "index.jsp";
		    </script>
		<%}
			
		}catch(Exception e){
			e.printStackTrace();%>
		    <script>
	        alert("대출 신청에 실패했습니다.");
	        history.go(-1);
	    </script>
		<%}finally{
			try{if(pstmt != null)pstmt.close();
			if(rs != null)rs.close();
			if(con != null)con.close();}
			catch(Exception e){
				e.printStackTrace();
			}
		}%>