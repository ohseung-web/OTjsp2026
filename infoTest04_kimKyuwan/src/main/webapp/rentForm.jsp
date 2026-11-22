<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
	%>	
    
<section>
	<h2>대출신청</h2>
	<form action="rentProc.jsp" method="get" name="rform">
		<%	
			try {
				con = Util.getConnection();
	
				String sql = "select BOOK_CODE, DAY_FEE from tbl_book_202301";
				pstmt = con.prepareStatement(sql);
	
				rs = pstmt.executeQuery();
	
				while (rs.next()) {
					out.print("<input hidden value='"+rs.getInt(2)+"' name='"+rs.getString(1)+"'>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (con != null)
				con.close();
					if (pstmt != null)
				pstmt.close();
					if (rs != null)
				rs.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		%>
		<table class="form">
			<tr>
				<th>대출월</th>
				<td>
					<input type="text" name="RENT_MONTH"> 예) 202305
				</td>
			</tr>
			<tr>
				<th>회원명</th>
				<td>
					<select name="R_NAME" onchange="setMember()">
						<option value="">회원명 선택</option>
						<%
							try{
								con = Util.getConnection();
								
								String sql = "select R_NO, R_NAME from tbl_reader_202301";
								pstmt = con.prepareStatement(sql);
								
								rs = pstmt.executeQuery();
								
								while(rs.next()){
									out.print("<option value=" + rs.getString(1) +">" + rs.getString(2) + "</option>");
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
					</select>
				</td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td>
					<input type="text" name="R_NO"> 예) 10001 (자동)
				</td>
			</tr>
			<tr>
				<th>도서명</th>
				<td>
					<select name="BOOK_NAME" onchange="setBook()">
						<option value="">도서명 선택</option>
						<%
							try{
								con = Util.getConnection();
								
								String sql = "select BOOK_CODE, BOOK_NAME from tbl_book_202301";
								pstmt = con.prepareStatement(sql);
								
								rs = pstmt.executeQuery();
								
								while(rs.next()){
									out.print("<option value=" + rs.getString(1) +">" + rs.getString(2) + "</option>");
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
					</select>
				</td>
			</tr>
			<tr>
				<th>도서코드</th>
				<td>
					<input type="text" name="BOOK_CODE"> 예) B01 (자동)
				</td>
			</tr>
			<tr>
				<th>대출일수</th>
				<td>
					<select name="RENT_DAYS" onchange="setFee()">
						<option value="">대출일수 선택</option>
						<option value="7">7일</option>
						<option value="14">14일</option>
						<option value="21">21일</option>					
					</select>
				</td>
			</tr>
			<tr>
				<th>대출료</th>
				<td>
					<input type="text" name="FEE"> 원 (자동 계산)
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="trySubmit()">대출신청</button>
					<button type="button" onclick="doReset()">다시쓰기</button>
				</td>
			</tr>
		</table>
	</form>
</section>

<script type="text/javascript" defer="defer">
	function doReset(){
		let f = document.rform;
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		f.reset();
	}
	function trySubmit(){
		let f = document.rform;
		if(f.RENT_MONTH.value==""){
			alert("대출월 미입력")
			f.RENT_MONTH.focus();
			return;
		}
		if(f.R_NAME.value==""){
			alert("회원명 미선택")
			f.R_NAME.focus();
			return;
		}
		if(f.R_NO.value==""){
			alert("회원번호 미입력")
			f.R_NO.focus();
			return;
		}
		if(f.BOOK_NAME.value==""){
			alert("도서명 미선택")
			f.BOOK_NAME.focus();
			return;
		}
		if(f.BOOK_CODE.value==""){
			alert("도서코드 미입력")
			f.BOOK_CODE.focus();
			return;
		}
		if(f.RENT_DAYS.value==""){
			alert("대출일수 미선택")
			f.RENT_DAYS.focus();
			return;
		}
		if(f.FEE.value==""){
			alert("대출료 미입력")
			f.FEE.focus();
			return;
		}
		f.submit();
	}
	function setMember(){
		let f = document.rform;
		f.R_NO.value = f.R_NAME.value;
	}
	function setBook(){
		let f = document.rform;
		f.BOOK_CODE.value = f.BOOK_NAME.value;
	}
	function setFee(){
		let f = document.rform;
		
		let dayFee =0;
		let RENT_DAY = f.RENT_DAYS.value;
		
		if(f.BOOK_CODE.value=="B01") dayFee = f.B01.value;
		if(f.BOOK_CODE.value=="B02") dayFee = f.B02.value;
		if(f.BOOK_CODE.value=="B03") dayFee = f.B03.value;
		if(f.BOOK_CODE.value=="B04") dayFee = f.B04.value;
		
		console.log(f.B01.value);
		console.log(dayFee);
		console.log(RENT_DAY);
		
		f.FEE.value = dayFee*RENT_DAY;
	}
</script>