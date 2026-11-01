<%@page import="java.text.DecimalFormat"%>
<%@page import="DBPKG.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>

	<section>
		<h2>수강신청</h2>
		<%
		request.setCharacterEncoding("utf-8");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DecimalFormat de = new DecimalFormat("￦#,##0");
		
		ArrayList<String> C_NAMEs = new ArrayList<>();
		ArrayList<String> C_NOs = new ArrayList<>();
		ArrayList<Integer> CLASS_PRICEs = new ArrayList<>();
		
		try{
			con = Util.getConnection();
			
			String sql = "select C_NAME, C_NO from TBL_MEMBER_202201";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				C_NAMEs.add(rs.getString(1));
				C_NOs.add(rs.getString(2));
			}
			
			pstmt.close();
			rs.close();
			
			sql = "select CLASS_PRICE from TBL_TEACHER_202201";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				CLASS_PRICEs.add(rs.getInt(1));
			}
			
			pstmt.close();
			rs.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(con!=null) con.close();
				if(pstmt!=null) pstmt.close();
				if(rs!=null) rs.close();
			}catch(Exception e){e.printStackTrace();}
		}
		
	%>
		<form action="insertProc.jsp" method="post" name="iform">
			<table>
				<tr>
					<th>수강월</th>
					<td><input type="text" name="REGIST_MONTH">&nbsp;2022년03월 예)202203</td>
				</tr>
				<tr>
					<th>회원명</th>
					<td>
						<select name="C_NAME">
							<option value="">회원명</option>
							<% 
								//for(String C_NAME : C_NAMEs){
								for(int i =0; i<C_NAMEs.size(); i++){
								out.print("<option class='C_NAME_opt' value='"+C_NAMEs.get(i)+"'>"+C_NAMEs.get(i)+"</option>");
								}
							%>
						</select>
					</td>
				</tr>
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="C_NO" value="">예)100001</td>
				</tr>
				<tr>
					<th>강의장소</th>
					<td>
						<select name="CLASS_AREA">
							<option value="">강의장소</option>
							<option value="서울 본원">서울 본원</option>
							<option value="성남 분원">성남 분원</option>
							<option value="대전 분원">대전 분원</option>
							<option value="부산 분원">부산 분원</option>
							<option value="대구 분원">대구 분원</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>강의명</th>
					<td>
						<select name="CLASS_NAME">
							<option value="">강의신청</option>
							<option value="초급반">초급반</option>
							<option value="중급반">중급반</option>
							<option value="고급반">고급반</option>
							<option value="심화반">심화반</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>수강료</th>
					<td><input type="text" name="CLASS_PRICE" value=""></td>
				</tr>
				<tr>
					<td colspan="2" class="btn">
						<button type="button" onclick="send_btn()">수강신청</button>
						<button type="button" onclick="reset_btn()">다시쓰기</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<script type="text/javascript">
		function reset_btn(){
			let f = document.iform;
			alert("정보를 지우고 처음부터 다시 입력합니다!");
			f.reset();
			f.REGIST_MONTH.focus();
		}
		
		function send_btn(){
			let f = document.iform;
			if(f.REGIST_MONTH.value==""){
				alert("수강월을 입력하세요!");
				f.REGIST_MONTH.focus();
				return;
			}
			if(f.C_NAME.value==""){
				alert("회원명을 입력하세요!");
				f.C_NAME.focus();
				return;
			}
			if(f.C_NO.value==""){
				alert("회원번호를 입력하세요!");
				f.C_NO.focus();
				return;
			}
			if(f.CLASS_AREA.value==""){
				alert("강의장소를 입력하세요!");
				f.CLASS_AREA.focus();
				return;
			}
			if(f.CLASS_NAME.value==""){
				alert("강의명을 입력하세요!");
				f.CLASS_NAME.focus();
				return;
			}
			if(f.CLASS_PRICE.value==""){
				alert("수강료를 입력하세요!");
				f.CLASS_PRICE.focus();
				return;
			}
			f.submit();
		}
		
		/* let f = document.iform;
		let no = parseInt(f.C_NO.value);
		let price = f.CLASS_PRICE.value;
		if(no >= 200000){
			price = price * 0.5;
		}
		
		f.CLASS_PRICE.value = price; */
	</script>
	
	
	
	
	
	