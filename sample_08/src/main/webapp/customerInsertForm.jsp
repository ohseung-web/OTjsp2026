<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.*"%>

<%
    request.setCharacterEncoding("UTF-8");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int nextNo = 1;   // 자동생성 회원번호

	try {
		  con = Util.getConnection();
	      String sql = "select IFNULL(MAX(pk_customer), 0) + 1 from tbl_customer";
	      pstmt =con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()){
	    	 nextNo = rs.getInt(1);
	      }
%>	
<jsp:include page="header.jsp" />
<aside>
	<ul>
		<li><a href="customerList.jsp">고객현황</a></li>
		<li><a href="customerInsertForm.jsp">고객등록</a></li>
	</ul>
</aside>
<section>
	<h2>고객등록</h2>
	<form action="customerInsertProc.jsp" name="frm" method="post">
		<table border="1" width="500">
		  <tr height="50">
		    <th width="200">고객코드 (자동발생)</th>    
		    <td width="300"><input type="text" name="pk_customer" value="<%=nextNo %>" readonly></td>
		  </tr>
		  <tr height="50">
		    <th width="200">고객이름</th>
		    <td width="300"><input type="text" name="name"></td>
		  </tr>
		  <tr height="50">
		    <th width="200">고객나이</th>
		    <td width="300"><input type="number" name="age">세</td>
		  </tr>
		  <tr height="50">
		    <th width="200">자유이용권</th>
		    <td width="300">
		    	<label><input type="radio" name="free_pass" value="N"> 있음</label>
		    	<label><input type="radio" name="free_pass" value="Y"> 없음</label>
		    </td>
		  </tr>
		  <tr height="50">
		    <td colspan="2" align="center">
		    	<input type="button" value="등록" onclick="check()">
		    	<input type="button" value="조회" onclick="location.href='customerList.jsp'">
		    </td>
		  </tr>
		</table>
	</form>

<%
	}catch(Exception e){
	  e.printStackTrace();
	}finally {
	    try {
	        if (rs != null) rs.close();
	        if (pstmt != null) pstmt.close();
	        if (con != null) con.close();
	      } catch (Exception e) { e.printStackTrace(); }
}
%>
</section>

<script>
// 유효성 검사
function check() {
	var f = document.frm;
	if (f.name.value.trim() == "") {
		alert("고객이름을 입력하지 않았습니다!");
		f.name.focus();
		return;
	}
	if (f.age.value == 0) {
		alert("고객나이를 입력하지 않았습니다!");
		f.age.focus();
		return;
	}
	if (f.free_pass.value.trim() == "") {
		alert("자유이용권 여부를 선택되지 않았습니다!");
		f.free_pass.focus();
		return;
	}

	f.submit();
 }
 
//다시쓰기
/* function resetForm() {
	var f = document.f;
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	f.reset();
	f.regist_month.focus();
} */
 
</script>

<jsp:include page="footer.jsp" />