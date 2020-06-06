<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String stitle = request.getParameter("title");
String sname = request.getParameter("name");
String spwd = request.getParameter("password");
String stext = request.getParameter("text");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SNS 입력 결과 출력</title>
</head>
<body>
<h2>결과 출력</h2>
<table>
<tr>
	<td>제목</td>
	<td>
		<input type="text" name="id" readonly value="<%=stitle %>">
	</td>
</tr>
<tr>
	<td>작성자</td>
	<td>
		<input type="text" name="name" readonly value="<%=sname %>">
	</td>
</tr>
<tr>
	<td>암호</td>
	<td>
		<input type="password" name="pwd" readonly value="<%=spwd %>">
	</td>
</tr>
<tr>
	<td>보이는 암호</td>
	<td>
		<input type="text" name="pwd" readonly value="<%=spwd %>">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>
		<textarea name="text" cols="100" rows="30" readonly><%=stext %></textarea>
	</td>
</tr>
</table>
</body>
</html>