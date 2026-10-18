<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
    public String getGrade(int score) {
        if (score >= 90)      return "A";
        else if (score >= 80) return "B";
        else if (score >= 70) return "C";
        else if (score >= 60) return "D";
        else                  return "F";
    }
	%>
	<%
	    String[] names = {"김철수", "이영희", "박민수", "최지우", "정다은"};
	    int[] scores = {92, 78, 55, 85, 67};
	
	    int total = 0;
	    int max = scores[0];
	    int min = scores[0];
	%>
	
	<h2>성적표</h2>
	<table border="1">
	    <tr>
	        <th>번호</th><th>이름</th><th>점수</th><th>등급</th><th>그래프</th>
	    </tr>
    <%
    for (int i = 0; i < names.length; i++) {
        total += scores[i];
        if (scores[i] > max) max = scores[i];
        if (scores[i] < min) min = scores[i];
    %>
    <tr style="background-color:<%= (scores[i] < 60) ? "#ffcccc" : "#ffffff" %>">
        <td><%= i + 1 %></td>
        <td><%= names[i] %></td>
        <td><%= scores[i] %></td>
        <td><%= getGrade(scores[i]) %></td>
        <td>
            <div style="width:<%= scores[i] * 3 %>px; height:15px; background-color:#4a90d9;"></div>
        </td>
    </tr>
    <% } %>
	</table>
</body>
</html>