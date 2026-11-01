<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<jsp:include page="header.jsp" />

<section>
<h1>수강신청</h1>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		  con = Util.getConnection();
%>
<form name="f" method="post" action="insertProc.jsp">
<table width="500" border="1">
  <tr height="40">
  	<td align="center" width="120">수강월</td>
  	<td><input type="text" name="regist_month" maxlength="6"> 예) 202203</td>
  </tr>
  <tr height="40">
  	<td align="center">회원명</td>
  	<td>
  	  <select name="c_name" onchange="selMember()">
  	    <option value="">회원명</option>
<%
	      String sql = "select C_NO, C_NAME from TBL_MEMBER order by C_NO";
	      pstmt = con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      while(rs.next()){
%>
  	    <option value="<%= rs.getString(1) %>"><%= rs.getString(2) %></option>
<%
	      }
	      rs.close();
	      pstmt.close();
%>
  	  </select>
  	</td>
  </tr>
  <tr height="40">
  	<td align="center">회원번호</td>
  	<td><input type="text" name="c_no" readonly> 예) 10001 (자동 표시)</td>
  </tr>
  <tr height="40">
  	<td align="center">강의장소</td>
  	<td>
  	  <select name="class_area">
  	    <option value="">강의장소</option>
  	    <option value="서울본원">서울본원</option>
  	    <option value="성남본원">성남본원</option>
  	    <option value="대전본원">대전본원</option>
  	    <option value="부산본원">부산본원</option>
  	    <option value="대구본원">대구본원</option>
  	  </select>
  	</td>
  </tr>
  <tr height="40">
  	<td align="center">강의명</td>
  	<td>
  	  <select name="teacher_code" onchange="calc()">
  	    <option value="">강의신청</option>
<%
	      sql = "select TEACHER_CODE, CLASS_NAME, CLASS_PRICE from TBL_TEACHER order by TEACHER_CODE";
	      pstmt = con.prepareStatement(sql);
	      rs = pstmt.executeQuery();
	      while(rs.next()){
%>
  	    <option value="<%= rs.getString(1) %>" data-price="<%= rs.getInt(3) %>"><%= rs.getString(2) %></option>
<%
	      }
%>
  	  </select>
  	</td>
  </tr>
  <tr height="40">
  	<td align="center">수강료</td>
  	<td><input type="text" name="tuition" readonly> 원</td>
  </tr>
  <tr height="40">
  	<td colspan="2" align="center">
  	  <input type="button" value="수강신청" onclick="check()">
  	  <input type="button" value="다시쓰기" onclick="resetForm()">
  	</td>
  </tr>
</table>
</form>
<%
	} finally {
	  try {
	    if (rs != null) rs.close();
	    if (pstmt != null) pstmt.close();
	    if (con != null) con.close();
	  } catch (Exception e) { e.printStackTrace(); }
	}
%>
</section>
<script>
// 회원명 선택 → 회원번호 자동 표시 + 수강료 재계산
function selMember() {
	var f = document.f;
	f.c_no.value = f.c_name.value;
	calc();
}

// 수강료 계산 (회원번호 20000 이상 50% 할인)
function calc() {
	var f = document.f;
	if (f.c_no.value == "" || f.teacher_code.selectedIndex == 0) {
		f.tuition.value = "";
		return;
	}
	var no = parseInt(f.c_no.value);
	var opt = f.teacher_code.options[f.teacher_code.selectedIndex];
	var price = parseInt(opt.getAttribute("data-price"));
	if (no >= 20000)
		price = price * 0.5;
	f.tuition.value = price;
}

// 유효성 검사
function check() {
	var f = document.f;
	if (f.regist_month.value.trim() == "") {
		alert("수강월이 입력되지 않았습니다!");
		f.regist_month.focus();
		return;
	}
	if (f.c_name.selectedIndex == 0) {
		alert("회원명이 선택되지 않았습니다!");
		f.c_name.focus();
		return;
	}
	if (f.c_no.value == "") {
		alert("회원번호가 입력되지 않았습니다!");
		f.c_no.focus();
		return;
	}
	if (f.class_area.selectedIndex == 0) {
		alert("강의장소가 선택되지 않았습니다!");
		f.class_area.focus();
		return;
	}
	if (f.teacher_code.selectedIndex == 0) {
		alert("강의명이 선택되지 않았습니다!");
		f.teacher_code.focus();
		return;
	}
	if (f.tuition.value == "") {
		alert("수강료가 입력되지 않았습니다!");
		f.tuition.focus();
		return;
	}
	f.submit();
}

// 다시쓰기
function resetForm() {
	var f = document.f;
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	f.reset();
	f.regist_month.focus();
}
</script>
<jsp:include page="footer.jsp"/>
