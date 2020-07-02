package mybean.db;


import java.sql.*;
import javax.naming.NamingException;
import mybean.db.DsCon;	//필요 패키지 선언

public class sns_ArticleDB {
	private Connection con;	
	private PreparedStatement pstmt;
	private ResultSet rs;

	//1. 생성자 선언 : Connection 인스턴스가 생성되도록 한다.
	public sns_ArticleDB() throws SQLException, NamingException{
		con =DsCon.getConnection();
	}
	
	public void insertRecord(sns_Article art) throws SQLException {
		if(art.getFileName3()==null && art.getFileName1()!=null && art.getFileName2()!=null) {
			String sql = "INSERT INTO sns(title, name, pwd, fileName1, fileName2, content) VALUES(?, ?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, art.getTitle());
			pstmt.setString(2, art.getName());
			pstmt.setString(3, art.getPwd());
			pstmt.setString(4, art.getFileName1());
			pstmt.setString(5,  art.getFileName2());
			pstmt.setString(6, art.getContent());
		
			pstmt.executeUpdate();
		}
		else if(art.getFileName2()==null && art.getFileName1()!=null) {
			
			String sql = "INSERT INTO sns(title, name, pwd, fileName1, content) VALUES(?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, art.getTitle());
			pstmt.setString(2, art.getName());
			pstmt.setString(3, art.getPwd());
			pstmt.setString(4, art.getFileName1());
			pstmt.setString(5, art.getContent());
		
			pstmt.executeUpdate();
			
		}else if(art.getFileName3()!=null) {
			
			String sql = "INSERT INTO sns(title, name, pwd, fileName1,fileName2, fileName3, content) VALUES(?, ?, ?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, art.getTitle());
			pstmt.setString(2, art.getName());
			pstmt.setString(3, art.getPwd());
			pstmt.setString(4, art.getFileName1());
			pstmt.setString(5, art.getFileName2());
			pstmt.setString(6, art.getFileName3());
			pstmt.setString(7, art.getContent());
		
			pstmt.executeUpdate();
		}
		else {
			String sql = "INSERT INTO sns(title, name, pwd, content) VALUES(?, ?, ?, ?)";

			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, art.getTitle());
			pstmt.setString(2, art.getName());
			pstmt.setString(3, art.getPwd());
			pstmt.setString(4, art.getContent());
		
			pstmt.executeUpdate();
		}
		
	}	

	//2. DB에 레코드 갱신을 위한 updateRecord() 메소드 선언
	//   @param : Article
	//   @return : void

	public void updateRecord(sns_Article art) throws SQLException {
		String sql = "UPDATE sns SET title=?, name=?, pwd=?, fileName1=?, fileName2=?, content=? WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, art.getTitle());
		pstmt.setString(2, art.getName());
		pstmt.setString(3, art.getPwd());
		pstmt.setString(4,  art.getFileName1());
		pstmt.setString(5,  art.getFileName2());
		pstmt.setString(6,  art.getContent());
		pstmt.setInt(7, art.getIdx());
		
		pstmt.executeUpdate();
	
	}

	//3. 지정된 idx에 해당하는 DB에 저장된 레코드를 반환하는 getRecord() 선언
	//   @param : int
	//	 @return : Article
	//	@throws : SQLException
	public sns_Article getRecord(int idx) throws SQLException {
		String sql = "SELECT * FROM sns WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		rs=pstmt.executeQuery();
		rs.next();
		
		sns_Article art = new sns_Article();
		art.setTitle(rs.getString("title"));
		art.setName(rs.getString("name"));
		art.setPwd(rs.getString("pwd"));
		art.setFileName1(rs.getString("fileName1"));
		art.setFileName2(rs.getString("fileName2"));
		art.setContent(rs.getString("content"));
		art.setCreation_time(rs.getString("creation_time"));
		art.setLike_point(rs.getInt("like_point"));
		art.setView_point(rs.getInt("view_point"));
		art.setComment_num(rs.getInt("comment_num"));
		art.setIdx(idx);
		return art;
	}
	
	
	//4. 지정된 idx에 해당하는 레코드 삭제 deleteRecord() 선언
	//	@param : int
	//	@return : void
	//	@throws : SQLException
	public void deleteRecord(int idx) throws SQLException {
		String sql ="DELETE FROM sns WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
	}
	
	public int searchRecord(String fileName1) throws SQLException{
		String sql="SELECT idx FROM sns WHERE fileName1=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, fileName1);
		
		rs=pstmt.executeQuery();
		rs.next();
	
		return rs.getInt("idx");
	}
	
	public void increase_view(int idx) throws SQLException{
		String sql="SELECT view_point FROM sns WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		
		rs=pstmt.executeQuery();
		rs.next();
		int temp=rs.getInt("view_point");
		
		sql="UPDATE sns SET view_point=? WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, temp+1);
		pstmt.setInt(2, idx);
		
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