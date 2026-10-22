<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 상세보기</title>
<link rel="stylesheet" href="style/memberJoin.css">
</head>
<body>
	<h2 align="center">회원 상세 정보</h2>
		<%
			request.setCharacterEncoding("utf-8");
		
			/* 목록에서 ?id=값 으로 넘어온 아이디를 받는다 */
			String id = request.getParameter("id");
		
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
			String user = "root";
			String password = "12345678";
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			//boolean found = false;   // 회원을 찾았는지 여부
		
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
		
				/* 전체가 아니라 해당 아이디 1명만 조회 */
				String sql = "select * from member where id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
		
				/* 결과가 최대 1행이므로 while 대신 if(rs.next()) 사용 */
				if(rs.next()){
					//found = true;
		%>
			<table width="500" border="1" align="center">
				<tr height="50">
					<td width="150" align="center" bgcolor="#eeeeee">아이디</td>
					<td width="350"><%= rs.getString("id") %></td>
				</tr>
				<tr height="50">
					<td align="center" bgcolor="#eeeeee">Email</td>
					<td><%= rs.getString("email") %></td>
				</tr>
				<tr height="50">
					<td align="center" bgcolor="#eeeeee">전화번호</td>
					<td><%= rs.getString("tel") %></td>
				</tr>
				<tr height="50">
					<td align="center" bgcolor="#eeeeee">관심분야</td>
					<td><%= rs.getString("hobby") %></td>
				</tr>
				<tr height="50">
					<td align="center" bgcolor="#eeeeee">직업</td>
					<td><%= rs.getString("job") %></td>
				</tr>
				<tr height="50">
					<td align="center" bgcolor="#eeeeee">연령</td>
					<td><%= rs.getString("age") %></td>
				</tr>
				<tr height="50">
					<td align="center" bgcolor="#eeeeee">남기는 말</td>
					<td><%= rs.getString("info") %></td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center">
						<button onclick="location.href='main.jsp?page=MemberUpdateForm&id=<%=rs.getString("id") %>'">회원수정</button>
						<button onclick="location.href='main.jsp?page=MemberDeleteForm&id=<%=rs.getString("id") %>'">회원삭제</button>
						<button onclick="location.href='main.jsp?page=MemberList'">목록보기</button>
						<button onclick="location.href='main.jsp?page=MemberJoin'">회원가입</button>
					</td>
				</tr>
			</table>
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
		
			/* 해당 아이디가 없을 때 안내 */
			//if(!found){
		%>
			<!-- <p align="center">해당 회원을 찾을 수 없습니다.</p> -->
		<%
			//}
		%>
			<p align="center">
				<a href="main.jsp?page=MemberList">회원 목록으로</a>
			</p>
</body>
</html>