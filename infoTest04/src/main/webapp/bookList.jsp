<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.DecimalFormat, DBPKG.Util"%>
<jsp:include page="header.jsp"/>
<h2>도서조회</h2>
<table class="list">
  <tr><th>도서코드</th><th>도서명</th><th>저자</th><th>1일 대출료</th><th>출판일</th></tr>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	try (Connection con = Util.getConnection();
	     Statement st = con.createStatement();
	     ResultSet rs = st.executeQuery("select BOOK_CODE, BOOK_NAME, AUTHOR, DAY_FEE, PUBLISH_DATE from TBL_BOOK_202301 order by BOOK_CODE")) {
		while (rs.next()) {
			String d = rs.getString("PUBLISH_DATE");
			String date = d.substring(0, 4) + "년" + d.substring(4, 6) + "월" + d.substring(6, 8) + "일";
%>
  <tr class="c">
    <td><%=rs.getString("BOOK_CODE")%></td>
    <td><%=rs.getString("BOOK_NAME")%></td>
    <td><%=rs.getString("AUTHOR")%></td>
    <td>₩<%=df.format(rs.getInt("DAY_FEE"))%></td>
    <td><%=date%></td>
  </tr>
<%
		}
	} catch (Exception e) { e.printStackTrace(); }
%>
</table>
<jsp:include page="footer.jsp"/>
