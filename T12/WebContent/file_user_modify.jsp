<%@ page contentType="text/html;charset=utf-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
int idx=Integer.parseInt(request.getParameter("idx"));

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/mydb?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

con= DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

String sql ="SELECT id, name, pwd, fileName FROM member WHERE idx=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, idx);

rs= pstmt.executeQuery();
rs.next();

%>
<!DOCTYPE html>
<html>
<head><title>사용자 수정</title></head>
<body>
<!--1.  file 업로드를 위한 enctype 속성 추가 -->
<form method="POST" action="file_user_modify_do.jsp" enctype="multipart/form-data">
번호:<input type="text" name="idx" readonly value="<%=idx %>"><br>
아이디:<input type="text" name="id" value= "<%=rs.getString("id")%>"><br>
이름 : <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
암호 : <input type="password" name="pwd" value="<%=rs.getString("pwd")%>"><br>

<p>
기존파일명: <%=rs.getString("fileName")%>
<img src="./upload/<%=rs.getString("fileName") %>" width="100" height="100">
</p>

변경할 사진 : <input type="file" name="fileName">
<br> 
<input type="submit" value="수  정">
</form>
</body>
</html>