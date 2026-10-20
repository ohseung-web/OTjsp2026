<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2> 회원 정보 보기 </h2>
   <%
   		/* post 방식으로 데이터가 넘어갈때 한글 깨질 수 있어 방지하는 코드 */
   		request.setCharacterEncoding("utf-8");
   		/* 각종 사용자로부터 넘어온 데이터를 저장한다. */
   		/* getParameterNames()는 태그안의 name의 모든 값을 순서가 보장되지않는 랜덤한형태로 전달받는다.
   		   사용하면 오히려 복잡해진다.
   		*/
   		String id = request.getParameter("id");
   		String pass = request.getParameter("pass");
   		String passchk = request.getParameter("passchk");
   		String email = request.getParameter("email");
   		String phone = request.getParameter("tel");
   		
   		/* 체크박스는 동시에 여러개를 선택하여 정보를 받아야 하기때문에 String 타입 하나로 받을 수 없다. */
   		/* getParameterValues("hobby")는 name의 이름이 모두 같은 값을 배열형태로 전달받는다. */
   		String[] hobby = request.getParameterValues("hobby");
   		String hobbyOne ="";
   		for(int i=0; i<hobby.length; i++){
   			hobbyOne += hobby[i]+" ";
   		}
   		
   		String job = request.getParameter("job");
   		String age = request.getParameter("age");
   		String info = request.getParameter("info");
   		
   		// DB연결
   		Connection con = null;
   		PreparedStatement pstmt = null;
   		
   		ResultSet rs = null;            // ★ 추가: SELECT 결과를 받을 변수
   		boolean idChk = false;          // ★ 추가: 아이디 중복 여부 (true면 중복)
   	    
   		// DB 접속 정보 설정
   	    String driver = "com.mysql.cj.jdbc.Driver"; // JDBC 드라이버
   	    // DB URL (jspdb는 데이터베이스 이름)
   	    String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false"; 
   	    String user = "root";     // DB 계정 아이디
   	    String password = "12345678"; // DB 계정 비밀번호

   		try{
   			// 드라이버 로딩
   			Class.forName(driver);
   			// DB연결
   			con = DriverManager.getConnection(url, user, password);
   			
   			
   			/* ★ 추가: 중복 아이디 체크
   	       - 입력한 id가 member 테이블에 이미 있는지 조회한다.
   	       - SELECT는 executeQuery()를 쓰고, 결과는 ResultSet으로 받는다. */
	   	    String checkSql = "select id from member where id = ?";
	   	    pstmt = con.prepareStatement(checkSql);
	   	    pstmt.setString(1, id);
	   	    rs = pstmt.executeQuery();
   			
	   	 if(rs.next()){
	         // 조회된 행이 있다 = 이미 같은 아이디가 존재한다
	         idChk = true;
	     }else{
	         // 조회된 행이 없다 = 사용 가능한 아이디 → INSERT 진행
	         pstmt.close();   // 조회에 쓴 pstmt를 닫고 INSERT용으로 다시 만든다
   			
   			// SQL 작성
   			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
   			pstmt = con.prepareStatement(sql);
   			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			pstmt.setString(5, hobbyOne);
			pstmt.setString(6, job);
			pstmt.setString(7, age);
			pstmt.setString(8, info);
			
			int result = pstmt.executeUpdate(); // insert 성공시 1반환
			
			if(result > 0) {
				out.println("회원가입 성공");
			}else{
				out.println("회원가입 실패");
			}
	     }	
   		}catch(Exception e){
   			e.printStackTrace();
   			out.println("DB fail");
   		}finally{
   		// 자원 해제 (열린 순서의 반대로 닫는다)
   		    if (rs != null)    { try { rs.close(); }    catch (Exception e) {} }   // ★ 추가
   		    if (pstmt != null) { try { pstmt.close(); } catch (Exception e) {} }   // ★ 추가
   		    if (con != null)   { try { con.close(); }   catch (Exception e) {} }
   		}
   		
   		/* 입력값 검사
		   텍스트 입력창은 비워두고 제출하면 null이 아니라 ""(빈 문자열)로 넘어오기 때문에
		   null과 빈 문자열을 모두 검사해야 한다.
		   체크박스, 라디오 버튼은 선택하지 않으면 null로 넘어온다. */
   		
		   String msg = null;
		   
		   if(id == null || id.isEmpty()){
			   msg = "아이디를 입력하세요.";
	   		}else if(pass == null || pass.isEmpty()){
	   			msg = "비밀번호를 입력하세요.";
	   		}else if(passchk == null || passchk.isEmpty()){
	   			msg = "비밀번호 확인을 입력하세요.";
	   		}else if(!pass.equals(passchk)){
	   			msg = "비밀번호가 틀립니다.";
	   		}else if(email == null || email.isEmpty()){
	   			msg = "이메일을 입력하세요.";
	   		}else if(phone == null || phone.isEmpty()){
	   			msg = "전화번호를 입력하세요.";
	   		}else if(hobby == null || hobby.length == 0){
	   			msg = "관심분야를 한 개 이상 선택하세요.";
	   		}else if(job == null || job.isEmpty()){
	   			msg = "직업을 선택하세요.";
	   		}else if(age == null){
	   			msg = "연령을 선택하세요.";
	   		}else if(idChk) {
	   			msg ="이미 사용중인 아이디입니다.";
	   		}
		   /* 하나라도 걸리면 알림창을 띄우고 이전 페이지로 돌아간다. */
	   		if(msg != null){
	   			
	   	    		
   %>
        <script type="text/javascript">
        	alert("<%= msg %>");
        	history.go(-1); //이전 페이지로 이동
        </script>
        
  <% }else{ %>
  <!-- 조건을 모두 만족하면 아래 코드 실행되어야 함 -->
  <div class="infoContainer">
  	<table width="400" border="1">
  		<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350"><%= id %></td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">Email</td>
					<td width="350"><%= email %></td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350"><%= phone %></td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">관심분야</td>
					<td width="350"><%= hobbyOne %></td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350"><%= job %></td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">연령</td>
					<td width="350"><%= age %></td>	
				</tr>
				<tr height="50">
					<td width="150" align="center">남기는 말</td>
					<td width="350"><%= info %></td>	
				</tr>
  	</table>
  </div>
  <% } %>	
</body>
</html>