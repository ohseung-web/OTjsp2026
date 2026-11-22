<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
%>
<h2>대출신청</h2>
<form action="rentProc.jsp" method="post" name="bform">
	<table class="list">
		<tr>
			<th>대출월</th>
			<td>
				<input type="text" name="rentMonth"/> 예)202305
			</td>
		</tr>
		<tr>
			<th>회원명</th>
			<td>
				<select name="rName" onchange="setMember(this.form)">
					<option value="none">회원명 선택</option>
					<%
						try{
							con = Util.getConnection();
							String sql = "select * from TBL_READER_202301";
							pstmt = con.prepareStatement(sql);
							rs = pstmt.executeQuery();
							while(rs.next()){
					%>
						<option value = "<%= rs.getString("R_NO")%>"><%= rs.getString("R_NAME") %></option>
					<%			
							}
							rs.close();
							pstmt.close();
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th>회원번호</th>
			<td>
				<input type="text" name="rNo" readonly/>
			</td>
		</tr>
		<tr>
			<th>도서명</th>
			<td>
				<select name = "bookName" onchange="setBookCode(this.form)">
					<option value="none">도서명 선택</option>
					<%
							String sql02="select * from TBL_BOOK_202301";
							pstmt=con.prepareStatement(sql02);
							rs=pstmt.executeQuery();
							while(rs.next()){
					%>
							<option value = "<%= rs.getString("BOOK_CODE") %>"><%= rs.getString("BOOK_NAME")%></option>					
					<%			
							}
						}catch(Exception e){
							e.printStackTrace();
						}finally{
							try{
								if(rs!=null) rs.close();
								if(pstmt!=null) pstmt.close();
								if(con!=null) con.close();
							}catch(Exception e){e.printStackTrace();}
						}
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th>도서코드</th>
			<td>
				<input type="text" name="bookCode" readonly/>
			</td>
		</tr>
		<tr>
			<th>대출일수</th>
			<td>
				<input type="text" name="rentDays" onchange="setFee(f)"/>
			</td>
		</tr>
		<tr>
			<th>대출료</th>
			<td>
				<input type="text" name="fee" readonly/>
			</td>
		</tr>
		<tr>
			<td class="c" colspan="2">
				<input type="button" onclick="checkForm()" value="대출신청"/>
				<input type="reset" onclick="reWrite()" value="다시쓰기"/>
			</td>
		</tr>
	</table>
</form>

<%-- 예외처리 --%>

<script>
	<%-- 다시쓰기 예외처리 --%>
	function reWrite(){
		let f = document.bform;
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		f.reset();
		f.rentMonth.focus();
		return;
	}
	<%-- 대출신청 예외처리 --%>
	function checkForm(){
		let f = document.bform;
		if(f.rentMonth.value==""){
			alert("대출월을 입력하지 않았습니다.");
			f.rentMonth.focus();
			return;
		}
		if(f.rName.value=="none"){
			alert("회원명을 선택하지 않았습니다.");
			return;
		}
		if(f.bookName.value=="none"){
			alert("도서명을 선택하지 않았습니다.");
			return;
		}
		if(f.rentDays.value==""){
			alert("대출일수를 입력하지 않았습니다.");
			f.rentDays.focus();
			return;
		}
	}
	
	<%-- 회원코드 자동으로 입력--%>
	function setMember(f){
		f.rNo.value = f.rName.value;
	}
	<%-- 도서코드 자동으로 입력 --%>
	function setBookCode(f){
		f.bookCode.value = f.bookName.value;
	}
	<%-- 대출료 자동계산 --%>
	function setFee(f){
		var no = parseInt(f.r_no.value);
		var fee = dayFee * days;
		if (no >= 20000) fee = fee * 0.7;
		f.fee.value = fee;
	}

</script>
