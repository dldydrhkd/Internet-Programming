<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
%>
<script>
alert("로그아웃되었습니다.");			//출력 버퍼에 쌓이는 문자열
location.href="user_login.jsp";	//해결법
</script>