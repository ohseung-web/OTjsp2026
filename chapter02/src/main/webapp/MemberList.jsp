<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import ="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록 전체 보기</title>
<link rel="stylesheet" href="style/memberJoin.css">
</head>
<body>
	<h2 align="center">가입한 회원 목록</h2>
		<%
			/* DB 접속 정보 (회원가입 처리 페이지와 동일하게) */
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
			String user = "root";
			String password = "12345678";
		
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int count = 0;   // 회원 수를 세기 위한 변수
		%>
			<table width="800" border="1" align="center">
				<tr height="40" align="center" bgcolor="#eeeeee">
					<td>번호</td>
					<td>아이디</td>
					<td>이메일</td>
					<td>전화번호</td>
					<td>관심분야</td>
					<td>직업</td>
					<td>연령</td>
					<td>남기는 말</td>
					<td>상세보기</td>   <%-- ★ 추가 --%>
				</tr>
		<%
			try{
				Class.forName(driver);
				con = DriverManager.getConnection(url, user, password);
		
				/* 비밀번호(pass)는 화면에 보여주지 않으므로 조회하지 않는다 */
				String sql = "select id, email, tel, hobby, job, age, info from member";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();   // SELECT → executeQuery() → ResultSet 반환
		
				/* rs.next() : 다음 행으로 이동. 행이 있으면 true, 없으면 false
				   → 조회된 회원 수만큼 반복된다 */
				while(rs.next()){
					count++;
		%>
				<tr height="40" align="center">
					<td><%= count %></td>
					<td><%= rs.getString("id") %></td>
					<td><%= rs.getString("email") %></td>
					<td><%= rs.getString("tel") %></td>
					<td><%= rs.getString("hobby") %></td>
					<td><%= rs.getString("job") %></td>
					<td><%= rs.getString("age") %></td>
					<td><%= rs.getString("info") %></td>
					<td><a href="main.jsp?page=MemberDetail&id=<%= rs.getString("id") %>">상세보기</a></td>
					<%-- <td><a href="MemberDetail.jsp?id=<%= rs.getString("id") %>">상세보기</a></td> --%>
				</tr>
		<%
				}   // while 끝
		
				/* 회원이 한 명도 없을 때 안내 */
				if(count == 0){
		%>
				<tr height="40">
					<td colspan="9" align="center">가입한 회원이 없습니다.</td>
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
			<p align="center">
				<a href="main.jsp?page=MemberJoin">회원가입 화면으로</a>   <%-- 실제 폼 파일명으로 수정 --%>
			</p>
</body>
</html>