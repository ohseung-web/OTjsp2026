<%@page import="java.text.DecimalFormat"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sd2 = new SimpleDateFormat("yyyy년MM월");
		DecimalFormat de = new DecimalFormat("￦#,##0");
		
		String grade = request.getParameter("grade");
		if(grade == null || "".equals(grade)) grade = "1";
	%>   
<section>
	<h2>대출현황조회</h2>
	<div class="c" style="margin-bottom: 15px;">
		<span>등급 : </span>
		<select onchange="setgrade()" id="sel">
			<option value="일반" <%=grade.equals("1")? "selected='selected'" : "" %>>일반</option>
			<option value="우수" <%=grade.equals("2")? "selected='selected'" : "" %>>우수</option>
		</select>
	</div>
	<table class="list c">
		<tr>
			<th>대출월</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>도서명</th>
			<th>대출일수</th>
			<th>대출료</th>
			<th>등급</th>
		</tr>
		<%
			
		
			try{
				request.setCharacterEncoding("utf-8");
				con = Util.getConnection();
				
				String sql = "select r.RENT_MONTH, r.R_NO, re.R_NAME, b.BOOK_NAME, r.RENT_DAYS, r.FEE, re.GARDE from  tbl_rent_202301 r " 
						+ "inner join tbl_reader_202301 re on r.R_NO = re.R_NO "
						+ "inner join tbl_book_202301 b on r.BOOK_CODE = b.BOOK_CODE "
						+ "where re.GARDE=?";
				pstmt = con.prepareStatement(sql);
				String ch_grade = Integer.parseInt(grade) == 1?"일반":"우수";
				
				pstmt.setString(1, ch_grade);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					out.print("<tr>");
					out.print("<td>" + sd2.format(sd.parse(rs.getString(1))) +"</td>");
					out.print("<td>" + rs.getString(2) +"</td>");
					out.print("<td>" + rs.getString(3) +"</td>");
					out.print("<td>" + rs.getString(4) +"</td>");
					out.print("<td>" + rs.getInt(5) +"</td>");					
					out.print("<td>" + de.format(rs.getInt(6)) +"</td>");					
					out.print("<td>" + rs.getString(7) +"</td>");					
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
<script type="text/javascript" >
	function setgrade(){
		let s = document.getElementById("sel");
		console.log(s);
		
		if(s.value=="일반") location.href = "index.jsp?section=readerList.jsp?grade=1";
		if(s.value=="우수") location.href = "index.jsp?section=readerList.jsp?grade=2";
	}
</script>