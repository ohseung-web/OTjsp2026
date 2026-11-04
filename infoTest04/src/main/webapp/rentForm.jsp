<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, DBPKG.Util"%>
<jsp:include page="header.jsp"/>
<script>
// onchange ① 회원명 선택 -> 회원번호 자동 표시
function setReader() {
	var f = document.frm;
	f.r_no.value = f.r_name.value;      // option value = 회원번호
	calc();
}
// onchange ② 도서명 선택 -> 도서코드 자동 표시
function setBook() {
	var f = document.frm;
	f.book_code.value = f.book_name.value;  // option value = 도서코드
	calc();
}
// onchange ③ 대출일수 선택 -> 대출료 자동 계산
function calc() {
	var f = document.frm;
	var no = parseInt(f.r_no.value);
	var days = parseInt(f.rent_days.value);
	var opt = f.book_name.options[f.book_name.selectedIndex];
	if (isNaN(no) || isNaN(days) || f.book_code.value == "") { f.fee.value = ""; return; }
	var fee = parseInt(opt.getAttribute("data-fee")) * days;
	if (no >= 20000) fee = fee * 0.7;     // 우수회원 30% 할인
	f.fee.value = Math.round(fee);
}
function check() {
	var f = document.frm;
	if (f.rent_month.value == "" || !/^[0-9]{6}$/.test(f.rent_month.value)) {
		alert("대출월을 6자리 숫자로 입력하세요. 예) 202305"); f.rent_month.focus(); return false; }
	if (f.r_name.value == "") { alert("회원명을 선택하세요."); f.r_name.focus(); return false; }
	if (f.book_name.value == "") { alert("도서명을 선택하세요."); f.book_name.focus(); return false; }
	if (f.rent_days.value == "") { alert("대출일수를 선택하세요."); f.rent_days.focus(); return false; }
	if (f.fee.value == "") { alert("대출료가 계산되지 않았습니다."); f.rent_days.focus(); return false; }
	f.submit();
}
function resetForm() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
	document.frm.rent_month.focus();
}
</script>
<h2>대출신청</h2>
<form name="frm" method="post" action="rentProc.jsp">
<table class="form">
  <tr><th>대출월</th><td><input type="text" name="rent_month" size="10" maxlength="6"> 예) 202305</td></tr>
  <tr><th>회원명</th><td>
    <select name="r_name" onchange="setReader()">
      <option value="">회원명 선택</option>
<%
	try (Connection con = Util.getConnection(); Statement st = con.createStatement();
	     ResultSet rs = st.executeQuery("select R_NO, R_NAME from TBL_READER_202301 order by R_NO")) {
		while (rs.next()) {
%>
      <option value="<%=rs.getString("R_NO")%>"><%=rs.getString("R_NAME")%></option>
<%		}
	} catch (Exception e) { e.printStackTrace(); }
%>
    </select></td></tr>
  <tr><th>회원번호</th><td><input type="text" name="r_no" size="10" readonly> 예) 10001 (자동)</td></tr>
  <tr><th>도서명</th><td>
    <select name="book_name" onchange="setBook()">
      <option value="" data-fee="0">도서명 선택</option>
<%
	try (Connection con = Util.getConnection(); Statement st = con.createStatement();
	     ResultSet rs = st.executeQuery("select BOOK_CODE, BOOK_NAME, DAY_FEE from TBL_BOOK_202301 order by BOOK_CODE")) {
		while (rs.next()) {
%>
      <option value="<%=rs.getString("BOOK_CODE")%>" data-fee="<%=rs.getInt("DAY_FEE")%>"><%=rs.getString("BOOK_NAME")%></option>
<%		}
	} catch (Exception e) { e.printStackTrace(); }
%>
    </select></td></tr>
  <tr><th>도서코드</th><td><input type="text" name="book_code" size="10" readonly> 예) B01 (자동)</td></tr>
  <tr><th>대출일수</th><td>
    <select name="rent_days" onchange="calc()">
      <option value="">대출일수 선택</option>
      <option value="7">7일</option>
      <option value="14">14일</option>
      <option value="21">21일</option>
    </select></td></tr>
  <tr><th>대출료</th><td><input type="text" name="fee" size="10" readonly> 원 (자동 계산)</td></tr>
  <tr><td colspan="2" class="c">
    <input type="button" value="대출신청" onclick="check()">
    <input type="button" value="다시쓰기" onclick="resetForm()">
  </td></tr>
</table>
</form>
<jsp:include page="footer.jsp"/>
