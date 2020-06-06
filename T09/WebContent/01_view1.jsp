<%@ page contentType="text/html; charset=UTF-8"
		import = "myBean.Calculator"
%>
<%
request.setCharacterEncoding("utf-8");

double d1 = Double.parseDouble(request.getParameter("num1")); // double 형으로 바꿔야함
double d2 = Double.parseDouble(request.getParameter("num2")); 
String sop = request.getParameter("oper");

char cop = sop.charAt(0);

new Calculator();

Calculator cal = new Calculator();
cal.setNum1(d1);
cal.setNum2(d2);
cal.setOper(cop);	// cal.setOper(request.getParameter("oper").charAt(0));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빈즈 객체 활용 결과 출력</title>
</head>
<body>
빈즈 객체 활용 결과 출력: 
<%=cal.getNum1() %><%=cal.getOper() %><%=cal.getNum2() %>
=<%=cal.getResult() %>
</body>
</html>