<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <h2>로그인 처리 페이지</h2>

      <%
      	 request.setCharacterEncoding("utf-8");
         // 임의로 DB id, pw를 설정한다.
         String dbid = "aaaa";
         String dbpass ="1234";
         
         // 사용자로부터 넘어온 테디터를 입력 받아줌
         String id = request.getParameter("id");
         String pass = request.getParameter("pass");
         
         if(dbid.equals(id) && dbpass.equals(pass)){
        	 // DB의 데이터가 일치하면 메인 페이지를 보여주어야 함
        	 // "ResponseMain.jsp?id="+id 이부분이 get방식임
        	 // get방식으로 자료를 넘겨주는 이유는 request로 받아온 데이터는 저장되지 않는다.
        	 // 그래서 나중에는 session내장객체를 사용해야 한다.
        	 // pass는 hidden으로 숨겨서 넘겨줘야 한다.
        	 response.sendRedirect("ResponseMain.jsp?id="+id);
         }else{
      %>
         <script type="text/javascript">
         	alert("아이디와 패스워드가 일치하지 않습니다.");
         	history.go(-1); //이전페이지로 이동
         </script>
     <% } %>    
</body>
</html>