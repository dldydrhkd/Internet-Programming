<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"
%>

<%
request.setCharacterEncoding("utf-8");

String comments=request.getParameter("text");
String commentIdx=request.getParameter("idx");
String name=request.getParameter("name");
String id=(String)session.getAttribute("id");

Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con =null;
PreparedStatement pstmt=null;

try {
	
	con =DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

	String sql = "UPDATE comment SET comments=?,name=? WHERE commentIdx=?";
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, comments);
	pstmt.setString(2,  name);
	pstmt.setInt(3, Integer.parseInt(commentIdx));
	
	pstmt.executeUpdate();

	pstmt.close();
	con.close();
}catch(SQLException e) {
	out.print(e);
	return;
}
%>
<script>
alert("수정되었습니다.");			//출력 버퍼에 쌓이는 문자열
location.href="user_login.jsp";	//해결법
</script>