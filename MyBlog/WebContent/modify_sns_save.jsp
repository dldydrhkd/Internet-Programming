<%@ page contentType="text/html; charset=UTF-8"
		import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
		import="java.sql.*, java.io.*, java.util.Enumeration"
		import="java.sql.*, mybean.db.*, javax.naming.*"
%>
<%
request.setCharacterEncoding("utf-8");
Class.forName("org.mariadb.jdbc.Driver");

String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

//1.upload 이름을 가지는 실제 서버의 경로명 알아내기
ServletContext context = getServletContext();
String realFolder = context.getRealPath("upload");

//2. 최대 전송 파일 크기 5Mbytes로 정의
int maxsize = 1024*1024*5;

Connection con=null;
PreparedStatement pstmt = null;
ResultSet rs=null;

try {
	//3. MultipartRequest 객체 생성. 
	//   만일, 서버에 동일한 파일이름이 저장되어있다면, 파일이름 뒤에 숫자를 증가시킴
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxsize, "utf-8", 
									new DefaultFileRenamePolicy());

	Enumeration<?> fileNames = multi.getFileNames();
	
		
	int i=0;
	String[] fileName = new String[3];
	
	while(fileNames.hasMoreElements()){
		
		String parameter = (String)fileNames.nextElement();
		String filename=multi.getFilesystemName(parameter);
		
		fileName[i]=filename;
		i++;
	}

	//4. 사용자가 id, name, pwd 파라미터에 전송한 값 알아내기
	String idx= multi.getParameter("idx");
	String title = multi.getParameter("title");
	String name = multi.getParameter("name");
	String pwd = multi.getParameter("password");
	String content= multi.getParameter("text");
	
	sns_Article art = new sns_Article();
	
	art.setIdx(Integer.parseInt(idx));
	art.setTitle(title);			//3. 생성된 Article 객체의 각 멤버변수들에 사용자로부터 전달 받은 값을 저장
	art.setName(name);
	art.setPwd(pwd);
	art.setContent(content);
	
	con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	
	//2. member 테이블에서 모든 필드의 레코드를 가져오는 퀴리 문자열을 구성한다.
	String sql = "UPDATE sns SET title=?, name=?, pwd=?, creation_time=now(), content=? WHERE idx=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, art.getTitle());
	pstmt.setString(2, art.getName());
	pstmt.setString(3, art.getPwd());
	pstmt.setString(4,  art.getContent());
	pstmt.setInt(5, art.getIdx());
		
	pstmt.executeUpdate();
	
	for(i=0; i<3; i++){
		if(fileName[i]==null) continue;
		if(i==0){
			sql = "UPDATE sns SET fileName2=? WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileName[0]);
			pstmt.setInt(2, art.getIdx());
			pstmt.executeUpdate();
		}
		else if(i==1){
			sql = "UPDATE sns SET fileName1=? WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileName[1]);
			pstmt.setInt(2, art.getIdx());
			pstmt.executeUpdate();
		}
		else if(i==2){
			sql = "UPDATE sns SET fileName3=? WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileName[2]);
			pstmt.setInt(2, art.getIdx());
			pstmt.executeUpdate();
		}
	}
	rs.close();
	pstmt.close();
	con.close();

}catch(SQLException e) {
	out.print(e);
	return;
}
response.sendRedirect("user_login.jsp");
%>