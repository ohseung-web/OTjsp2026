<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.DecimalFormat, DBPKG.Util"%>
<%
	request.setCharacterEncoding("UTF-8");
	String grade = request.getParameter("grade");
	if (grade == null) grade = "";
%>
<jsp:include page="header.jsp"/>
<h2>대출현황조회</h2>
<div class="c" style="margin-bottom:10px;">
  등급 :
  <!-- onchange ④ 등급 선택 -> 해당 등급만 조회 -->
  <select name="grade" onchange="location.href='readerList.jsp?grade=' + encodeURIComponent(this.value)">
    <option value=""     <%=grade.equals("")     ? "selected" : ""%>>전체</option>
    <option value="일반" <%=grade.equals("일반") ? "selected" : ""%>>일반</option>
    <option value="우수" <%=grade.equals("우수") ? "selected" : ""%>>우수</option>
  </select>
</div>
<table class="list">
  <tr><th>대출월</th><th>회원번호</th><th>회원명</th><th>도서명</th><th>대출일수</th><th>대출료</th><th>등급</th></tr>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	String sql = "select r.RENT_MONTH, r.R_NO, m.R_NAME, b.BOOK_NAME, r.RENT_DAYS, r.FEE, m.GRADE "
	           + "from TBL_RENT_202301 r "
	           + "join TBL_READER_202301 m on r.R_NO = m.R_NO "
	           + "join TBL_BOOK_202301 b on r.BOOK_CODE = b.BOOK_CODE ";
	if (!grade.equals("")) sql += "where m.GRADE = ? ";
	sql += "order by r.RENT_MONTH, r.R_NO";
	try (Connection con = Util.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
		if (!grade.equals("")) ps.setString(1, grade);
		try (ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				String m = rs.getString("RENT_MONTH");
%>
  <tr class="c">
    <td><%=m.substring(0,4)%>년<%=m.substring(4,6)%>월</td>
    <td><%=rs.getString("R_NO")%></td>
    <td><%=rs.getString("R_NAME")%></td>
    <td><%=rs.getString("BOOK_NAME")%></td>
    <td><%=rs.getInt("RENT_DAYS")%>일</td>
    <td>₩<%=df.format(rs.getInt("FEE"))%></td>
    <td><%=rs.getString("GRADE")%></td>
  </tr>
<%
			}
		}
	} catch (Exception e) { e.printStackTrace(); }
%>
</table>
<jsp:include page="footer.jsp"/>
