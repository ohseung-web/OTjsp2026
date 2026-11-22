<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>

<script>

function check() {
	let f = document.form;
    if(f.rent_month.value == "") {
        alert("대출월을 입력하세요!");
        f.rent_month.focus();
        return false;
    }
    if(f.r_name.value == "") {
        alert("회원명을 선택하세요!");
        f.r_name.focus();
        return false;
    }
    if(f.book_name.value == "") {
        alert("도서명을 선택하세요!");
        f.book_name.focus();
        return false;
    }
    if(f.rent_days.value == "") {
        alert("대출일수를 선택하세요!");
        f.rent_days.focus();
        return false;
    }
    f.submit();
}

function resetForm() {
	let f = document.form;
    alert("정보를 지우고 처음부터 다시 입력합니다!");
    f.reset();
    f.rent_month.focus();
}
</script>

<h2>대출신청</h2>
<form name="form" action="index.jsp?page=rentProc" method="post">
    <input type="hidden" name="day_fee" value="">
    <table class="form">
        <tr>
            <th>대출월</th>
            <td><input type="text" name="rent_month"> 예) 202305</td>
        </tr>
        <tr>
            <th>회원명</th>
            <td>
                <select name="r_name">
                    <option value="">회원명 선택</option>
                    <%
                        Connection con = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        try {
                            con = Util.getConnection();
                            String sql = "SELECT R_NO, R_NAME, GRADE FROM TBL_READER_202301";
                            pstmt = con.prepareStatement(sql);
                            rs = pstmt.executeQuery();
                            while(rs.next()) {
                                String r_no = rs.getString("R_NO");
                                String r_name = rs.getString("R_NAME");
                                String grade = rs.getString("GRADE");
                    %>
                    <option value="<%=r_no%>,<%=grade%>"><%=r_name%></option>
                    <%
                            }
                        } catch(Exception e) {
                            e.printStackTrace();
                        } finally {
                            if(rs != null) try { rs.close(); } catch(SQLException e) {}
                            if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <th>회원번호</th>
            <td><input type="text" name="r_no" readonly> 예) 10001 (자동)</td>
        </tr>
        <tr>
            <th>도서명</th>
            <td>
                <select name="book_name">
                    <option value="">도서명 선택</option>
                    <%
                        try {
                            String sql2 = "SELECT BOOK_CODE, BOOK_NAME, DAY_FEE FROM TBL_BOOK_202301";
                            pstmt = con.prepareStatement(sql2);
                            rs = pstmt.executeQuery();
                            while(rs.next()) {
                                String b_code = rs.getString("BOOK_CODE");
                                String b_name = rs.getString("BOOK_NAME");
                                int d_fee = rs.getInt("DAY_FEE");
                    %>
                    <option value="<%=b_code%>,<%=d_fee%>"><%=b_name%></option>
                    <%
                            }
                        } catch(Exception e) {
                            e.printStackTrace();
                        } finally {
                            if(rs != null) try { rs.close(); } catch(SQLException e) {}
                            if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
                            if(con != null) try { con.close(); } catch(SQLException e) {}
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <th>도서코드</th>
            <td><input type="text" name="book_code" readonly> 예) B01 (자동)</td>
        </tr>
        <tr>
            <th>대출일수</th>
            <td>
                <select name="rent_days">
                    <option value="">대출일수 선택</option>
                    <option value="7">7일</option>
                    <option value="14">14일</option>
                    <option value="21">21일</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>대출료</th>
            <td><input type="text" name="fee" readonly> 원 (자동 계산)</td>
        </tr>
        <tr>
            <td colspan="2" class="c">
                <input type="button" value="대출신청" onclick="check()">
                <input type="button" value="다시쓰기" onclick="resetForm()">
            </td>
        </tr>
    </table>
</form>