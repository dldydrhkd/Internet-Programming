<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*, mybean.db.*, javax.naming.*"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pwd = request.getParameter("pwd");

Class.forName("org.mariadb.jdbc.Driver");
String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
PreparedStatement pstmt = null;
ResultSet rs=null;

try{
	
	//1. DB 연결자 정보를 획득한다.
	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		
	//2. member 테이블에서 모든 필드의 레코드를 가져오는 퀴리 문자열을 구성한다.
	String sql = "SELECT id,pwd FROM user where id=?";
		
	//3. sql문을 실행하기 위한 PreparedStatement 객체를 생성한다.
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);

	//4. 쿼리 실행
	rs = pstmt.executeQuery();
	rs.next();
	
	if(rs.getString("id").equals(id) && rs.getString("pwd").equals(pwd)){
		session.setAttribute("id",id);
		response.sendRedirect("user_login.jsp");
	} else if(rs.getString("id").equals(id) && !rs.getString("pwd").equals(pwd)){
		out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
	} else{
		out.println("<script>alert('아이디와 비밀번호가 틀렸습니다.'); history.go(-1);</script>");
	}
	rs.close();
	pstmt.close();
	con.close();
} catch(SQLDataException e){
	out.println("<script>alert('존재하지 않는 아이디입니다.'); history.go(-1);</script>");
	return;
}catch(SQLException e) {
	out.print(e);
	return;
}
%>

