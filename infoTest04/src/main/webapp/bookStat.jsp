<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.DecimalFormat"%>
<%@ page import ="DBPKG.Util" %>
<jsp:include page="header.jsp"/>
<h2>도서별 대출실적</h2>
<table class="list">
  <tr><th>도서코드</th><th>도서명</th><th>대출건수</th><th>총대출료</th></tr>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	String sql = "select b.BOOK_CODE, b.BOOK_NAME, count(r.R_NO) cnt, ifnull(sum(r.FEE),0) total "
	           + "from TBL_BOOK_202301 b left join TBL_RENT_202301 r on b.BOOK_CODE = r.BOOK_CODE "
	           + "group by b.BOOK_CODE, b.BOOK_NAME order by total desc, b.BOOK_CODE";
	try (Connection con = Util.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
		while (rs.next()) {
%>
  <tr>
    <td class="c"><%=rs.getString("BOOK_CODE")%></td>
    <td class="r"><%=rs.getString("BOOK_NAME")%></td>
    <td class="c"><%=rs.getInt("cnt")%>건</td>
    <td class="r">₩<%=df.format(rs.getInt("total"))%></td>
  </tr>
<%
		}
	} catch (Exception e) { e.printStackTrace(); }
%>
</table>
<jsp:include page="footer.jsp"/>
