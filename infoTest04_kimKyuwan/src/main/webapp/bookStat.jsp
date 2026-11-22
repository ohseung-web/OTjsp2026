<%@page import="DBPKG.Util"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section>
	<h2>도서별 대출실적</h2>
	<table class="list c">
		<tr>
			<th>도서코드</th>
			<th>도서명</th>
			<th>대출건수</th>
			<th>총대출료</th>
		</tr>
		<%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			DecimalFormat de = new DecimalFormat("￦#,##0");
		
			try{
				con = Util.getConnection();
				
				String sql = "select b.BOOK_CODE, b.BOOK_NAME, count(*), SUM(r.FEE) as sumFee "
						+"from  tbl_book_202301 b "
						+"inner join tbl_rent_202301 r on b.BOOK_CODE = r.BOOK_CODE "
						+"group by b.BOOK_CODE "
						+"order by sumFee desc ";
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					out.print("<tr>");
					out.print("<td>" + rs.getString(1) +"</td>");
					out.print("<td class='r'>" + rs.getString(2) +"</td>");
					out.print("<td>" + rs.getInt(3) +"건</td>");
					out.print("<td class='r'>" + de.format(rs.getInt(4)) +"</td>");			
					out.print("</tr>");
				}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
					if(con!=null) con.close();
					if(pstmt!=null) pstmt.close();
					if(rs!=null) rs.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
		%>
	</table>
</section>