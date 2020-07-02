package mybean.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

public class comment_ArticleDB {
	private Connection con;	
	private PreparedStatement pstmt;
	private ResultSet rs;

	//1. 생성자 선언 : Connection 인스턴스가 생성되도록 한다.
	public comment_ArticleDB() throws SQLException, NamingException{
		con =DsCon.getConnection();
	}
	
	public void insertRecord(comment_Article art) throws SQLException {
		String sql = "INSERT INTO comment(comments, idx) VALUES(?, ?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, art.getComments());
		pstmt.setInt(2, art.getIdx());
	
		pstmt.executeUpdate();
	}	

	//2. DB에 레코드 갱신을 위한 updateRecord() 메소드 선언
	//   @param : Article
	//   @return : void

	public void updateRecord(comment_Article art) throws SQLException {
		String sql = "UPDATE comment SET comments=? WHERE commentIdx=?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, art.getComments());
		pstmt.setInt(2,  art.getIdx());
		
		pstmt.executeUpdate();
	
	}

	//3. 지정된 idx에 해당하는 DB에 저장된 레코드를 반환하는 getRecord() 선언
	//   @param : int
	//	 @return : Article
	//	@throws : SQLException
	public comment_Article getRecord(int idx) throws SQLException {
		String sql = "SELECT comments FROM comment WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		rs=pstmt.executeQuery();
		rs.next();
		
		comment_Article art = new comment_Article();
		art.setComments(rs.getString("comments"));
		art.setIdx(idx);
		return art;
	}
	
	
	
	
	//4. 지정된 idx에 해당하는 레코드 삭제 deleteRecord() 선언
	//	@param : int
	//	@return : void
	//	@throws : SQLException
	public void deleteRecord(int commentIdx) throws SQLException {
		String sql ="DELETE FROM comment WHERE commentIdx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, commentIdx);
		pstmt.executeUpdate();
	}
	
	
	
	//5. open된 모든 연결자 정보를 제거
	//   @param is'nt 
	//   @return void
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}
}
