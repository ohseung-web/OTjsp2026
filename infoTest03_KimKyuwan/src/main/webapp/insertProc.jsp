<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String REGIST_MONTH = request.getParameter("REGIST_MONTH");
	String C_NAME = request.getParameter("C_NAME");
	String C_NO = request.getParameter("C_NO");
	String CLASS_AREA = request.getParameter("CLASS_AREA");
	String CLASS_NAME = request.getParameter("CLASS_NAME");
	String CLASS_PRICE = request.getParameter("CLASS_PRICE");
	String TEACHER_CODE = "";
	
	try{
		con = Util.getConnection();
		
		String sql = "select TEACHER_CODE from TBL_TEACHER_202201 where CLASS_NAME=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, CLASS_NAME);
		
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			TEACHER_CODE = rs.getString(1);
		}
		
		pstmt.close();
		rs.close();
		
		sql = "insert into TBL_CLASS_202201 values (?, ?, ?, ?, ?) ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, REGIST_MONTH);
		pstmt.setString(2, C_NO);
		pstmt.setString(3, CLASS_AREA);
		pstmt.setInt(4, Integer.parseInt(CLASS_PRICE));
		pstmt.setString(5, TEACHER_CODE);
		
		pstmt.executeUpdate();
		
		out.print("<script type='text/javascript'>");
		out.print("alert('수강신청이 정상정으로 완료되었습니다!');");
		out.print("location.href='index.jsp';");
		out.print("</script>");
		
	}catch(Exception e){
		e.printStackTrace();
		System.out.print("insert 실패");
	}finally{
		try{
			if(con!=null) con.close();
			if(pstmt!=null) pstmt.close();
			if(rs!=null) rs.close();
		}catch(Exception e){e.printStackTrace();}
	}
	
	%>
</body>
</html>