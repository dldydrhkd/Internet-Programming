<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫페이지</title>
</head>
<body>
<h2>Hello World: JSP 첫페이지</h2>
오늘의 날짜와 시간은: <%= new Date() %>   <!-- expression이라 ;이 없어야하고 위에 java.util.*을 import 시
								 java.util.을 생략해도 된다. -->
</body>
</html>