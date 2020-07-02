<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"
    import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, java.io.*, java.util.Date, java.util.Enumeration" 
	import="java.sql.*, mybean.db.*, javax.naming.*"
%>
<%
request.setCharacterEncoding("utf-8");

String idx=request.getParameter("idx");

Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";


try {
	Connection con;	
	PreparedStatement pstmt;
	ResultSet rs;
	
	con =DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	
	String sql="SELECT view_point FROM sns WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(idx));
	
	rs=pstmt.executeQuery();
	rs.next();
	int temp=rs.getInt("view_point");
	
	sql="UPDATE sns SET view_point=? WHERE idx=?";
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
response.sendRedirect("content.jsp?idx="+idx);
%>
