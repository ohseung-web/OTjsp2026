<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
    <tr><th>숫자</th><th>제곱</th><th>구분</th></tr>
    <% for (int i = 1; i <= 20; i++) { %>
    <tr style="background-color:<%= (i % 2 == 0) ? "#e6f2ff" : "#ffffff" %>">
        <td>
        <%
            if (i % 3 == 0) {
                out.print("<b>" + i + "</b>");
            } else {
                out.print(i);
            }
        %>
        </td>
        <td><%= i * i %></td>
        <td><%= (i % 2 == 0) ? "짝수" : "홀수" %></td>
    </tr>
    <% } %>
</table>
</body>
</html>