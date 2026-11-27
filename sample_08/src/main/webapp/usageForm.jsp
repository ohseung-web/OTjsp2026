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
	      String sql = "select IFNULL(MAX(pk_usage), 0) + 1 from tbl_usage";
	      pstmt =con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()){
	    	 nextNo = rs.getInt(1);
	      }
%>	
<jsp:include page="header.jsp" />

<section>
	<h2>이용 등록</h2>
	<form action="usageInsertProc.jsp" name="frm" method="post">
		<table border="1" width="700">
		  <tr height="50">
		    <th width="200">이용 코드(자동발생)</th>    
		    <td width="500"><input type="text" name="pk_usage" value="<%=nextNo %>" readonly></td>
		  </tr>
		  <tr height="50">
		    <th width="200">이용일자</th>
		    <td width="500"><input type="date" name="usage_date"></td>
		  </tr>
		  <tr height="50">
		    <th width="200">고객</th>
		    <td width="500">
		    	<select name="fk_customer">
		    		<option value="">선택</option>
		    		<%
		    		   String sql2="select * from tbl_customer";
		    		   pstmt = con.prepareStatement(sql2);
		    		   rs = pstmt.executeQuery();
		    		   
		    		   while(rs.next()){
		    	     %>		   
		    		<option value="<%=rs.getInt(1)%>" data-age="<%=rs.getInt(3)%>">
		    			<%=rs.getString(2)%> (<%=rs.getInt(3)%>세)
		    		</option>
		    			
		    	   <% 		   
		    		   }		   
		    		%>
		    	</select>
		    </td>
		  </tr>
		  <tr height="50">
		    <th width="200">놀이기구</th>
		    <td width="500">
		    	<%
		    		   String sql3="select * from tbl_ride";
		    		   pstmt = con.prepareStatement(sql3);
		    		   rs = pstmt.executeQuery();
		    		   String rank="";
		    	 %>
		    	 <table border="1" width="400">
		    	 	<tr height="30">
		    	 		<th width="120">놀이기구코드</th>
		    	 		<th width="140">이름</th>
		    	 		<th width="140">이용가능등급</th>
		    	 	</tr>
		    	 	<%
		    		   while(rs.next()){
		    			   rank = rs.getString(4);
		    	    		if(rank.equals("전체")){
		    	    			rank ="전체 가능";
		    	    		}else if(rank.equals("청소년")){
		    	    			rank ="청소년 이상 가능";
		    	    		}else if(rank.equals("성인")){
		    	    			rank ="성인 이상 가능";
		    	    		}else{
		    	    			rank="어린이 이상 가능";
		    	    		}
		    	    %>
		    	    <tr height="30" data-grade="<%=rs.getString(4) %>">
		    	    	<td align="center">
		    	    		<label><input type="radio" name="pk_ride" value="<%=rs.getInt(1) %>"><%=rs.getInt(1) %></label><br/>
		    	    	</td>
		    	    	<td align="center"><%=rs.getString(2) %></td>
		    	    	<td align="left"><%=rank%></td>
		    	    </tr>
		    	  <%} %>  
		    	 </table>	
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
	if (f.usage_date.value.trim() == "") {
		alert("이용일자를 선택하지 않았습니다!");
		f.usage_date.focus();
		return;
	}
	if (f.fk_customer.value == 0) {
		alert("고객을 선택하지 않았습니다!");
		f.fk_customer.focus();
		return;
	}
	if (f.pk_ride.value.trim() == "") {
		alert("놀이기구를 선택되지 않았습니다!");
		f.pk_ride.focus();
		return;
	}

	f.submit();
 }
 
</script>

<jsp:include page="footer.jsp" />