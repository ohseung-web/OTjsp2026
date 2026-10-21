<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>주행내역등록</h3>
		<form name="driveFrm" method="post" action="driveProc.jsp" >
		    <table class="form">
		        <tr>
		            <th>주행일자</th>
		            <td>
		                <input type="text" name="drvDate" maxlength="8">
		                <span class="hint">2023년01월01일 예)20230101</span>
		            </td>
		        </tr>
		        <tr>
		            <th>차량번호</th>
		            <td>
		                <input type="text" name="carNo" maxlength="10">
		                <span class="hint">예)10가0001</span>
		            </td>
		        </tr>
		        <tr>
		            <th>출발Km</th>
		            <td>
		                <input type="text" name="drvStart"> km
		            </td>
		        </tr>
		        <tr>
		            <th>도착km</th>
		            <td>
		                <input type="text" name="drvEnd"> km
		            </td>
		        </tr>
		        <tr>
		            <th>부서코드</th>
		            <td>
		                <select name="deptCode">
		                    <option value="">부서</option>
		                    <option value="10">[10]영업부</option>
		                    <option value="20">[20]총무부</option>
		                    <option value="30">[30]구매부</option>
		                    <option value="40">[40]개발부</option>
		                </select>
		            </td>
		        </tr>
		        <tr>
		            <th>주유금액</th>
		            <td>
		                <input type="text" name="drvMoney"> 원
		            </td>
		        </tr>
		        <tr>
		            <td colspan="2" class="btn">
		                <input type="button" value="주행내역등록" onclick="checkForm()">
		                <input type="button" value="다시쓰기" onclick="resetForm()">
		            </td>
		        </tr>
		    </table>
		</form>
	
	    <script type="text/javascript">
	    function checkForm() {
	        let f = document.driveFrm;

	        if (f.drvDate.value == "") {
	            alert("주행일자가 입력되지 않았습니다!");
	            f.drvDate.focus();
	            return;
	        }
	        if (f.carNo.value == "") {
	            alert("차량번호가 입력되지 않았습니다!");
	            f.carNo.focus();
	            return;
	        }
	        if (f.drvStart.value == "") {
	            alert("출발Km가 입력되지 않았습니다!");
	            f.drvStart.focus();
	            return;
	        }
	        if (f.drvEnd.value == "") {
	            alert("도착km가 입력되지 않았습니다!");
	            f.drvEnd.focus();
	            return;
	        }
	        if (f.deptCode.value == "") {
	            alert("부서코드가 선택되지 않았습니다!");
	            f.deptCode.focus();
	            return;
	        }
	        if (f.drvMoney.value == "") {
	            alert("주유금액이 입력되지 않았습니다!");
	            f.drvMoney.focus();
	            return;
	        }

	        // 모든 검사를 통과하면 전송
	        f.submit();
	    }
	    
	    function resetForm() {
	        let f = document.driveFrm;
	        alert("정보를 지우고 처음부터 다시 입력 합니다!");
	        f.reset();
	        f.drvDate.focus();
	    }
	    </script>
</body>
</html>