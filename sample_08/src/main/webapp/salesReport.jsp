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
    
    DecimalFormat df = new DecimalFormat("￦#,##0원");
    
    try{
    	con = Util.getConnection();
    	String sql = "select u.usage_date, "
    			 + " sum(case when c.free_pass = 'Y' then 0 "
    			 + "          when c.age <= 14 then r.price * 0.5 "
    			 + "          when c.age <= 19 then r.price * 0.8 "
    			 + "          else r.price end) as totalPrice "
    			 + " from tbl_usage u "
    			 + " inner join tbl_customer c on u.fk_customer = c.pk_customer "
    			 + " inner join tbl_ride r on u.fk_ride = r.pk_ride "
    			 + " group by u.usage_date "
    			 + " order by u.usage_date";
    	pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery();
 %>   	
<jsp:include page="header.jsp" />
<aside>
	<ul>
		<li><a href="salesReport.jsp">이용일자별 매출현황</a></li>
		<li><a href="customerReport.jsp">고객별 매출현황</a></li>
		<li><a href="rideReport.jsp">놀이기구별 매출현황</a></li>
	</ul>
</aside>
<section>
	<h2>이용일자별 매출현황</h2>
	<table border="1" width="300">
		<tr height="40">
			<th width="150">이용일자</th>
			<th width="150">매출금액</th>
		</tr>
<%
    	while(rs.next()){
 %>
		<tr height="40">
			<td width="100" align="center"><%= rs.getString(1) %></td>
			<td width="150" align="right"><%= df.format(rs.getInt(2)) %></td>
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