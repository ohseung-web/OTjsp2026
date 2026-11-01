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
				<%-- [수정] onchange 추가 : 회원명 선택 시 회원번호 자동 입력 --%>
				<select name = "cName" onchange="cal_cNo()" style="width : 170px; height:22px;">
					<option value = "none">회원명</option>
					<% 
					try{
						con = Util.getConnection();
						// MEMBER 에서 회원명 정보, select 쿼리문으로 가져오기
						// [수정] 회원번호(C_NO)도 함께 조회
						String sql = "select C_NAME, C_NO from TBL_MEMBER_202201";
						// 쿼리 실행
						pstmt = con.prepareStatement(sql);
						rs = pstmt.executeQuery();
						// 반복문
						while(rs.next()){
					%>
						<%-- [수정] data-no 속성에 회원번호를 담아둔다 --%>
						<option value = "<%= rs.getString("C_NAME")%>" data-no = "<%= rs.getString("C_NO")%>"><%= rs.getString("C_NAME")%></option>
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
				<%-- [수정] 자동 입력이므로 readonly --%>
				<input type="text" name="cNo" readonly/> 예)10001
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
				<%-- [수정] onchange 추가 : 강의 선택 시 수강료 자동 계산 --%>
				<select name = "teacherCode" onchange="calTuition()" style="width : 170px; height:22px;">
					<option value = "none">강의신청</option>
				<% 
					// TEACHER 에서 강의명 정보, select 쿼리문으로 가져오기
					// [수정] 수강료(CLASS_PRICE)도 함께 조회
					String sql03 = "select TEACHER_CODE, CLASS_NAME, CLASS_PRICE from TBL_TEACHER_202201";
					pstmt=con.prepareStatement(sql03);
					rs = pstmt.executeQuery();
					while(rs.next()){ 
				%>
					<%-- 값은 teacher_code / 표기는 강의명  : class테이블에는 teacher_code가 들어가야 함 --%>
					<%-- [수정] data-price 속성에 강의 수강료를 담아둔다 --%>
					<option value = "<%= rs.getString("TEACHER_CODE")%>" data-price = "<%= rs.getInt("CLASS_PRICE")%>"><%= rs.getString("CLASS_NAME")%></option>
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
				<%-- [수정] 자동 계산이므로 readonly --%>
				<input type="text" name = "tuition" readonly/> 원
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
	
	// [수정] 아래 함수들을 완성하여 select의 onchange에 연결했습니다. -------------------------------------------------
	// 회원번호 자동선택
	function cal_cNo(){
		let f = document.iform;
		if(f.cName.value == "none") {
			f.cNo.value = "";
		} else {
			// [수정] 이름(value)이 아니라 선택한 option의 data-no(회원번호)를 넣는다
			let opt = f.cName.options[f.cName.selectedIndex];
			f.cNo.value = opt.getAttribute("data-no");
		}
		// 수강료 계산 실행
		calTuition();
	}
	
	
	// 수강료 계산 함수
	function calTuition(){
		// [수정] f 선언 추가 (함수 안에서 f가 없었음)
		let f = document.iform;
		// [수정] 회원 또는 강의가 선택되지 않았으면 수강료를 비운다
		if(f.cNo.value == "" || f.teacherCode.value == "none"){
			f.tuition.value = "";
			return;
		}
		// [수정] c_no -> cNo (input 이름과 일치시킴)
		var no = parseInt(f.cNo.value);
		// [수정] 강의수강료 -> 선택한 option의 data-price
		var opt = f.teacherCode.options[f.teacherCode.selectedIndex];
		var price = parseInt(opt.getAttribute("data-price"));
		if (no >= 20000)
			price = price * 0.5;
		f.tuition.value = price;
	}


</script>
