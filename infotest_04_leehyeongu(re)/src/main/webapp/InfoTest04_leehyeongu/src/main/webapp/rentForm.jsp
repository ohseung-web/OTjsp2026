<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<form name ="jform" id="jform"  action="rentProc.jsp" method="post">
	<h2>대출신청</h2>
	<table class="form">
	<tr>
		<th>대출월</th>
		<td><input name="month">예) 202305</td>
	</tr>
	<tr>
		<th>회원명</th>
		<td>
		<select name="Rname" onchange = "change()">
			<option value="">회원명 선택</option>
			<option value="김철수">김철수</option>
			<option value="이영희">이영희</option>
			<option value="박민수">박민수</option>
			<option value="최지우">최지우</option>
			<option value="정수빈">정수빈</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>회원번호</th>
		<td><input name="Rcode" readonly>예) 10001(자동)</td>
	</tr>
	<tr>
		<th>도서명</th>
		<td>
			<select name="Bname" onchange="Bchange()">
				<option value="">회원명 선택</option>
				<option value="자바프로그래밍">자바프로그래밍</option>
				<option value="달빛 소설집">달빛 소설집</option>
				<option value="세계사 여행">세계사 여행</option>
				<option value="요리의 정석">요리의 정석</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>도서코드</th>
		<td><input name="code" readonly>예) B01(자동)</td>
	</tr>
	<tr>
		<th>대출일수</th>
		<td>
			<select name="date" onchange="cal()">
				<option value="">대출일수 선택</option>
				<option value=7>7일</option>
				<option value=14>14일</option>
				<option value=21>21일</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>대출료</th>
		<td><input name="pri" readonly>원(자동계산)</td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="button" value="대출신청" onclick = "sub()">
			<input type="reset" value="다시쓰기">
		</td>
	</tr>
	</table>
</form>
<script>
	function sub(){
		let s = document.jform;
		
		if(s.month.value==""){
			alert('대출월을 입력해주세요')
			s.month.focus();
			return;
		}
		if(s.Rname.value==""){
			alert('회원명을 선택해주세요')
			s.Rname.focus();
			return;
		}
		if(s.Bname.value==""){
			alert('도서명을 선택해주세요')
			s.Bname.focus();
			return;
		}
		if(s.date.value==""){
			alert('대출일수를 선택해주세요')
			s.date.focus();
			return;
		}
		s.submit();
	}
	
	function Bchange(){
		let s = document.jform;
		if(s.Bname.value == "자바프로그래밍"){
			s.code.value = "B01";
		}else if(s.Bname.value == "달빛 소설집"){
			s.code.value = "B02";
		}else if(s.Bname.value == "세계사 여행"){
			s.code.value = "B03";
		}else if(s.Bname.value == "요리의 정석"){
			s.code.value = "B04";
		}else{
			s.code.value= "";
		}
		cal();
	}
	
	function change(){
		let s = document.jform;
		if(s.Rname.value == "김철수"){
			s.Rcode.value = "10001";
		}else if(s.Rname.value == "이영희"){
			s.Rcode.value = "10002";
		}else if(s.Rname.value == "박민수"){
			s.Rcode.value = "10003";
		}else if(s.Rname.value == "최지우"){
			s.Rcode.value = "20001";
		}else if(s.Rname.value == "정수빈"){
			s.Rcode.value = "20002";
		}else{
			s.Rcode.value= "";
		}
		cal();
	}
		
		function cal(){
			let s = document.jform;
			let day = s.date.value;
			let money = 0;
			
			if(s.code.value == "B01"){
				money = 500;
			}else if(s.code.value == "B02"){
				money = 300;
			}else if(s.code.value == "B03"){
				money = 400;
			}else if(s.code.value == "B04"){
				money = 600;
			}
			
			let fee = day*money;
			
			if(s.Rcode.value >= 20000){
				fee = fee * 0.7;
			}
			s.pri.value= fee;
			}
	
</script>
