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
		    int[] winNums = {3, 12, 19, 27, 33, 41};
		
		    public boolean isWinning(int num) {
		        for (int i = 0; i < winNums.length; i++) {
		            if (winNums[i] == num) {
		                return true;
		            }
		        }
		        return false;
		    }
		%>
		<h2>번호판</h2>
		<table border="1">
		    <%
		    for (int i = 1; i <= 45; i++) {
		        if (i % 9 == 1) {
		            out.print("<tr>");
		        }
		    %>
		        <td style="<%= isWinning(i) ? "background-color:gold; font-weight:bold;" : "" %>"><%= i %></td>
		    <%
		        if (i % 9 == 0) {
		            out.print("</tr>");
		        }
		    }
		    %>
		</table>
		<p>당첨 번호:
			<%
			    for (int i = 0; i < winNums.length; i++) {
			        out.print(winNums[i]);
			        if (i < winNums.length - 1) {
			            out.print(", ");
			        }
			    }
			%>
		</p>
</body>
</html>