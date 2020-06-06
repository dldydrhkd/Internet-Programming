<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>정보 조사</title>
<style>
table th {background-color:lightgray}
</style>
</head>
<body>
<form action="output.jsp" method="post">
<table border ="1">
<tr>
	<th>이름: </th>
	<td><input type="text" id="myName" name="myName"></td>
</tr>
<tr>
	<th>주민번호('-'없이 입력): </th>
	<td><input type="password" id="password" name="password"></td>
</tr>
<tr>
	<th>코로나 관련 확인: </th>
	<td>
		<input type="checkbox" name="coro" value="발열">발열이 있으십니까? <br>
		<input type="checkbox" name="coro" value="기침">기침을 하십니까?	<br>
		<input type="checkbox" name="coro" value="콧물">콧물이 나십니까? <br>
	</td>
</tr>
<tr>
	<th>병역: </th>
	<td>
		<input type="radio" id="army" name="army" value="미필">미필
		<input type="radio" id="name" name="army" value="군필">군필	
		<input type="radio" id="name" name="army" value="면제">면제
	</td>
</tr>
<tr>
	<th>좋아하는 색: </th>
	<td><input type="color" name="myColor" id="myColor"></td>
</tr>
<tr>
	<th><label for="myDate">생년월일: </label></th>
	<td><input type="date" name="myDate" id="myDate"></td>
</tr>
<tr>
	<th>웹강에 대한 만족도 조사(0~100사이): </th>
	<td><input type="range" name="myRange" id="myRange" min="0" max="100" step="10"></td>
</tr>
<tr>	
	<th><label for="myNum">좋아하는 숫자는? (1~10 사이): </label></th>
	<td><input type="number" id="myNum" name="myNum" min="1" max="10"></td>
</tr>
<tr>
	<th>계절학기 개설 희망 과목: </th>
	<td>
		<select id="mySel" name="mySel"> 
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
		<textarea id="text" name="text" cols="20" rows="2"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" style="text-align:center">
		<input type="submit" value="전송">
		<input type="reset" value="취소">
	</td>
</table>
</form>
</body>
</html>