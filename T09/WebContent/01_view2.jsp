<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("utf-8");			//받을때 쓴다
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빈즈 액션태그를 활용한 결과 출력</title>
</head>
<body>
<jsp:useBean id="cal" class="myBean.Calculator" scope="page"/>
<jsp:setProperty property="*" name="cal"/>
JSP Beans Action Tag 사용 결과:
<jsp:getProperty property="num1" name="cal"/>
<jsp:getProperty property="oper" name="cal"/>
<jsp:getProperty property="num2" name="cal"/>
=
<jsp:getProperty property="result" name="cal"/>
</body>
</html>