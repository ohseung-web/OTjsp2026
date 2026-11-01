<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />
<section>
<h1>회원정보조회</h1>
<table width="700" border="1">
  <tr height="40" align="center">
  	<td align="center">수강월</td>
  	<td align="center">회원번호</td>
  	<td align="center">회원명</td>
  	<td align="center">강의명</td>
  	<td align="center">강의장소</td>
  	<td align="center">수강료</td>
  	<td align="center">등급</td>
  </tr>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	SimpleDateFormat sfread = new SimpleDateFormat("yyyyMM");// DB 값 읽기용
	SimpleDateFormat sf = new SimpleDateFormat("yyyy년MM월");// 화면 출력용
	
	try {
		  con = Util.getConnection();
	      String sql = "select c.REGIST_MONTH, c.C_NO, m.C_NAME, t.CLASS_NAME, c.CLASS_AREA, c.TUITION, m.GRADE "
	                 + "from TBL_CLASS c, TBL_MEMBER m, TBL_TEACHER t "
	                 + "where c.C_NO = m.C_NO and c.TEACHER_CODE = t.TEACHER_CODE "
	                 + "order by c.REGIST_MONTH, c.C_NO";
	      pstmt =con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      
	      while(rs.next()){
%>
      <tr height="40" align="center">
      	<td align="center"><%= sf.format(sfread.parse(rs.getString(1))) %></td>
      	<td align="center"><%= rs.getString(2) %></td>
      	<td align="center"><%= rs.getString(3) %></td>
      	<td align="center"><%= rs.getString(4) %></td>
      	<td align="center"><%= rs.getString(5) %></td>
      	<td align="center"><%= String.format("₩%,d",  rs.getInt(6)) %></td>
      	<td align="center"><%= rs.getString(7) %></td>
      </tr>  
<%	    	  
	      }
	  
	} finally {
	  try {
	    if (rs != null) rs.close();
	    if (pstmt != null) pstmt.close();
	    if (con != null) con.close();
	  } catch (Exception e) { e.printStackTrace(); }
	}

%>
</table>
</section>
<jsp:include page="footer.jsp"/>
