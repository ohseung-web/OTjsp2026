<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
    
    <%
    
    	Connection con = null;
    	PreparedStatement pstmt = null;
    	try{
    	request.setCharacterEncoding("utf-8");
    	con = Util.getConnection();
    	String day = request.getParameter("day");
    	String cnum = request.getParameter("cnum");
    	String place = request.getParameter("place");
    	String clas = request.getParameter("clas");
    	int pri = Integer.parseInt(request.getParameter("pri"));
    	String sql = "insert into tbl_class_202201 values(?,?,?,?,?)";
    	pstmt = con.prepareStatement(sql);
    	pstmt.setString(1, day);
    	pstmt.setString(2, cnum);
    	pstmt.setString(3, place);
    	pstmt.setInt(4, pri);
    	pstmt.setString(5, clas);
    	int result = pstmt.executeUpdate();
    	
    	if(result > 0){%>
    		<script type="text/javascript">
				alert('강의 신청이 완료 되었습니다.')
				location.href="index.jsp"
			</script>
    	<% }}
    	
    	catch(Exception e){
    		e.printStackTrace();
    	}finally{
    			try{
    				if(pstmt!=null){pstmt.close();}
    				if(con!=null)con.close();}catch(Exception e){
    					e.printStackTrace();
    				}
    	}
    	
    	
    	
    %>
