<%@ page contentType="text/html;charset=utf-8" 
	import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*"
	import="java.sql.*, java.io.*, java.util.Date, java.util.Enumeration" 
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
		
		if(filename == null) continue;
		 
		fileName[i]=filename;
		i++;
	}

	//4. 사용자가 id, name, pwd 파라미터에 전송한 값 알아내기
	String title = multi.getParameter("title");
	String name = multi.getParameter("name");
	String pwd = multi.getParameter("password");
	String content= multi.getParameter("text");
	
	sns_Article art = new sns_Article();
	
	art.setTitle(title);			//3. 생성된 Article 객체의 각 멤버변수들에 사용자로부터 전달 받은 값을 저장
	art.setName(name);
	art.setPwd(pwd);
	art.setContent(content);
	
	sns_ArticleDB db = new sns_ArticleDB();		//4. ArticleDB 객체 생성
	
	if(fileName[2]!=null){
		art.setFileName1(fileName[0]);
		art.setFileName2(fileName[1]);
		art.setFileName3(fileName[2]);
	}
	if(fileName[1]==null && fileName[0]!=null){
		art.setFileName1(fileName[0]);
	}
	else if(fileName[2]==null && fileName[1]!=null){
		art.setFileName1(fileName[0]);
		art.setFileName2(fileName[1]);
	}
	
	//9. 쿼리 실행
	db.insertRecord(art);
	
}catch(NamingException e) {
	out.print(e);
	return;
}catch(SQLException e) {
	out.print(e);
	return;
}
response.sendRedirect("user_login.jsp");
%>