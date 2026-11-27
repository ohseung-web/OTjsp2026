<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.*"%>

<%
	request.setCharacterEncoding("utf-8");
 
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
   
    String sort = request.getParameter("sort");
    String rank ="";
    
    try{
    	con = Util.getConnection();
    	String sql = "select pk_ride, name, price, grade from tbl_ride order by "
    	             +sort+" asc";
    	pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery();
    	
    	DecimalFormat df = new DecimalFormat("￦#,##0원");
 %>   	
<jsp:include page="header.jsp" />
<aside>
	<ul>
		<li><a href="rideList.jsp">놀이기구 현황</a></li>
		<li><a href="rideInsertForm.jsp">놀이기구 등록</a></li>
	</ul>
</aside>
<section>
	<h2>놀이기구 현황</h2>
	<table border="1" width="600">
		<tr height="40">
			<th width="150"><a href="rideList.jsp?sort=pk_ride">놀이기구코드</a></th>
			<th width="150"><a href="rideList.jsp?sort=name">이름</a></th>
			<th width="100" ><a href="rideList.jsp?sort=price">이용료</a></th>
			<th width="200"><a href="rideList.jsp?sort=grade">이용가능등급</a></th>
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
		<tr height="40">
			<td width="150" align="center"><%= rs.getInt(1) %></td>
			<td width="150" align="center"><%= rs.getString(2) %></td>
			<td width="100" align="right"><%= df.format(rs.getInt(3)) %></td>
			<td width="200" align="left"><%= rank %></td>
		</tr>
<% }  	
    }catch(Exception e){
    	e.printStackTrace();
    }finally{
    	try{
    		if(pstmt != null) pstmt.close();
    		if(rs != null) rs.close();
    		if(con != null) con.close();
    	}catch(Exception e){e.printStackTrace();}
    }

%>
	</table>
</section>

<jsp:include page="footer.jsp" />