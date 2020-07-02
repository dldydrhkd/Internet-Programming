/**
 * 
 */
package mybean.db;

import javax.naming.*;
import javax.sql.DataSource;
import java.sql.SQLException;
import java.sql.Connection;

/**
 * @author lyk
 *
 */
public class DsCon {
	public static Connection getConnection() throws SQLException, NamingException{
		Context initContext = new InitialContext();
		DataSource ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/mydbTest");
		return ds.getConnection();
	}
}
