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
    String freePass ="";
    
    try{
    	con = Util.getConnection();
    	String sql = "select pk_customer, name, age, free_pass from tbl_customer order by "
    	             +sort+" asc";
    	pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery();
 %>   	
<jsp:include page="header.jsp" />
<aside>
	<ul>
		<li><a href="customerList.jsp">고객현황</a></li>
		<li><a href="customerInsertForm.jsp">고객등록</a></li>
	</ul>
</aside>
<section>
	<h2>고객현황</h2>
	<table border="1" width="500">
		<tr height="40">
			<th width="100"><a href="customerList.jsp?sort=pk_customer">고객코드</a></th>
			<th width="150"><a href="customerList.jsp?sort=name">이름</a></th>
			<th width="100" ><a href="customerList.jsp?sort=age">나이</a></th>
			<th width="150"><a href="customerList.jsp?sort=free_pass">자유이용권</a></th>
		</tr>
<%
    	while(rs.next()){
    		freePass = rs.getString(4);
    		if(freePass.equals("Y")){
    			freePass ="있음";
    		}else{
    			freePass="--";
    		}
    	
 %>
		<tr height="40">
			<td width="100" align="center"><%= rs.getInt(1) %></td>
			<td width="150" align="center"><%= rs.getString(2) %></td>
			<td width="100" align="right"><%= rs.getInt(3) %>세</td>
			<td width="150" align="center"><%= freePass %></td>
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