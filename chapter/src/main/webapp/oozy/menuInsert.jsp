<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h3>메뉴등록</h3>
<form name="menuForm" method="post" action="menuInsertProc.jsp"
      onsubmit="return checkForm();">
    <table class="form">
        <tr>
            <th>메뉴명</th>
            <td>
                <input type="text" name="menuName">
                <span class="hint">예)콜드브루 라떼</span>
            </td>
        </tr>
        <tr>
            <th>분류</th>
            <td>
                <select name="category">
                    <option value="">분류</option>
                    <option value="10">[10]COFFEE</option>
                    <option value="20">[20]COLD BREW</option>
                    <option value="30">[30]BEVERAGE</option>
                    <option value="40">[40]DESSERT</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>가격</th>
            <td>
                <input type="text" name="price">
                <span class="hint">원</span>
            </td>
        </tr>
        <tr>
            <th>판매상태</th>
            <td>
                <input type="radio" name="status" value="Y"> 판매중
                <input type="radio" name="status" value="N"> SEASON OUT
            </td>
        </tr>
        <tr>
            <th>설명</th>
            <td><textarea name="info"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" class="btn">
                <input type="submit" value="메뉴등록">
                <input type="reset" value="다시쓰기">
            </td>
        </tr>
    </table>
</form>

<script>
    // 유효성 검사 : 비어 있으면 알림창을 띄우고 전송을 막는다
    function checkForm() {
        var f = document.menuForm;

        if (f.menuName.value.trim() === "") {
            alert("메뉴명이 입력되지 않았습니다!");
            f.menuName.focus();
            return false;
        }
        if (f.category.value === "") {
            alert("분류가 선택되지 않았습니다!");
            f.category.focus();
            return false;
        }
        if (f.price.value.trim() === "") {
            alert("가격이 입력되지 않았습니다!");
            f.price.focus();
            return false;
        }

        // 라디오 버튼은 하나라도 체크되었는지 반복문으로 확인
        var checked = false;
        for (var i = 0; i < f.status.length; i++) {
            if (f.status[i].checked) {
                checked = true;
                break;
            }
        }
        if (!checked) {
            alert("판매상태가 선택되지 않았습니다!");
            f.status[0].focus();
            return false;
        }

        if (f.info.value.trim() === "") {
            alert("설명이 입력되지 않았습니다!");
            f.info.focus();
            return false;
        }
        return true;
    }
</script>
