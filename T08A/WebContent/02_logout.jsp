<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate();
%>
<script>
alert("로그아웃되었습니다.");			//출력 버퍼에 쌓이는 문자열
location.href="02_login.jsp";	//해결법
</script>
<%--
response.sendRedirect("02_login.jsp");	//문자열 버퍼들이 날아가버림
										//session을 지우고 다른 페이지로 이동해버리라고 클라이언트에 지시 
										//출려버퍼에 있던 애들을 무시해버리고 응답
--%>