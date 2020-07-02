<%@ page contentType="text/html;charset=utf-8" 
			import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
//1.사용자가 전달한 idx값 알아내기
String idx = request.getParameter("idx");

try {
	//2. JDBC 드라이버를 로드하기 위해 클래스 패키지를 지정한다.
	Class.forName("org.mariadb.jdbc.Driver");
	
	String DB_URL ="jdbc:mariadb://localhost:3306/snsboard?useSSL=false";

	//3. 연결자 생성
	Connection con =  DriverManager.getConnection(DB_URL,"admin","1234");

	//4. member 테이블에서 idx에 해당하는 레코드 검색하기위한 쿼리 문자열 구성
	String sql = "SELECT like_point FROM sns WHERE idx=?"; 
		
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//5. pstmt에 SELECT문의 WHERE절 이하를 구성하기 위한 메소드 설정.
	pstmt.setInt(1, Integer.parseInt(idx));

	//6. 쿼리 실행
	ResultSet rs = pstmt.executeQuery();
	
	//7. 레코드 커서 이동시키기
	rs.next();
	
	//8. 레코드에 저장된 id, name, pwd 값을 알아내어 각 변수에 저장하기
	int point = rs.getInt("like_point");
	
	sql="UPDATE sns SET like_point=? WHERE idx=?";
	
	pstmt = con.prepareStatement(sql);
	
	//5. pstmt에 UPDATE문 쿼리 구성하기 
	pstmt.setInt(1, point+1);
	pstmt.setInt(2, Integer.parseInt(idx));

	//6. 쿼리 실행
	pstmt.executeUpdate();
	
	//DB관련 객체 close시키기
	rs.close();
	pstmt.close();
	con.close();

}catch(SQLException e) {
	out.print(e);
	return;
}
response.sendRedirect("user_login.jsp");
%>