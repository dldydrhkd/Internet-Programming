<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String commentIdx=request.getParameter("commentIdx");

Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	
	con =DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	
	String sql = "SELECT * FROM comment WHERE commentIdx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(commentIdx));
	
	rs=pstmt.executeQuery();
	rs.next();
	
if(session.getAttribute("id")==null){
%>
<script>
	alert("로그인 후 사용하실 수 있습니다.");
	location.href="user_login.jsp";
</script>
<%
}else if(!session.getAttribute("id").equals(rs.getString("id"))){
%>
<script>x
	alert("삭제 권한이 없습니다.");
	loaction.href="user_login.jsp";
</script>
<%
}else{
%>
<script>
	x=confirm("정말 삭제하시겠습니까?");
	if(x==false){
		location.href="user_login.jsp";
	}
</script>
<%
	int idx=rs.getInt("idx");
	sql="select comment_num from sns where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	rs=pstmt.executeQuery();
	rs.next();
	int temp=rs.getInt("comment_num");
	
	sql="update sns set comment_num=? where idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, temp-1);
	pstmt.setInt(2, idx);
	
	pstmt.executeUpdate();
	
	sql="delete from comment where commentIdx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(commentIdx));
	pstmt.executeUpdate();
	
	rs.close();
	pstmt.close();
	con.close();
}
}catch(SQLException e) {
	out.print(e);
	return;
}
%>
<script>
alert("삭제되었습니다.");			//출력 버퍼에 쌓이는 문자열
location.href="user_login.jsp";	//해결법
</script>