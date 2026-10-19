<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>주행내역등록</h3>
<form name="driveForm" method="post" action="driveInsertProc.jsp"
      onsubmit="return checkForm();">
    <table class="form">
        <tr>
            <th>주행일자</th>
            <td>
                <input type="text" name="driveDate">
                <span class="hint">2023년01월01일 예)20230101</span>
            </td>
        </tr>
        <tr>
            <th>차량번호</th>
            <td>
                <input type="text" name="carNo">
                <span class="hint">예)10가0001</span>
            </td>
        </tr>
        <tr>
            <th>출발Km</th>
            <td>
                <input type="text" name="startKm">
                <span class="hint">km</span>
            </td>
        </tr>
        <tr>
            <th>도착km</th>
            <td>
                <input type="text" name="endKm">
                <span class="hint">km</span>
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
                <input type="text" name="oilCost">
                <span class="hint">원</span>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="btn">
                <input type="submit" value="주행내역등록">
                <input type="reset" value="다시쓰기">
            </td>
        </tr>
    </table>
</form>

<script>

    // 유효성 검사 : 비어 있으면 알림창을 띄우고 전송을 막는다
    function checkForm() {
        var f = document.driveForm;

        if (f.driveDate.value.trim() === "") {
            alert("주행일자가 입력되지 않았습니다!");
            f.driveDate.focus();
            return false;
        }
        if (f.carNo.value.trim() === "") {
            alert("차량번호가 입력되지 않았습니다!");
            f.carNo.focus();
            return false;
        }
        if (f.startKm.value.trim() === "") {
            alert("출발Km가 입력되지 않았습니다!");
            f.startKm.focus();
            return false;
        }
        if (f.endKm.value.trim() === "") {
            alert("도착km가 입력되지 않았습니다!");
            f.endKm.focus();
            return false;
        }
        if (f.deptCode.value === "") {
            alert("부서코드가 선택되지 않았습니다!");
            f.deptCode.focus();
            return false;
        }
        if (f.oilCost.value.trim() === "") {
            alert("주유금액이 입력되지 않았습니다!");
            f.oilCost.focus();
            return false;
        }
        return true;
    }
</script>
