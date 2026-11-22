<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ page import="DBPKG.Util" %>

	<h2>대출신청</h2>
	<form action="rentProc.jsp" method="post" name="rentForm">
	<table class="list">
		<tr>
			<th><label for="rentMonth">대출월</label></th>
			<td>
				<input type="text" name="rentMonth" id="rentMonth"> <p>예) 202305</p>
			</td>
		</tr>
		<tr>	
			<th><label for="rName">회원명</label></th>
			<td>
				<select name="rName" id="rName" onchange="changeRno()">
					<option value="" >회원명 선택</option>
	
<%
	request.setCharacterEncoding("utf-8");
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection con = null;
	
	try {
		con = Util.getConnection();
		String sql = "SELECT R_NAME, R_NO, GRADE FROM TBL_READER_202301";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
%>		
					
					<option value="<%=rs.getString("R_NO")%>" ><%=rs.getString("R_NAME") %></option>								
			
	<%	}  %>
	
	
				</select>
			</td>
			</tr>
			<tr>
			<th><label for="rNo">회원번호</label></th>
			<td>
				<input type="text" name="rNo" id="rNo" value="" readonly><p>예 10001(자동)</p>
			</td>
			</tr>
			<tr>
			<th><label for="bookName">도서명</label></th>
			<td>
				<select name="bookName" id="bookName" onchange="changeBookCode()">
					<option value="">도서명 선택</option>

<%				
	

	String bSql = "SELECT BOOK_CODE, BOOK_NAME, DAY_FEE FROM TBL_BOOK_202301";
	pstmt = con.prepareStatement(bSql);
	rs = pstmt.executeQuery();				

	while(rs.next()) {
        String code = rs.getString("BOOK_CODE");
        int fee = rs.getInt("DAY_FEE");
	%>
    	<!-- value에 코드와 대여료를 | 로 연결 -->
    	<option value="<%=code%>|<%=fee%>"><%=rs.getString("BOOK_NAME")%></option>        
	<%  } %>
	
				</select>
			</td>
			</tr>
			<tr>
			<th><label for="bookCode">도서코드</label></th>
			<td>
				<input type="text" name="bookCode" id="bookCode" readonly>
			</td>
			</tr>
			<tr>
			<th><label for="rentDays">대출일수</label></th>
			<td>
				<select name="rentDays" id="rentDays" onchange="changeFee()">
					<option value="">대출일수 선택</option>
					<option value="7">7일</option>
					<option value="14">14일</option>
					<option value="21">21일</option> 
				</select>
			</td>
			</tr>
			<tr>
			<th><label for="fee">대출료</label></th>
			
			<td>
				\<input type="text" name="fee" id="fee">원 (자동계산)
			</td>
			</tr>
			<tr>			
			<td colspan="2">
				<input type="submit" value="대출신청" onclick="chkForm()">
				<input type="reset" value="다시쓰기" onclick="resetForm()">				
			</td>
			
		</tr>	
	
	
	</table>
	</form>
	
	
	
	
	
	<%
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (con != null) con.close();
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


%>	

 
	
<script type="text/javascript">
	let rNo = 0;
	function changeRno(){
		let rName = document.getElementById("rName");
		rNo = document.getElementById("rNo");		
		rNo.value = rName.value;
		changeFee();
	}
	
	function changeBookCode() {
	    let bookName = document.getElementById("bookName");     
	    let bookCode = document.getElementById("bookCode");
	    
	    if (bookName.value) {	        
	        let parts = bookName.value.split("|");
	        bookCode.value = parts[0]; // 도서코드
	    } else {
	        bookCode.value = "";
	    }
	    
	    changeFee();
	}
	
	function changeFee() {
	    let bookSelect = document.getElementById("bookName");
	    let rentDays = document.getElementById("rentDays");
	    let fee = document.getElementById("fee");
	    
	    if (bookSelect.value && rentDays.value) {
	        let parts = bookSelect.value.split("|");
	        let dayFee = parseInt(parts[1]);
	        let days = parseInt(rentDays.value);
	        console.log("dayFee요 : " + dayFee);
	        console.log("dayFee요 : " + days);
			if(rNo >= 20000) {
				fee.value = days*dayFee*0.7
			} else {
				fee.value = days*dayFee;	
			}
	    } else {
	        fee.value = "";
	    }
	}
	
	function chkForm () {
		let formChk = document.rentForm			
		
		if(formChk.rentMonth.value == "") {
			alert("대출월이 비었습니다.")
			formChk.rentMonth.focus()
			return;
		}
		if(formChk.rName.value == "") {
			alert("회원명이 비었습니다.")
			formChk.rName.focus()
			return;
		}
		if(formChk.rNo.value == "") {
			alert("회원번호가 비었습니다.")
			formChk.rNo.focus()
			return;
		}
		if(formChk.bookName.value == "") {
			alert("도서명이 비었습니다.")
			formChk.bookName.focus()
			return;
		}
		if(formChk.bookCode.value == "") {
			alert("도서코드가 비었습니다.")
			formChk.bookCode.focus()
			return;
		}
		if(formChk.rentDays.value == "") {
			alert("대출일수가 비었습니다.")
			formChk.rentDays.focus()
			return;
		}
		if(formChk.fee.value == "") {
			alert("대출료가 비었습니다.")
			formChk.fee.focus()
			return;
		}
		
		formChk.submit();
		
	}
	
	function resetForm() {
		let form = document.rentForm;
		alert("정보를 지우고 처음부터 다시 입력합니다.")		
		form.reset();
		form.rentMonth.focus();
		
	}
</script>