<%@ page contentType="text/html; charset=UTF-8"
	isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 메시지 출력</title>
</head>
<body>
<p>
isErrorPage="true" 설정에 의한 exception 예외 객체 처리
</p>
<p>
오류 메시지:
<%=exception.getMessage() %><br>
<%=exception.getClass().getName() %>
</p>
</body>
</html>