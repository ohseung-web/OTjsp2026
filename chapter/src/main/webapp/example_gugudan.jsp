<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>구구단 표</h2>
<table border="1">
    <tr>
    <% for (int dan = 2; dan <= 9; dan++) { %>
        <th><%= dan %>단</th>
    <% } %>
    </tr>
    <% for (int i = 1; i <= 9; i++) { %>
    <tr>
        <% for (int dan = 2; dan <= 9; dan++) { %>
        <td><%= dan %> x <%= i %> = <%= dan * i %></td>
        <% } %>
    </tr>
    <% } %>
</table>
</body>
</html>