<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>  
<%@ include file="db_conn.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css">
</head>
<body>
	<%
	// DB연결
		/* Connection con = null;
		PreparedStatement pstmt = null;
		
		ResultSet rs = null; 

		// DB 접속 정보 설정
	    String driver = "com.mysql.cj.jdbc.Driver"; // JDBC 드라이버
	    // DB URL (jspdb는 데이터베이스 이름)
	    String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; 
	    String user = "root";     // DB 계정 아이디
	    String password = "12345678"; // DB 계정 비밀번호 */
	    
	    SimpleDateFormat insdf = new SimpleDateFormat("yyyyMMdd"); 
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd"); 
	    
     %>
	
			<table width="700" border="1" id="carT">
				<tr height="40" align="center" bgcolor="#eeeeee">
					<td>차량번호</td>
					<td>모델</td>
					<td>제조사</td>
					<td>구매일</td>
				</tr>
		
	<% 
	   try{
			// 드라이버 로딩
			Class.forName(driver);
			// DB연결
			con = DriverManager.getConnection(url, user, password);
			
	   	    String sql = "select * from TBL_CAR ";
	   	    pstmt = con.prepareStatement(sql);
	   	    rs = pstmt.executeQuery();
	   	    
	   	    while(rs.next()){
	%>
	       <tr height="40" align="center">
					<td><%= rs.getString("CAR_NO") %></td>
					<td><%= rs.getString("CAR_MODEL") %></td>
					<td><%= rs.getString("CAR_COMPANY") %></td>
					<!-- 
					     핵심: format()은 Date를 받고, DB 값은 String이기 때문
					     parse()  :	String → Date	"20230101" → Date 객체
					     format() :	 Date → String	Date 객체 → "2023년01월01일"
					 -->
					<td><%= sdf.format(insdf.parse(rs.getString("CAR_DATE"))) %></td>
			</tr>
	 <%
				}
			}catch(Exception e){
				e.printStackTrace();
				out.println("DB fail");
			}finally{
				if (rs != null)    { try { rs.close(); }    catch (Exception e) {} }
				if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
				if (con != null)   { try { con.close(); }   catch (Exception e) {} }
			}
		%>    
	    </table>

</body>
</html>