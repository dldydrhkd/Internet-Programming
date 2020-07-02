<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"
    import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, java.io.*, java.util.Date, java.util.Enumeration" 
	import="java.sql.*, mybean.db.*, javax.naming.*"
	import="java.text.SimpleDateFormat"
%>

<%
if(session.getAttribute("id")==null){
%>
<script>
	alert("로그인 후 사용하실 수 있습니다.");
	location.href="user_login.jsp";
</script>
<%
}else{
request.setCharacterEncoding("utf-8");


String comments=request.getParameter("text");
String idx=request.getParameter("idx");
String name=request.getParameter("name");
String id=(String)session.getAttribute("id");

Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con =null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try {
	
	
	con =DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

	String sql = "INSERT INTO comment(comments, idx, name, id) VALUES(?, ?, ?, ?)";
	
	pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, comments);
	pstmt.setInt(2, Integer.parseInt(idx));
	pstmt.setString(3, name);
	pstmt.setString(4, id);
	
	pstmt.executeUpdate();
	
	sql = "select comment_num from sns WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(idx));
	
	rs=pstmt.executeQuery();
	rs.next();
	int temp = rs.getInt("comment_num");
	sql="update sns set comment_num=?  where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, temp+1);
	pstmt.setInt(2, Integer.parseInt(idx));
	pstmt.executeUpdate();

	rs.close();
	pstmt.close();
	con.close();
	}catch(SQLException e) {
	out.print(e);
	return;
	}
}
response.sendRedirect("user_login.jsp");
%>