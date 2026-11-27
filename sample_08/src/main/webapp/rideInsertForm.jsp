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
	      String sql = "select IFNULL(MAX(pk_ride), 0) + 1 from tbl_ride";
	      pstmt =con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()){
	    	 nextNo = rs.getInt(1);
	      }
%>	
<jsp:include page="header.jsp" />
<aside>
	<ul>
		<li><a href="rideList.jsp">놀이기구 현황</a></li>
		<li><a href="rideInsertForm.jsp">놀이기구 등록</a></li>
	</ul>
</aside>
<section>
	<h2>놀이기구 등록</h2>
	<form action="rideInsertProc.jsp" name="frm" method="post">
		<table border="1" width="500">
		  <tr height="50">
		    <th width="200">놀이기구코드 (자동발생)</th>    
		    <td width="300"><input type="text" name="pk_ride" value="<%=nextNo %>" readonly></td>
		  </tr>
		  <tr height="50">
		    <th width="200">놀이기구이름</th>
		    <td width="300"><input type="text" name="name"></td>
		  </tr>
		  <tr height="50">
		    <th width="200">이용료</th>
		    <td width="300"><input type="number" name="price"></td>
		  </tr>
		  <tr height="50">
		    <th width="200">이용가능등급</th>
		    <td width="300">
		    	<label><input type="radio" name="grade" value="전체"> 전체 가능</label><br/>
		    	<label><input type="radio" name="grade" value="어린이"> 어린이 이상 가능(8살 ~ 14살)</label><br/>
		    	<label><input type="radio" name="grade" value="청소년"> 청소년 이상 가능(15살 ~ 19살)</label><br/>
		    	<label><input type="radio" name="grade" value="성인"> 성인 이상 가능(20살 이상)</label>
		    </td>
		  </tr>
		  <tr height="50">
		    <td colspan="2" align="center">
		    	<input type="button" value="등록" onclick="check()">
		    	<input type="button" value="조회" onclick="location.href='rideList.jsp'">
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
		alert("놀이기구 이름을 입력하지 않았습니다!");
		f.name.focus();
		return;
	}
	if (f.price.value == 0) {
		alert("이용료를 입력하지 않았습니다!");
		f.price.focus();
		return;
	}
	if (f.grade.value.trim() == "") {
		alert("이용가능 등급을 선택되지 않았습니다!");
		f.grade.focus();
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