<%@ page contentType="text/html;charset=utf-8" import="java.sql.*, java.io.*" %>

<script>
	x=confirm("정말 삭제하시겠습니까?");
	if(x==false){
		location.href="user_login.jsp";
	}
</script>
    
<%
request.setCharacterEncoding("utf-8");

String idx = request.getParameter("idx");
String pwd = request.getParameter("password");

String DB_URL = "jdbc:mariadb://localhost:3306/snsboard?useSSL=false";
String DB_USER = "admin";
String DB_PASSWORD= "1234";

 try {
	//1. 사용자가 get방식으로 전달한 idx값 알아내기
	
 
	//2. JDBC Driver 로드
	Class.forName("org.mariadb.jdbc.Driver");

	//3.연결자 정보 획득
	Connection con = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	
	//4. idx에 해당하는 fileName을 member 테이블에서 알아내기 위한 쿼리 문자열 구성
	String sql = "SELECT * from sns where idx=?";
	
	//5. PerparedStatement 객체 알아내기.
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//6. PreparedStatement 객체의 쿼리 문자열 중 첫번째인  idx 값 설정하기
	pstmt.setInt(1, Integer.parseInt(idx));
	
	//7. 쿼리 실행
	ResultSet rs = pstmt.executeQuery();
	
	//8. 레코드 커서 이동시키기
	rs.next();
	
	if(!rs.getString("pwd").equals(pwd)){
%>
<script>
alert('글 작성시 입력한 비밀번호와 일치하지 않습니다.'); 
location.href='delete_sns.jsp?idx=<%=idx%>';
</script>;
<%
	}
	else{
	//9.fileName 필드의 값 알아내기
	String filename1 = rs.getString("fileName1");
	String filename2 = rs.getString("fileName2");
	String filename3 = rs.getString("fileName3");
	 
	//10. upload 이름을 가지는 실제 서버의 경로명 알아내기
	ServletContext context = getServletContext();
	String realFolder = context.getRealPath("upload");
	
	//11. 앞에서 알아낸 서버의 경로명과 파일명으로 파일 객체 생성하기
	File file1 = new File(realFolder + "\\"+ filename1);
	File file2 = new File(realFolder + "\\"+ filename2);
	File file3 = new File(realFolder + "\\"+ filename3);
	
	//12. 파일 삭제
	file1.delete();
	file2.delete();
	file3.delete();
	
	//13. member 테이블에서 지정한 idx의 레코드를 삭제하기 위한 쿼리 문자열 구성하기
	sql = "DELETE FROM sns WHERE idx=?";
	
	//14. PreparedStatement 객체 알아내기
	pstmt = con.prepareStatement(sql);
	
	//15. PreparedStatement 객체의 쿼리 문자열 중 첫번째인  idx 값 설정하기
	pstmt.setInt(1, Integer.parseInt(idx));
	
	//16. 쿼리 실행
	pstmt.executeUpdate();
	
	rs.close();
	pstmt.close();
	con.close();
	}
} catch (SQLException e) {
	//SQL에 대한 오류나, DB 연결 오류 등이 발생하면, 그 대처 방안을 코딩해 준다.
	out.println(e.toString());
	return;
} catch (Exception e) { 
	//SQLException 이외의 오류에 대한 대처 방안을 코딩해 준다.
	out.println(e.toString());
	return;
}
/* 오류 발생하거나 화면에 아무것도 나타나지 않으면 이곳을  주석 처리하여 오류를 확인할 것 */
%>
<script>
alert("삭제되었습니다.");			//출력 버퍼에 쌓이는 문자열
location.href="user_login.jsp";	//해결법
</script>