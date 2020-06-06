<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String sname = request.getParameter("myName");
String spwd = request.getParameter("password");
String scoro[] = request.getParameterValues("coro");
String sarmy[] = request.getParameterValues("army");
String scolor = request.getParameter("myColor");
String sdate = request.getParameter("myDate");
String srange = request.getParameter("myRange");
String snum = request.getParameter("myNum");
String ssel = request.getParameter("mySel");
String stext = request.getParameter("text");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 결과 출력</title>
<script>
window.onload = function(){
	var coroArr = document.getElementsByName("coro");
	var armyArr = document.getElementsByName("army")
<%
int coroIdx=-1;
for(int i=0; i<scoro.length; i++){
	if(scoro[i].equals("발열")){
		coroIdx = 0;
	}else if (scoro[i].equals("기침")){
		coroIdx = 1;
	}else if (scoro[i].equals("콧물")){
		coroIdx = 2;
	}
%>
	coroArr[<%=coroIdx%>].checked = true;
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
	document.getElementById("mySel").selectedIndex = <%=ssel %>;
} // js end-of onload function
</script>
</head>
<body>
<h2>결과 출력</h2>
<table border ="1">
<tr>
	<th>이름: </th>
	<td><input type="text" id="myName" name="myName" value= "<%=sname %>"></td>
</tr>
<tr>
	<th>주민번호('-'없이 입력): </th>
	<td><input type="password" id="password" name="password" value= "<%=spwd %>"></td>
</tr>
<tr>
	<th>코로나 관련 확인: </th>
	<td>
		<input type="checkbox" name="coro" value="발열" disabled>발열이 있습니다.
		<input type="checkbox" name="coro" value="기침" disabled>기침이 있습니다.
		<input type="checkbox" name="coro" value="콧물" disabled>콧물이 납니다.
	</td>
</tr>
<tr>
	<th>병역: </th>
	<td>
		<input type="radio" id="army" name="army" value="미필" disabled>미필
		<input type="radio" id="army" name="army" value="군필" disabled>군필	
		<input type="radio" id="army" name="army" value="면제" disabled>면제
	</td>
</tr>
<tr>
	<th>좋아하는 색: </th>
	<td><input type="color" name="myColor" id="myColor" value="<%=scolor%>"></td>
</tr>
<tr>
	<th><label for="myDate">생년월일: </label></th>
	<td><input type="date" name="myDate" id="myDate" value="<%=sdate%>"></td>
</tr>
<tr>
	<th>웹강에 대한 만족도 조사(0~100사이): </th>
	<td><input type="range" name="myRange" id="myRange" min="0" max="100" step="10" value= "<%=srange %>"></td>
</tr>
<tr>	
	<th><label for="myNum">좋아하는 숫자는? (1~10 사이): </label></th>
	<td><input type="number" id="myNum" name="myNum" min="1" max="10" value="<%=snum%>"></td>
</tr>
<tr>
	<th>계절학기 개설 희망 과목: </th>
	<td>
		<select id="mySel" name="mySel" disabled> 
			<option value="0">자료구조</option>
			<option value="1">인터넷프로그래밍</option>
			<option value="2">객체지향프로그래밍</option>
			<option value="3">데이터베이스</option>
			<option value="4">오퍼레이트시스템</option>
		</select>
	</td>
</tr>
<tr>
	<th>기타 질문</th>
	<td>
		<textarea id="text" name="text" cols="20" rows="2"><%=stext %></textarea>
	</td>
</tr>
</table>
</body>
</html>