<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "DBPKG.Util" %>

<%
	request.setCharacterEncoding("utf-8");
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<h2>수강신청</h2>
<form action="insertProc.jsp" method="post" name  = "iform">
	<table class="form">
		<tr>
			<th>수강월</th>
			<td>
				<input type="text" name = "registMonth"/> 2022년03월 예)202203
			</td>
		</tr>	
		<tr>
			<th>회원명</th>
			<td>
				<select name = "cName" style="width : 170px; height:22px;">
					<option value = "none">회원명</option>
					<% 
					try{
						con = Util.getConnection();
						// MEMBER 에서 회원명 정보, select 쿼리문으로 가져오기
						String sql = "select C_NAME from TBL_MEMBER_202201";
						// 쿼리 실행
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						// 반복문
						while(rs.next()){
					%>
						<option value = "<%= rs.getString("C_NAME")%>"><%= rs.getString("C_NAME")%></option>
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
				<input type="text" name="cNo" /> 예)10001
	<%-- 		<%
				// 회원번호는 회원명을 선택하면 자동으로 입력 
				String sql02 = "select C_NO from TBL_MEMBER_202201 where C_NAME = ?";
				pstmt = con.prepareStatement(sql02);
				// 물음표에 대입
				pstmt.setString(1, );
				rs = pstmt.executeQuery();
				// 반복문이 아닌 if문 사용
				if(rs.next()){
			%>
				<input type="text" name="cNo" value = "<%= rs.getString("C_NO") %> %>" readonly/> 예)10001
			<%		
				}
				rs.close();
				pstmt.close();
			%> --%>
			</td>
		</tr>	
		<tr>
			<th>강의장소</th>
			<td>
				<select name = "classArea" style="width : 170px; height:22px;">
					<option value = "none">강의장소</option>
					<option value = "서울본원">서울본원</option>
					<option value = "성남분원">성남분원</option>
					<option value = "대전분원">대전분원</option>
					<option value = "부산분원">부산분원</option>
					<option value = "대구분원">대구분원</option>
				</select>
			</td>
		</tr>	
		<tr>
			<th>강의명</th>
			<td>
				<select name = "teacherCode" style="width : 170px; height:22px;">
					<option value = "none">강의신청</option>
				<% 
					// TEACHER 에서 강의명 정보, select 쿼리문으로 가져오기
					String sql03 = "select TEACHER_CODE, CLASS_NAME from TBL_TEACHER_202201";
					pstmt=con.prepareStatement(sql03);
					rs = pstmt.executeQuery();
					while(rs.next()){ 
				%>
					<%-- 값은 teacher_code / 표기는 강의명  : class테이블에는 teacher_code가 들어가야 함 --%>
					<option value = "<%= rs.getString("TEACHER_CODE")%>"><%= rs.getString("CLASS_NAME")%></option>
				<%   
						}
					}catch(Exception e){
						e.printStackTrace();
					}finally {
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
			<th>수강료</th>
			<td>
				<input type="text" name = "tuition"/> 원
			</td>
		</tr>	
		<tr>
			<td colspan = "2" >
				<div class="btn-area">
					<input type = "button" onclick="checkForm()" value = "수강신청"/>
					<input type = "reset" onclick="reWrite()" value = "다시쓰기"/>
				</div>
			</td>
		</tr>
	</table>
</form>

<%-- 예외처리 자바스크립트 --%>
<script>
	// 다시쓰기 버튼
	function reWrite(){
		let f = document.iform;
		alert("정보를 지우고 처음부터 다시 입력합니다!")
		// location.href="index.jsp?page=insert";
		f.reset();
		f.registMonth.focus();
	}
	// 수강신청 버튼 시, 예외처리 후 submit 실행하기
	function checkForm(){
		let f = document.iform;
		if(f.registMonth.value == ""){
			alert("수강월을 입력하지 않았습니다.");
			f.registMonth.focus();
			return;
		}
		if(f.cName.value == "none" || f.cName.value == "") {
		    alert("회원명을 선택하지 않았습니다.");
		    f.cName.focus();
		    return;
		}
		if(f.cNo.value == ""){
			alert("회원번호를 입력하지 않았습니다.");
			f.cNo.focus();
			return;
		}
		if(f.classArea.value == "" || f.classArea.value == "none"){
			alert("강의장소를 선택하지 않았습니다.");
			f.classArea.focus();
			return;
		}
		if(f.teacherCode.value == ""||f.teacherCode.value == "none"){
			alert("강의명을 선택하지 않았습니다.");
			f.teacherCode.focus();
			return;
		}
		if(f.tuition.value == ""){
			alert("수강료를 입력하지 않았습니다.");
			f.tuition.focus();
			return;
		}
		f.submit();
	}
	
	// 아래 함수들은 사용하지 못했습니다. -------------------------------------------------
	// 회원번호 자동선택
	function cal_cNo(){
		let f = document.iform;
		if(f.cName.value == "none") {
			f.cNo.value = "";
		} else {
			f.cNo.value = f.cName.value; 
		}
		// 수강료 계산 실행
		calTuition();
	}
	
	
	// 수강료 계산 함수
	function calTuition(){
		var no = parseInt(f.c_no.value);
		var price = 강의수강료;
		if (no >= 20000)
		price = price * 0.5;
		f.tuition.value = price;
	}


</script>
