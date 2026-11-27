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
   
    String fpass ="";
    double usaPrice = 0;
    int age = 0;
    
    try{
    	con = Util.getConnection();
    	String sql = "select u.pk_usage, u.usage_date, r.name, r.price, c.age, c.name, c.free_pass from tbl_usage u" 
    			    +" inner join tbl_customer c on u.fk_customer=c.pk_customer"
    			    +" inner join tbl_ride r on r.pk_ride=u.fk_ride"
    			    +" order by u.pk_usage asc";
    	pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery();
    	
    	DecimalFormat df = new DecimalFormat("￦#,##0원");
 %>   	
<jsp:include page="header.jsp" />
<section>
	<h2>이용현황</h2>
	<table border="1" width="800">
		<tr height="40">
			<th width="100">이용내역코드</th>
			<th width="100">이용일자</th>
			<th width="100">놀이기구이름</th>
			<th width="100">이용료</th>
			<th width="100">지출비용</th>
			<th width="100">고객이름</th>
			<th width="100">자유이용권</th>
			<th width="100">삭제</th>
		</tr>
<%
    	while(rs.next()){
            fpass = rs.getString(7);
    		age = rs.getInt(5);
    		
    		if(fpass.equals("Y")){
    			usaPrice = 0.0;
    		}else{
	    		if(age >= 0 && age <= 14){
	    			usaPrice = rs.getInt(4) * 0.5;
	    		}else if(age >= 15 && age <= 19){
	    			usaPrice = rs.getInt(4) * 0.2;
	    		}else{
	    			usaPrice = rs.getInt(4);
	    		}    			
    		}
    	
    		if(fpass.equals("Y")){
    			fpass ="있음";
    		}else{
    			fpass="--";
    		}
 %>
		<tr height="40">
			<td width="100" align="center"><%= rs.getInt(1) %></td>
			<td width="100" align="center"><%= rs.getString(2) %></td>
			<td width="100" align="left"><%= rs.getString(3) %></td>
			<td width="100" align="right"><%= df.format(rs.getInt(4)) %></td>
			<td width="100" align="right"><%= df.format(usaPrice) %></td>
			<td width="100" align="center"><%= rs.getString(6) %></td>
			<td width="100" align="center"><%= fpass %></td>
			<td width="100" align="center"><a href="delProc.jsp?pk_usage=<%=rs.getInt(1) %>">[삭제]</a></td>
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