<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String tel   = request.getParameter("tel");
   		String pw1   = request.getParameter("pw1");
        
        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
        String user = "root";
        String password = "12345678";

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
	    
        String msg = null;
        
        if( pw1 == null || pw1.trim().isEmpty()){
        	msg ="비밀번호를 입력하세요";	
        }else{
        
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(url, user, password);
            
            // 1)비밀번호 확인
            String sql ="select id from member where id=? and pass=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw1);
            rs = pstmt.executeQuery();
            
            if(rs.next()){
	            pstmt.close(); // 조회에 쓴 pstmt를 닫고 update용으로 다시 만든다
	            rs.close();
	            
	            // 2)수정
	            String sql02 = "update member set email=?, tel=? where id=?";
	            pstmt = con.prepareStatement(sql02);
	            pstmt.setString(1, email);
	            pstmt.setString(2, tel);
	            pstmt.setString(3, id);
	            
	            int result = pstmt.executeUpdate();
	            System.out.println("여기까지 왔을까"+result);
	            
	            if(result > 0){
	            	msg ="업데이트 성공!";
	            }else{
	            	msg ="수정실패";
	            }
            }else{
            	msg ="비밀번호를 확인하세요!";
            }     
          
        }catch(Exception e){
            e.printStackTrace();
            msg = "DB 오류 " ;
        }finally{
            if (rs != null)    { try { rs.close(); }    catch (Exception e) {} }
            if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }
            if (con != null)   { try { con.close(); }   catch (Exception e) {} }
        }
       } 
    %>
            <script type="text/javascript">
			    alert("<%= msg %>");
			    location.href = "main.jsp?page=MemberList";
			</script>
</body>
</html>