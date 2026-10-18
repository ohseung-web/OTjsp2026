<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	get방식은 사용자의 정보가 URL에 표시되어 데이터를 한글로 넘갈대 한글 깨짐 현상 방지하는 방법 -->
	
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
   		
   		String job = request.getParameter("job");
   		String age = request.getParameter("age");
   		String info = request.getParameter("info");
   		
   		/* 입력값 검사
		   텍스트 입력창은 비워두고 제출하면 null이 아니라 ""(빈 문자열)로 넘어오기 때문에
		   null과 빈 문자열을 모두 검사해야 한다.
		   체크박스, 라디오 버튼은 선택하지 않으면 null로 넘어온다. */
   		
		   String errorMsg = null;
		   
		   if(id == null || id.isEmpty()){
	   			errorMsg = "아이디를 입력하세요.";
	   		}else if(pass == null || pass.isEmpty()){
	   			errorMsg = "비밀번호를 입력하세요.";
	   		}else if(passchk == null || passchk.isEmpty()){
	   			errorMsg = "비밀번호 확인을 입력하세요.";
	   		}else if(!pass.equals(passchk)){
	   			errorMsg = "비밀번호가 틀립니다.";
	   		}else if(email == null || email.isEmpty()){
	   			errorMsg = "이메일을 입력하세요.";
	   		}else if(phone == null || phone.isEmpty()){
	   			errorMsg = "전화번호를 입력하세요.";
	   		}else if(hobby == null || hobby.length == 0){
	   			errorMsg = "관심분야를 한 개 이상 선택하세요.";
	   		}else if(job == null || job.isEmpty()){
	   			errorMsg = "직업을 선택하세요.";
	   		}else if(age == null){
	   			errorMsg = "연령을 선택하세요.";
	   		}
		   /* 하나라도 걸리면 알림창을 띄우고 이전 페이지로 돌아간다. */
	   		if(errorMsg != null){
	   			
	   	    		
   %>
        <script type="text/javascript">
        	alert("<%= errorMsg %>");
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
					<td width="350">
						<%
							for(int i=0; i<hobby.length; i++){
								out.write(hobby[i]+" ");
							}
						%>
					</td>	
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