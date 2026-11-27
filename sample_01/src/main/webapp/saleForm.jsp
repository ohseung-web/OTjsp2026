<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />

<%
    request.setCharacterEncoding("UTF-8");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String nextNo = "00001";   // 자동생성 회원번호
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	
	try {
		  con = Util.getConnection();
	      String sql = "select LPDA(IFNULL(MAX(pk_sale), 0) + 1,5,'0') from tbl_sale";
	      pstmt =con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()){
	    	 nextNo = rs.getString(1);
	      }
%>	
<h2>판매등록</h2>
<form name="frm" action="saleInsertProc.jsp" method="post">
	<table border="1" width="500">
	  <tr height="50">
	    <th width="200">판매번호 (자동발생)</th>    
	    <td width="300"><input type="text" name="pk_sale" value="<%=nextNo %>" readonly></td>
	  </tr>
	  <tr height="50">
	    <th width="200">판매일자 (자동발생)</th>
	    <td width="300"><input type="text" name="deal_date" value="<%=sdf.format(date) %>" readonly></td>
	  </tr>
	  <tr height="50">
	    <th width="200">제과점</th>
	    <td width="300">
	    	<select name="fk_bakery">
	    		<option value="">선택</option>
	    		<option value="A0001">정심당</option>
	    		<option value="A0002">셋쥬루</option>
	    		<option value="A0003">오송빵집</option>
	    		<option value="A0004">코끼리제과</option>
	    	</select>
	    </td>
	  </tr>
	  <tr height="50">
	    <th width="200">제과</th>
	    <td width="300">
	    	<select name="fk_bread">
	    		<option value="">선택</option>
	    		<option value="B0001">대보름빵</option>
	    		<option value="B0002">자라빵</option>
	    		<option value="B0003">코끼리빵</option>
	    		<option value="B0004">찹쌀도너츠</option>
	    		<option value="B0005">고구마빵</option>
	    		<option value="B0006">치즈빵</option>
	    		<option value="B0007">햄빵</option>
	    	</select>
	    </td>
	  </tr>
	  <tr height="50">
	    <th width="200">판매수량</th>
	    <td width="300"><input type="text" name="deal_count"></td>
	  </tr>
	  <tr height="50">
	    <td colspan="2" align="center">
	    	<input type="button" value="등록" onclick="check()">
	    	<input type="button" value="조회" onclick="location.href='saleList.jsp'">
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

<script>
// 유효성 검사
function check() {
	var f = document.frm;
	if (f.fk_bakery.value.trim() == "") {
		alert("제과점을 선택하지 않았습니다!");
		f.fk_bakery.focus();
		return;
	}
	if (f.fk_bread.value.trim() == "") {
		alert("제과를 선택되지 않았습니다!");
		f.fk_bread.focus();
		return;
	}
	if (f.deal_count.value == 0) {
		alert("판매수량을 입력하지 않았습니다!");
		f.deal_count.focus();
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