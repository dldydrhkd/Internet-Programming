<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String sid = request.getParameter("id");
String sname = request.getParameter("name");
String spwd = request.getParameter("pwd");

String sfoods[] = request.getParameterValues("foods");

String sjob = request.getParameter("job");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 결과 출력</title>
<script>
window.onload = function(){
	var foodArr = document.getElementsByName("foods");
<%
int foodIdx=-1;
for(int i=0; i<sfoods.length; i++){
	if(sfoods[i].equals("사과")){
		foodIdx = 0;
	}else if (sfoods[i].equals("바나나")){
		foodIdx = 1;
	}else if (sfoods[i].equals("포도")){
		foodIdx = 2;
	}
%>
	foodArr[<%=foodIdx%>].checked = true;
<%
}		//end-of for
%> 

<%
int armyIdx=-1;
for(int i=0; i<sarmy.length; i++){
	if(sarmy[i].equals("미필")){
		armyIdx = 0;
	}else if(sarmy[i].equals("군필")){
		armyIdx=1;
	}else if(sarmy[i].equals("면제")){
		armyIdx=2;
	}
%>
	armyArr[<%=armyIdx%>].checked=true;
<%
}
%>


	document.getElementById("job").selectedIndex = <%=sjob %>;
} // js end-of onload function
</script>
</head>
<body>
<h2>결과 출력</h2>
<table>
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" readonly value="<%=sid %>">
	</td>
</tr>
<tr>
	<td>성명</td>
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
	<th>음식</th>
	<td>
		<input type="checkbox" name="foods"	value="사과" disabled>사과
		<input type="checkbox" name="foods" value="바나나" disabled>바나나
		<input type="checkbox" name="foods" value="포도" disabled>포도
	</td>
</tr>
<tr>
	<th>직업</th>
	<td>
		<select name="job" id="job" disabled>
		<option value="0">컴퓨터기사</option>
		<option value="1">요리사</option>
		<option value="2">프로게이머</option>
		<option value="3">학생</option>
		</select>
	</td>
</tr>
</table>
</body>
</html>