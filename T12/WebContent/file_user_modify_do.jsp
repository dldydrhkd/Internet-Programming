<%@ page contentType="text/html; charset=UTF-8"
		import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
		import="java.sql.*, java.io.*"
%>
<%
request.setCharacterEncoding("utf-8");
Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/mydb?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");
int maxsize=5*1024*1024;

MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8",
		new DefaultFileRenamePolicy());

int idx= Integer.parseInt(multi.getParameter("idx"));
String id = multi.getParameter("id");
String name = multi.getParameter("name");
String pwd = multi.getParameter("pwd");
String fileName = multi.getFilesystemName("fileName");

Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
PreparedStatement pstmt = null;
ResultSet rs = null;
String sql = null;

if(fileName != null){
	//fileName을 변경하려 한다면... 즉, 새로운 파일 선택을 한다면
	sql = "SELECT fileName FROM member WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, idx);
	
	rs = pstmt.executeQuery();
	rs.next();
	String oldFileName = rs.getString("fileName");
	
	File oldFile = new File(realFolder + "\\"+ oldFileName);
	oldFile.delete();
	
	sql = "UPDATE member SET id=?, name=?, pwd=?, fileName=? WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	pstmt.setString(4, fileName);
	pstmt.setInt(5, idx);
} else{			// fileName을 변경하지 않는다면... 즉, 새로운 파일을 선택하지 않으면 기존 fileName 유
	sql = "UPDATE member SET id=?, name=?, pwd=? WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, pwd);
	pstmt.setInt(4, idx);
}

pstmt.executeUpdate();
if(pstmt != null) pstmt.close();
if(rs != null) rs.close();
if(con != null) con.close();

response.sendRedirect("file_user_list.jsp"); //문제 발생시 ,본 라인 주석 제거 후 테스트 하고 오류를 처
%>