<%-- web.xml에서 예외처리시 --%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%-- 
<%@ page contentType="text/html; charset=UTF-8"
		errorPage="01_error.jsp"%>
--%>
<%
request.setCharacterEncoding("utf-8");

String sn1 = request.getParameter("num1");
String sop = request.getParameter("op");

// Integer, Double, Float, Long  -> Wrapper class

int num1 = Integer.parseInt(sn1);

//int num2 = Integer.parseInt(request.getParameter("num2"));

/*
Integer obj = Integer.valueOf(request.getParameter("num2"));
int num2 = obj.intValue();
*/

int num2 = Integer.valueOf(request.getParameter("num2")).intValue();

int result=0;
if(sop.equals("+")){
	result=num1+num2;
}
if(sop.equals("-")){
	result=num1-num2;
}
if(sop.equals("*")){
	result = num1*num2;
}
if(sop.equals("/")){
	result = num1/num2;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사칙연산 계산 결과</title>
</head>
<body>
결과: <%=num1 %><%=sop %><%=num2 %> = <%=result %>
</body>
</html>