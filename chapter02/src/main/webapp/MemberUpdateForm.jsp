<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
        String user = "root";
        String password = "12345678";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String email = "";
        String tel = "";
        boolean idChk = false;

        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, password);
            
            String sql = "select id, email, tel from member where id=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
                idChk = true;
                email = rs.getString("email");
                tel = rs.getString("tel");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            if (rs != null)    { try { rs.close(); }    catch (Exception e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
            if (con != null)   { try { con.close(); }   catch (Exception e) {} }
        }
    %>
    <h3> 개인 회원정보 수정</h3>
	<form action="MemberUpdateProc.jsp" method="post">
        <!-- 아이디는 수정 불가이므로 화면에는 글자로, 전송은 hidden으로 -->
        <input type="hidden" name="id" value="<%= id %>">
        <table width="400" border="1">
            <tr height="50">
                <td align="center" width="150">아이디</td>
                <td width="250"><%= id %></td>
            </tr>
            <tr height="50">
                <td align="center">이메일</td>
                <td><input type="email" name="email" value="<%= email %>"></td>
            </tr>
            <tr height="50">
                <td align="center">전화</td>
                <td><input type="tel" name="tel" value="<%= tel %>"></td>
            </tr>
            <tr height="50">
                <td align="center">패스워드</td>
                <td><input type="password" name="pw1" placeholder="본인 확인용 비밀번호"></td>
            </tr>
            <tr height="50">
                <td align="center" colspan="2">
                    <input type="submit" value="회원 수정하기">&nbsp;&nbsp;
                    <input type="button" value="회원 전체보기"
                           onclick="location.href='main.jsp?page=MemberList'">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>