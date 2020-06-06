<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");			//받을때 쓴다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Beans 액션태그를 활용한 결과 출력</title>
</head>
<body>
<jsp:useBean id="show" class="myBean.show" scope="page"/>
<jsp:setProperty property="*" name="show"/>
JSP Beans Action Tag 사용 결과: <br>
제목: 
<jsp:getProperty property="title" name="show"/><br>
이름: 
<jsp:getProperty property="name" name="show"/><br>
비밀번호: 
<jsp:getProperty property="password" name="show"/><br>
글: 
<jsp:getProperty property="text" name="show"/><br>
<hr>
myBean.show의 print함수를 이용한 출력: <br>
<jsp:getProperty property="print" name="show"/><br>
</body>
</html>