<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<link rel = "stylesheet" href="style/main.css">
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<section>
	<h2>수강신청</h2>
	
		
		<form name="jform" action="insertProc.jsp">
			<table border = "1">
				<tr>
				<td><label for ="date">수강일</label></td>
				<td><input type ="text" name="day" id = "date">2022년3월 예)202203</td>
				</tr>
				<tr>
					<td>회원명</td>
					<td>
					<select name = "cName">
						<option value = "">회원명</option>
						<option value = "홍길동">홍길동</option>
						<option value = "장발장">장발장</option>
						<option value = "임꺽정">임꺽정</option>
						<option value = "성춘향">성춘향</option>
						<option value = "이몽룡">이몽룡</option>
					</select>
					</td>
				</tr>			
				<tr>
					<td><label for ="num">회원번호</label></td>
				<td><input type ="text" name="cnum" id = "num" readonly>예)10001</td>
				</tr>
				<tr>
				<td>강의장소</td>
				<td>
					<select name = "place">
						<option value = "">강의장소</option>
						<option value="서울본원">서울본원</option>
						<option value="성남분원">성남분원</option>
						<option value="대전분원">대전분원</option>
						<option value="부산분원">부산분원</option>
						<option value="대구분원">대구분원</option>
					</select>	
				</td>			
				</tr>
				<tr>		
				<td>강의명</td>
				<td>
					<select name = "clas">
						<option value = "">강의신청</option>
						<option value="100">초급반</option>
						<option value="200">중급반</option>
						<option value="300">고급반</option>
						<option value="400">심화반</option>
					</select>		
				</td>		
				</tr>			
				<tr>
				<td>
					<label for ="money">수강료</label>
				</td>
				<td>
					<input type ="text" name="pri" id = "money">
				</td>
				</tr>
				<tr>
				<td colspan="2">
					<input type = "button" value = "수강신청" onclick = "sub()">
					<input type = "button" value = "다시쓰기" onclick = "re()">
				</td>
				</tr>		
			</table>
		</form>
		</section>
			<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript">
	function sub(){
		let s = document.jform
		if(s.day.value == ""){
			alert('날짜를 입력하세요')
			s.day.focus();
			return;
		}
		if(s.cName.value == ""){
			alert('이름를 입력하세요')
			s.cName.focus();
			return;
		}
		if(s.cnum.value == ""){
			alert('회원번호를 입력하세요')
			s.cnum.focus();
			return;
		}
		if(s.place.value == ""){
			alert('장소를 입력하세요')
			s.place.focus();
			return;
		}
		if(s.clas.value == ""){
			alert('강의반을 입력하세요')
			s.clas.focus();
			return;
		}
		if(s.pri.value == ""){
			alert('금액를 입력하세요')
			s.pri.focus();
			return;
		}
		s.submit();
	}
	function re(){
		let s = document.jform
		alert('정보를 지우고 처음부터 다시 입력합니다')
		s.reset();
	}
</script>
</body>
</html>