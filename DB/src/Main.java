import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class Main {
    public static void main(String[] args) throws Exception {

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("Where is your PostgreSQL JDBC Driver? Include in your library path!");
            e.printStackTrace();
            return;
        }
        System.out.println("PostgreSQL JDBC Driver Registered!");
        /// if you have a error in this part, check jdbc driver(.jar file)

        Connection connection = null;
        Statement stat = null;
        ResultSet rs = null;

        try {
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://127.0.0.1:5432/project_movie", "postgres", "cse3207");
        } catch (SQLException e) {
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return;
        }
        /// if you have a error in this part, check DB information (db_name, user name, password)

        if (connection != null) {
            System.out.println(connection);
            System.out.println("You made it, take control your database now!");
        } else {
            System.out.println("Failed to make connection!");
        }

        stat = connection.createStatement();
        
        try {
        	stat.execute("CREATE TABLE IF NOT EXISTS director"
            		+ "(directorID int,"
            		+ "directorName varchar(50),"
            		+ "dateOfBirth date, "
            		+ "dateOfDeath date, "
            		+ "primary key(directorID))");
            //director
            
            stat.execute("CREATE TABLE IF NOT EXISTS actor"
            		+ "(actorID int, "
            		+ "actorName varchar(50), "
            		+ "dateOfBirth date,"
            		+ "dateOfDeath date, "
            		+ "gender varchar(6), "
            		+ "primary key(actorID))");
            //actor
            
            stat.execute("CREATE TABLE IF NOT EXISTS movie"
            		+ "(movieID int, "
            		+ "movieName varchar(50), "
            		+ "releaseYear int, "
            		+ "releaseMonth int,"
            		+ "releaseDate int, "
            		+ "publisherName varchar(50), "
            		+ "avgRate numeric(4,2), "
            		+ "primary key(movieID))");
            //movie
            
            stat.execute("CREATE TABLE IF NOT EXISTS customer"
            		+ "(customerID int,"
            		+ "customerName varchar(50), "
            		+ "dateOfBirth date, "
            		+ "gender varchar(6),"
            		+ "primary key(customerID))");
            //customer
            
            stat.execute("CREATE TABLE IF NOT EXISTS award"
            		+ "(awardID int,"
            		+ " awardName varchar(50),"
            		+ " primary key(awardID))");
            //award
            
            stat.execute("CREATE TABLE IF NOT EXISTS genre"
            		+ "(genreName varchar(50),"
            		+ " primary key(genreName))");
            //genre
            
            stat.execute("CREATE TABLE IF NOT EXISTS movieGenre"
            		+ "(movieID int,"
            		+ " genreName varchar(50),"
            		+ " primary key(movieID, genreName),"
            		+ " foreign key(movieID) references movie(movieID) on delete cascade,"
            		+ " foreign key(genreName) references genre)");
            //movieGenre
            
            stat.execute("CREATE TABLE IF NOT EXISTS movieObtain"
            		+ "(movieID int, "
            		+ "awardID int, "
            		+ "year int, "
            		+ "primary key(movieID, awardID),"
            		+ "foreign key(movieID) references movie on delete cascade,"
            		+ "foreign key(awardID) references award)");
            //movieObtain
            
            stat.execute("CREATE TABLE IF NOT EXISTS actorObtain"
            		+ "(actorID int, "
            		+ "awardID int, "
            		+ "year int, "
            		+ "primary key(actorID, awardID),"
            		+ "foreign key(actorID) references actor on delete cascade,"
            		+ "foreign key(awardID) references award)");
            //actorObtain
            
            stat.execute("CREATE TABLE IF NOT EXISTS directorObtain"
            		+ "(directorID int, "
            		+ "awardID int, "
            		+ "year int, "
            		+ "primary key(directorID, awardID),"
            		+ "foreign key(directorID) references director on delete cascade,"
            		+ "foreign key(awardID) references award)");
            //directorObtain
            
            stat.execute("CREATE TABLE IF NOT EXISTS casting"
            		+ "(movieID int, "
            		+ "actorID int, "
            		+ "role varchar(50), "
            		+ "primary key(movieID, actorID),"
            		+ "foreign key(movieID) references movie on delete cascade,"
            		+ "foreign key(actorID) references actor)");
            //casting
            
            stat.execute("CREATE TABLE IF NOT EXISTS make"
            		+ "(movieID int, "
            		+ "directorID int, "
            		+ "primary key(movieID, directorID),"
            		+ "foreign key(movieID) references movie on delete cascade,"
            		+ "foreign key(directorID) references director)");
            //make
            
            stat.execute("CREATE TABLE IF NOT EXISTS customerRate"
            		+ "(customerID int, "
            		+ "movieID int, "
            		+ "rate numeric(4,2), "
            		+ "primary key(customerID, movieID),"
            		+ "foreign key(customerID) references customer(customerID) on delete cascade,"
            		+ "foreign key(movieID) references movie on delete cascade)");
            //customerRate
        	
        } catch (SQLException e) {
        	System.out.println("Wrong statement");
        	e.printStackTrace();
        	return;
        }
        
    
        
        try {
        	stat.executeUpdate("INSERT INTO director VALUES(1,'Tim Burton','1958-08-25',null) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO director VALUES(2,'David Fincher','1962-08-28',null) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO director VALUES(3,'Christopher Nolan','1970-07-30',null) ON CONFLICT DO NOTHING");
            //update director data
            
            stat.executeUpdate("INSERT INTO actor VALUES(1,'Johnny Depp','1963-06-09',null,'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(2,'Winona Ryder','1971-10-29',null,'Female') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(3,'Anne Hathaway','1982-11-12',null,'Female') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(4,'Christian Bale','1974-01-30',null,'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(5,'Heath Ledger','1979-04-04','2008-01-22','Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(6,'Jesse Eisenberg','1983-10-05',null,'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(7,'Andrew Garfield','1983-08-20',null,'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(8,'Fionn Whitehead','1997-07-18',null,'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO actor VALUES(9,'Tom Hardy','1977-09-15',null,'Male') ON CONFLICT DO NOTHING");
            //update actor data
            
            stat.executeUpdate("INSERT INTO movie VALUES(1,'Edward Scissorhands', 1991, 6, 29, '20th Century Fox Presents',0) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movie VALUES(2,'Alice In Wonderland', 2010, 3, 4, 'Korea Sony Pictures',0) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movie VALUES(3,'The Social Networks', 2010, 11, 18, 'Korea Sony Pictures',0) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movie VALUES(4,'The Dark Knight', 2008, 8, 6, 'Warner Brothers Korea',0) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movie VALUES(5,'Dunkirk', 2017, 7, 13, 'Warner Brothers Korea',0) ON CONFLICT DO NOTHING");
            //update movie data
            
            stat.executeUpdate("INSERT INTO customer VALUES(1,'Bob', '1997-11-14', 'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO customer VALUES(2,'John', '1978-01-23', 'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO customer VALUES(3,'Jack', '1980-05-04', 'Male') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO customer VALUES(4,'Jill', '1981-04-17', 'Female') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO customer VALUES(5,'Bell', '1990-05-14', 'Female') ON CONFLICT DO NOTHING");
            //update customer data

            
            
            stat.executeUpdate("INSERT INTO genre VALUES('Fantasy') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('Romance') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('Adventure') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('Family') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('Drama') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('Action') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('Mystery') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('Thriller') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO genre VALUES('War') ON CONFLICT DO NOTHING");
            //update genre data
            
            stat.executeUpdate("INSERT INTO movieGenre VALUES(1,'Fantasy') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(1,'Romance') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(2,'Fantasy') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(2,'Adventure') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(2,'Family') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(3,'Drama') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(4,'Action') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(4,'Drama') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(4,'Mystery') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(4,'Thriller') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(5,'Action') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(5,'Drama') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(5,'Thriller') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO movieGenre VALUES(5,'War') ON CONFLICT DO NOTHING");
            //update movieGenre data
            
            stat.executeUpdate("INSERT INTO casting VALUES(1, 1, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(1, 2, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(2, 1, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(2, 3, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(3, 6, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(3, 7, 'Supporting Actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(4, 4, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(4, 5, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(5, 8, 'Main actor') ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO casting VALUES(5, 9, 'Main actor') ON CONFLICT DO NOTHING");
            //update casting data
            
            stat.executeUpdate("INSERT INTO make VALUES(1,1) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO make VALUES(2,1) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO make VALUES(3,2) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO make VALUES(4,3) ON CONFLICT DO NOTHING");
            stat.executeUpdate("INSERT INTO make VALUES(5,3) ON CONFLICT DO NOTHING");
            //update make data
            
            System.out.println("1. Initial data is updated");
        	
        } catch(SQLException e) {
        	System.out.println("Wrong statement");
        	e.printStackTrace();
        	return;
        }
        System.out.println("\n");
        
        
        System.out.println("2.1.Statement : Winona Ryder won the \"Best supporting actor\" award in 1994");
        System.out.println("Translated SQL : INSERT INTO award VALUES (1,'Best supporting actor') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO actorObtain VALUES (2, 1, 1994) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best supporting actor'");
        System.out.println("Translated SQL : SELECT * FROM actorObtain WHERE actorID=2");
        
        stat.executeUpdate("INSERT INTO award VALUES (1,'Best supporting actor') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO actorObtain VALUES (2, 1, 1994) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best supporting actor'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        String id = String.format("%-30s", "|awardID");
        String name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM actorObtain WHERE actorID=2");
        System.out.println("\n");
        System.out.println("actorObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|actorID")+String.format("%-30s", "|awardID")+String.format("%-20s", "|year"));
        while(rs.next()) {
        	String actorID=String.format("%-30s", "|"+Integer.toString(rs.getInt("actorID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(actorID+awardID+year);
        }
        System.out.println("\n");
        
        System.out.println("2.2.Statement : AndrewGarfield won the \"Best supporing acotr\" award in 2011");
        System.out.println("Translated SQL : INSERT INTO award VALUES (1,'Best supporting actor') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO actorObtain VALUES (7, 1, 2011) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best supporting actor'");
        System.out.println("Translated SQL : SELECT * FROM actorObtain WHERE actorID=7");
        
        stat.executeUpdate("INSERT INTO award VALUES (1,'Best supporting actor') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO actorObtain VALUES (7, 1, 2011) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best supporting actor'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        id = String.format("%-30s", "|awardID");
        name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM actorObtain WHERE actorID=7");
        System.out.println("\n");
        System.out.println("actorObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|actorID")+String.format("%-30s", "|awardID")+String.format("%-30s", "|year"));
        while(rs.next()) {
        	String actorID=String.format("%-30s", "|"+Integer.toString(rs.getInt("actorID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(actorID+awardID+year);
        }
        System.out.println("\n");
        
        System.out.println("2.3.Statement : Jesse Eisenberg won the \"Best main actor\" award in 2011");
        System.out.println("Translated SQL : INSERT INTO award VALUES (2,'Best main actor') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO actorObtain VALUES (6, 2, 2011) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best main actor'");
        System.out.println("Translated SQL : SELECT * FROM actorObtain WHERE actorID=6");
        
        stat.executeUpdate("INSERT INTO award VALUES (2,'Best main actor') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO actorObtain VALUES (6, 2, 2011) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best main actor'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        id = String.format("%-30s", "|awardID");
        name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM actorObtain WHERE actorID=6");
        System.out.println("\n");
        System.out.println("actorObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|actorID")+String.format("%-30s", "|awardID")+String.format("%-30s", "|year"));
        while(rs.next()) {
        	String actorID=String.format("%-30s", "|"+Integer.toString(rs.getInt("actorID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(actorID+awardID+year);
        }
        System.out.println("\n");
        
        System.out.println("2.4.Statement : Johnny Depp won the \"Best villain actor\" award in 2011");
        System.out.println("Translated SQL : INSERT INTO award VALUES (3,'Best villain actor') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO actorObtain VALUES (1, 3, 2011) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best villain actor'");
        System.out.println("Translated SQL : SELECT * FROM actorObtain WHERE actorID=1");
        
        stat.executeUpdate("INSERT INTO award VALUES (3,'Best villain actor') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO actorObtain VALUES (1, 3, 2011) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best villain actor'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        id = String.format("%-30s", "|awardID");
        name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM actorObtain WHERE actorID=1");
        System.out.println("\n");
        System.out.println("actorObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|actorID")+String.format("%-30s", "|awardID")+String.format("%-30s", "|year"));
        while(rs.next()) {
        	String actorID=String.format("%-30s", "|"+Integer.toString(rs.getInt("actorID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(actorID+awardID+year);
        }
        System.out.println("\n");
        
        System.out.println("2.5.Statement : Edward Scissorhands won the \"Best fantasy movie\" award in 1991");
        System.out.println("Translated SQL : INSERT INTO award VALUES (4,'Best fantasy movie') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO movieObtain VALUES (1, 4, 1991) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best fantasy movie'");
        System.out.println("Translated SQL : SELECT * FROM movieObtain WHERE movieID=1");
        
        stat.executeUpdate("INSERT INTO award VALUES (4,'Best fantasy movie') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO movieObtain VALUES (1, 4, 1991) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best fantasy movie'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        id = String.format("%-30s", "|awardID");
        name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM movieObtain WHERE movieID=1");
        System.out.println("\n");
        System.out.println("movieObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|awardID")+String.format("%-30s", "|year"));
        while(rs.next()) {
        	String movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(movieID+awardID+year);
        }
        System.out.println("\n");
        
        System.out.println("2.6.Statement : The Dark Knight won the \"Best picture\" award in 2009");
        System.out.println("Translated SQL : INSERT INTO award VALUES (5,'Best picture') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO movieObtain VALUES (4, 5, 2009) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best picture'");
        System.out.println("Translated SQL : SELECT * FROM movieObtain WHERE movieID=4");
        
        stat.executeUpdate("INSERT INTO award VALUES (5,'Best picture') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO movieObtain VALUES (4, 5, 2009) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best picture'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        id = String.format("%-30s", "|awardID");
        name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM movieObtain WHERE movieID=4");
        System.out.println("\n");
        System.out.println("movieObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|awardID")+String.format("%-30s", "|year"));
        while(rs.next()) {
        	String movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(movieID+awardID+year);
        }
        System.out.println("\n");
      
        System.out.println("2.7.Statement : Alice In Wonderland won the \"Best fantasy movie\" award in 2011");
        System.out.println("Translated SQL : INSERT INTO award VALUES (4,'Best fantasy movie') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO movieObtain VALUES (2, 4, 2011) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best fantasy movie'");
        System.out.println("Translated SQL : SELECT * FROM movieObtain WHERE movieID=2");
        
        stat.executeUpdate("INSERT INTO award VALUES (4,'Best fantasy movie') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO movieObtain VALUES (2, 4, 2011) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best fantasy movie'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        id = String.format("%-30s", "|awardID");
        name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM movieObtain WHERE movieID=2");
        System.out.println("\n");
        System.out.println("movieObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|awardID")+String.format("%-30s", "|year"));
        while(rs.next()) {
        	String movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(movieID+awardID+year);
        }
        System.out.println("\n");
        
        System.out.println("2.8.Statement : David Fincher wont the \"Best director\" award in 2011");
        System.out.println("Translated SQL : INSERT INTO award VALUES (6,'Best director') ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO directorObtain VALUES (2, 6, 2011) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : SELECT * FROM award WHERE awardName='Best director'");
        System.out.println("Translated SQL : SELECT * FROM directorObtain WHERE directorID=2");
        
        stat.executeUpdate("INSERT INTO award VALUES (6,'Best director') ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO directorObtain VALUES (2, 6, 2011) ON CONFLICT DO NOTHING");
        rs = stat.executeQuery("SELECT * FROM award WHERE awardName='Best director'");
        System.out.println("\n");
        System.out.println("award table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        id = String.format("%-30s", "|awardID");
        name= String.format("%-30s", "|awardName");
        System.out.println(id+name);
        while(rs.next()) {
        	String awardId=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	String awardName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(awardId+awardName);
        }
        rs=stat.executeQuery("SELECT * FROM directorObtain WHERE directorID=2");
        System.out.println("\n");
        System.out.println("directorObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|directorID")+String.format("%-30s", "|awardID")+String.format("%-30s", "|year"));
        while(rs.next()) {
        	String directorID=String.format("%-30s", "|"+Integer.toString(rs.getInt("directorID")));
        	String awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt("awardID")));
        	String year=String.format("%-30s", "|"+Integer.toString(rs.getInt("year")));
        	System.out.println(directorID+awardID+year);
        }
        System.out.println("\n");
        
        System.out.println("3.1.Statement : Bob rates 5 to \"The Dark Knight\"");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (1, 4, 5) ON CONFLICT DO NOTIHING");
        System.out.println("Translated SQL : UPDATE movie SET avgRate = a.avg_rate "
        		+ "\n\t\tFROM (SELECT AVG(rate) as avg_rate, movieID from customerRate group by movieID) as a where a.movieID=movie.movieID");
        System.out.println("Translated SQL : SELECT * FROM customerRate WHERE customerID=1");
        System.out.println("Translated SQL : SELECT movieID, movieName, avgRate FROM movie WHERE movieID=4");
        
        stat.executeUpdate("INSERT INTO customerRate VALUES (1,4,5) ON CONFLICT DO NOTHING");
        stat.executeUpdate("UPDATE movie SET avgRate = a.avg_rate \n" + 
        		"FROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a \n" + 
        		"WHERE a.movieID=movie.movieID");
        rs = stat.executeQuery("SELECT * FROM customerRate WHERE customerID=1");
        System.out.println("\n");
        System.out.println("customerRate table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        String customerID = String.format("%-30s", "|customerID");
        String movieID= String.format("%-30s", "|movieID");
        String rate= String.format("%-30s", "|rate");
        System.out.println(customerID+movieID+rate);
        while(rs.next()) {
        	customerID=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	rate=String.format("%-30s", "|"+Integer.toString(rs.getInt(3)));
        	System.out.println(customerID+movieID+rate);
        }
        rs=stat.executeQuery("SELECT movieID, movieName, avgRate FROM movie WHERE movieID=4");
        System.out.println("\n");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|movieName")+String.format("%-30s", "|avgRate"));
        while(rs.next()) {
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String movieName=String.format("%-30s", "|"+rs.getString("movieName"));
        	String avgRate=String.format("%-30s", "|"+Float.toString(rs.getFloat("avgRate")));
        	System.out.println(movieID+movieName+avgRate);
        }
        System.out.println("\n");
        
        System.out.println("3.2.Statement : Bell rates 5 to the movies whose director is \"Tim Burton\"");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (5,1,5) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (5,2,5) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : UPDATE movie SET avgRate = a.avg_rate "
        		+ "\n\t\tFROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a WHERE a.movieID=movie.movieID");
        System.out.println("Translated SQL : SELECT * FROM customerRate WHERE customerID=5");
        System.out.println("Translated SQL : SELECT movieID, movieName, avgRate FROM movie JOIN make "
        		+ "\n\t\tON movie.movieID=make.movieID WHERE directorID=1");
        
        stat.executeUpdate("INSERT INTO customerRate VALUES (5,1,5) ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO customerRate VALUES (5,2,5) ON CONFLICT DO NOTHING");
        stat.executeUpdate("UPDATE movie SET avgRate = a.avg_rate \n" + 
        		"FROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a \n" + 
        		"WHERE a.movieID=movie.movieID");
        rs = stat.executeQuery("SELECT * FROM customerRate WHERE customerID=5");
        System.out.println("\n");
        System.out.println("customerRate table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        customerID = String.format("%-30s", "|customerID");
        movieID= String.format("%-30s", "|movieID");
        rate= String.format("%-30s", "|rate");
        System.out.println(customerID+movieID+rate);
        while(rs.next()) {
        	customerID=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	rate=String.format("%-30s", "|"+Integer.toString(rs.getInt(3)));
        	System.out.println(customerID+movieID+rate);
        }
        rs=stat.executeQuery("SELECT movie.movieID, movieName, avgRate FROM movie JOIN make ON movie.movieID=make.movieID WHERE directorID=1");
        System.out.println("\n");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|movieName")+String.format("%-30s", "|avgRate"));
        while(rs.next()) {
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String movieName=String.format("%-30s", "|"+rs.getString("movieName"));
        	String avgRate=String.format("%-30s", "|"+Float.toString(rs.getFloat("avgRate")));
        	System.out.println(movieID+movieName+avgRate);
        }
        System.out.println("\n");
        
        System.out.println("3.3.Statement : Jill rates 4 to the movies whose main actor is female");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (4,1,4) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (4,2,4) ON COUNFLICT DO NOTHING");
        System.out.println("Translated SQL : UPDATE movie SET avgRate = a.avg_rate "
        		+ "\n\t\tFROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a where a.movieID=movie.movieID");
        System.out.println("Translated SQL : SELECT * FROM customerRate WHERE customerID=4");
        System.out.println("Translated SQL : SELECT a.movieID, a.movieName, a.avgRate "
        		+ "\n\t\tFROM movie a,casting b,actor c WHERE a.movieID=b.movieID AND c.actorID=b.actorID AND c.gender='Female'");
        
        stat.executeUpdate("INSERT INTO customerRate VALUES (4,1,4) ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO customerRate VALUES (4,2,4) ON CONFLICT DO NOTHING");
        stat.executeUpdate("UPDATE movie SET avgRate = a.avg_rate \n" + 
        		"FROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a \n" + 
        		"WHERE a.movieID=movie.movieID");
        rs = stat.executeQuery("SELECT * FROM customerRate WHERE customerID=4");
        System.out.println("\n");
        System.out.println("customerRate table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        customerID = String.format("%-30s", "|customerID");
        movieID= String.format("%-30s", "|movieID");
        rate= String.format("%-30s", "|rate");
        System.out.println(customerID+movieID+rate);
        while(rs.next()) {
        	customerID=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	rate=String.format("%-30s", "|"+Integer.toString(rs.getInt(3)));
        	System.out.println(customerID+movieID+rate);
        }
        rs=stat.executeQuery("SELECT a.movieID, a.movieName, a.avgRate \n" + 
        		"FROM movie a,casting b,actor c WHERE a.movieID=b.movieID AND c.actorID=b.actorID AND c.gender='Female'");
        System.out.println("\n");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|movieName")+String.format("%-30s", "|avgRate"));
        while(rs.next()) {
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String movieName=String.format("%-30s", "|"+rs.getString("movieName"));
        	String avgRate=String.format("%-30s", "|"+Float.toString(rs.getFloat("avgRate")));
        	System.out.println(movieID+movieName+avgRate);
        }
        System.out.println("\n");
        
        System.out.println("3.4.Statement : Jack rates 4 to the fantasy movies");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (3,1,4) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (3,2,4) ON COUNFLICT DO NOTHING");
        System.out.println("Translated SQL : UPDATE movie SET avgRate = a.avg_rate "
        		+ "\n\t\tFROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a where a.movieID=movie.movieID");
        System.out.println("Translated SQL : SELECT * FROM customerRate WHERE customerID=3");
        System.out.println("Translated SQL : SELECT a.movieID, a.movieName, a.avgRate FROM movie a JOIN movieGenre b ON a.movieID=b.movieID WHERE b.genreName='Fantasy'");
        
        stat.executeUpdate("INSERT INTO customerRate VALUES (3,1,4) ON CONFLICT DO NOTHING");
        stat.executeUpdate("INSERT INTO customerRate VALUES (3,2,4) ON CONFLICT DO NOTHING");
        stat.executeUpdate("UPDATE movie SET avgRate = a.avg_rate\n" + 
        		"FROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) as a\n" + 
        		"WHERE a.movieID=movie.movieID");
        rs = stat.executeQuery("SELECT * FROM customerRate WHERE customerID=3");
        System.out.println("\n");
        System.out.println("customerRate table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        customerID = String.format("%-30s", "|customerID");
        movieID= String.format("%-30s", "|movieID");
        rate= String.format("%-30s", "|rate");
        System.out.println(customerID+movieID+rate);
        while(rs.next()) {
        	customerID=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	rate=String.format("%-30s", "|"+Integer.toString(rs.getInt(3)));
        	System.out.println(customerID+movieID+rate);
        }
        rs=stat.executeQuery("SELECT a.movieID, a.movieName, a.avgRate FROM movie a JOIN movieGenre b on a.movieID=b.movieID WHERE b.genreName='Fantasy'");
        System.out.println("\n");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|movieName")+String.format("%-30s", "|avgRate"));
        while(rs.next()) {
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String movieName=String.format("%-30s", "|"+rs.getString("movieName"));
        	String avgRate=String.format("%-30s", "|"+Float.toString(rs.getFloat("avgRate")));
        	System.out.println(movieID+movieName+avgRate);
        }
        System.out.println("\n");
        
        System.out.println("3.5.Statement : John rates 5 to the movies whose director won the \"Best director\" award");
        System.out.println("Translated SQL : INSERT INTO customerRate VALUES (2,3,5) ON CONFLICT DO NOTHING");
        System.out.println("Translated SQL : UPDATE movie SET avgRate = a.avg_rate "
        		+ "FROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a where a.movieID=movie.movieID");
        System.out.println("Translated SQL : SELECT * FROM customerRate WHERE customerID=2");
        System.out.println("Translated SQL : SELECT a.movieID, a.movieName, a.avgRate "
        		+ "\n\t\tFROM movie a, make b, directorObtain c, award d "
        		+ "\n\t\tWHERE a.movieID=b.movieID AND b.directorID=c.directorID AND d.awardID=c.awardID AND d.awardName='Best director'");
        
        stat.executeUpdate("INSERT INTO customerRate VALUES (2,3,5) ON CONFLICT DO NOTHING");
        stat.executeUpdate("UPDATE movie SET avgRate = a.avg_rate \n" + 
        		"FROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a \n" + 
        		"WHERE a.movieID=movie.movieID");
        rs = stat.executeQuery("SELECT * FROM customerRate WHERE customerID=2");
        System.out.println("\n");
        System.out.println("customerRate table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        customerID = String.format("%-30s", "|customerID");
        movieID= String.format("%-30s", "|movieID");
        rate= String.format("%-30s", "|rate");
        System.out.println(customerID+movieID+rate);
        while(rs.next()) {
        	customerID=String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	rate=String.format("%-30s", "|"+Integer.toString(rs.getInt(3)));
        	System.out.println(customerID+movieID+rate);
        }
        rs=stat.executeQuery("SELECT a.movieID, a.movieName, a.avgRate \n" + 
        		"FROM movie a, make b, directorObtain c, award d \n" + 
        		"WHERE a.movieID=b.movieID AND b.directorID=c.directorID AND d.awardID=c.awardID AND d.awardName='Best director'");
        System.out.println("\n");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        System.out.println(String.format("%-30s", "|movieID")+String.format("%-30s", "|movieName")+String.format("%-30s", "|avgRate"));
        while(rs.next()) {
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt("movieID")));
        	String movieName=String.format("%-30s", "|"+rs.getString("movieName"));
        	String avgRate=String.format("%-30s", "|"+Float.toString(rs.getFloat("avgRate")));
        	System.out.println(movieID+movieName+avgRate);
        }
        System.out.println("\n");
        
        System.out.println("4.Statement : Select the names of the movies whose actor are dead");
        System.out.println("Translated SQL : SELECT actorName FROM actor WHERE dateOfDeath IS NOT NULL");
        
        rs = stat.executeQuery("SELECT actorName FROM actor WHERE dateOfDeath IS NOT NULL");
        System.out.println("\n");
        System.out.println("actor table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        String actorName = String.format("%-30s", "|actorName");
        System.out.println(actorName);
        while(rs.next()) {
        	actorName=String.format("%-30s", "|"+rs.getString(1));
        	System.out.println(actorName);
        }
        System.out.println("\n");
        
        System.out.println("5.Statement : Select the names of the directors who cast the same actor more than once");
        System.out.println("Translated SQL : SELECT b.directorName FROM(SELECT directorID, actorID "
        		+ "\n\t\tFROM casting JOIN make ON casting.movieID=make.movieID) AS a, director AS b"
        		+ "\n\t\tWHERE a.directorID=b.directorID GROUP BY a.directorID, a.actorID, b.directorName HAVING COUNT(*)>1");
        
        rs = stat.executeQuery("SELECT b.directorName \n" + 
        		"FROM(SELECT directorID, actorID FROM casting JOIN make ON casting.movieID=make.movieID) AS a, director AS b \n" + 
        		"WHERE a.directorID=b.directorID \n" + 
        		"GROUP BY a.directorID, a.actorID, b.directorName \n" + 
        		"HAVING COUNT(*)>1");
        System.out.println("\n");
        System.out.println("director table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        String directorName = String.format("%-30s", "|directorName");
        System.out.println(directorName);
        while(rs.next()) {
        	directorName=String.format("%-30s", "|"+rs.getString(1));
        	System.out.println(directorName);
        }
        System.out.println("\n");
        
        
        System.out.println("6.Statement : Select the names of the movies and the genres, where movies have the common genre");
        System.out.println("Translated SQL : SELECT DISTINCT movieName, c.genreName "
        		+ "\n\t\tFROM(SELECT a.movieID, a.genreName "
        		+ "\n\t\t\tFROM movieGenre AS a, movieGenre AS b WHERE a.mobieID!=b.movieID AND a.genreName=b.genreName) AS c, movie"
        		+ "\n\t\tWHERE movie.movieID=c.movieID ORDER BY genreName");
        
        rs = stat.executeQuery("SELECT DISTINCT movieName, c.genreName \n" + 
        		"FROM (SELECT a.movieID, a.genreName \n" + 
        		"	  FROM movieGenre AS a, movieGenre AS b \n" + 
        		"	  WHERE a.movieID!=b.movieID AND a.genreName=b.genreName) AS c, movie \n" + 
        		"WHERE movie.movieID=c.movieID \n" + 
        		"ORDER BY genreName");
        System.out.println("\n");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        String movieName = String.format("%-30s", "|movieName");
        String genreName = String.format("%-30s", "|genreName");
        System.out.println(movieName+genreName);
        while(rs.next()) {
        	movieName=String.format("%-30s", "|"+rs.getString(1));
        	genreName=String.format("%-30s", "|"+rs.getString(2));
        	System.out.println(movieName+genreName);
        }
        System.out.println("\n");
        
        
        System.out.println("7.Statement : Delete the movies which did not get any award (including all directors and actors) and delete data from related tables");
        System.out.println("Translated SQL : DELETE FROM movie WHERE NOT (movieID,movieName) IN"
        		+ "\n\t\t((SELECT movie.movieID, movie.movieName FROM movie NATURAL movieObtain)"
        		+ "\n\t\tUNION"
        		+ "\n\t\t(SELECT movie.movieID, movie.movieName FROM movie NATURAL JOIN (SELECT casting.movieID FROM casting NATRUAL JOIN actorObtain) AS a)"
        		+ "\n\t\tUNION"
        		+ "\n\t\t(SELECT movie.movieID, movie.movieName FROM movie NATURAL JOIN (SELECT make.movieID FROM make NATURAL JOIN directorObtain) AS a))");
        System.out.println("Translated SQL : SELECT * FROM movie ORDER BY movieID");
        System.out.println("Translated SQL : SELECT * FROM movieGenre");
        System.out.println("Translated SQL : SELECT * FROM movieObtain ORDER BY movieID");
        System.out.println("Translated SQL : SELECT * FROM casting");
        System.out.println("Translated SQL : SELECT * FROM make");
        System.out.println("Translated SQL : SELECT * FROM customerRate ORDER BY customerID");
        
        
        stat.executeUpdate("DELETE FROM movie\n" + 
        		"WHERE NOT (movieID,movieName) IN\n" + 
        		"((SELECT movie.movieID, movie.movieName FROM movie NATURAL JOIN movieObtain)\n" + 
        		"UNION\n" + 
        		"(SELECT movie.movieID, movie.movieName FROM movie NATURAL JOIN\n" + 
        		"(SELECT casting.movieID FROM casting NATURAL JOIN actorObtain) AS a)\n" + 
        		"UNION\n" + 
        		"(SELECT movie.movieID, movie.movieName FROM movie NATURAL JOIN\n" + 
        		"(SELECT make.movieID FROM make NATURAL JOIN directorObtain)AS a))");
        rs=stat.executeQuery("SELECT * FROM movie");
        System.out.println("\n");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------"
        		+ "------------------------------------------------------------------------------------------------------");
        
        movieID = String.format("%-30s", "|movieID");
        movieName = String.format("%-30s", "|movieName");
        String releaseYear = String.format("%-30s", "|releaseYear");
        String releaseMonth = String.format("%-30s", "|releaseMonth");
        String releaseDate = String.format("%-30s", "|releaseDate");
        String publisherName = String.format("%-30s", "|publisherName");
        String avgRate = String.format("%-30s", "|avgRate");
        System.out.println(movieID+movieName+releaseYear+releaseMonth+releaseDate+publisherName+avgRate);
        while(rs.next()) {
        	movieID=String.format("%-30s","|"+Integer.toString(rs.getInt(1)));
        	movieName=String.format("%-30s", "|"+rs.getString(2));
        	releaseYear=String.format("%-30s", "|"+Integer.toString(rs.getInt(3)));
        	releaseMonth=String.format("%-30s", "|"+Integer.toString(rs.getInt(4)));
        	releaseDate=String.format("%-30s", "|"+Integer.toString(rs.getInt(5)));
        	publisherName=String.format("%-30s", "|"+rs.getString(6));
        	avgRate=String.format("%-30s", "|"+Float.toString(rs.getFloat(7)));
        	
        	System.out.println(movieID+movieName+releaseYear+releaseMonth+releaseDate+publisherName+avgRate);
        }
        System.out.println("\n");
        rs=stat.executeQuery("SELECT * FROM movieGenre");
        System.out.println("movieGenre table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        movieID = String.format("%-30s", "|movieID");
        genreName = String.format("%-30s", "|genreName");
        System.out.println(movieID+genreName);
        while(rs.next()) {
        	movieID=String.format("%-30s","|"+Integer.toString(rs.getInt(1)));
        	genreName=String.format("%-30s", "|"+rs.getString(2));
        	
        	System.out.println(movieID+genreName);
        }
        System.out.println("\n");
        rs=stat.executeQuery("SELECT * FROM movieObtain ORDER BY movieID");
        System.out.println("movieObtain table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        movieID = String.format("%-30s", "|movieID");
        String awardID = String.format("%-30s", "|awardID");
        String year = String.format("%-30s", "|year");
        System.out.println(movieID+awardID+year);
        while(rs.next()) {
        	movieID=String.format("%-30s","|"+Integer.toString(rs.getInt(1)));
        	awardID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	year=String.format("%-30s", "|"+Integer.toString(rs.getInt(3)));
        	
        	System.out.println(movieID+awardID+year);
        }
        System.out.println("\n");
        rs=stat.executeQuery("SELECT * FROM casting");
        System.out.println("casting table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        movieID = String.format("%-30s", "|movieID");
        String actorID = String.format("%-30s", "|actorID");
        String role = String.format("%-30s", "|role");
        System.out.println(movieID+actorID+role);
        while(rs.next()) {
        	movieID=String.format("%-30s","|"+Integer.toString(rs.getInt(1)));
        	actorID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	role=String.format("%-30s", "|"+rs.getString(3));
        	
        	System.out.println(movieID+actorID+role);
        }
        System.out.println("\n");
        rs=stat.executeQuery("SELECT * FROM make");
        System.out.println("make table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        movieID = String.format("%-30s", "|movieID");
        String directorID = String.format("%-30s", "|directorID");
        System.out.println(movieID+directorID);
        while(rs.next()) {
        	movieID=String.format("%-30s","|"+Integer.toString(rs.getInt(1)));
        	directorID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	
        	System.out.println(movieID+directorID);
        }
        System.out.println("\n");
        rs=stat.executeQuery("SELECT * FROM customerRate ORDER BY customerID");
        System.out.println("customerRate table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        customerID = String.format("%-30s", "|customerID");
        movieID = String.format("%-30s", "|movieID");
        rate = String.format("%-30s", "|rate");
        System.out.println(customerID+movieID+rate);
        while(rs.next()) {
        	customerID=String.format("%-30s","|"+Integer.toString(rs.getInt(1)));
        	movieID=String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
        	rate=String.format("%-30s", "|"+Float.toString(rs.getFloat(3)));
        	
        	System.out.println(customerID+movieID+rate);
        }
        System.out.println("\n");
        
        System.out.println("8.Statement : Delete all customer and delete data from related tables");
        System.out.println("Translated SQL : DELETE FROM customer");
        System.out.println("Translated SQL : UPDATE movie SET avgRate = a.avg_rate "
        		+ "\n\t\tFROM (SELECT AVG(rate) AS avg_rate, movieID FROM customerRate GROUP BY movieID) AS a "
        		+ "\n\t\tWHERE a.movieID=movie.movieID");
        System.out.println("Translated SQL : SELECT * FROM customer");
        System.out.println("Translated SQL : SELECT * FROM customerRate");
        System.out.println("Translated SQL : SELECT movie.ID, movie.Name, movie.avgRate FROM movie");
        System.out.println("Translated SQL : UPDATE movie SET avgRate=0");
        
        
        stat.executeUpdate("DELETE FROM customer");
        stat.executeUpdate("UPDATE movie SET avgRate=0");
        rs = stat.executeQuery("SELECT * FROM customer");
        System.out.println("\n");
        System.out.println("customer table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        customerID = String.format("%-30s", "|customerID");
        String customerName= String.format("%-30s", "|customerName");
        String dateOfBirth = String.format("%-30s", "|dateOfBirth");
        String gender = String.format("%-30s", "|gender");
        System.out.println(customerID+customerName+dateOfBirth+gender);
        while(rs.next()) {
        	customerID = String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	customerName= String.format("%-30s", "|"+rs.getString(2));
            dateOfBirth = String.format("%-30s", "|"+rs.getString(3));
            gender = String.format("%-30s", "|"+rs.getString(4));
            System.out.println(customerID+customerName+dateOfBirth+gender);
        }
        System.out.println("\n");
        rs=stat.executeQuery("SELECT * FROM customerRate");
        System.out.println("customerRate table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        customerID = String.format("%-30s", "|customerID");
        movieID= String.format("%-30s", "|movieID");
        rate = String.format("%-30s", "|rate");
        System.out.println(customerID+movieID+rate);
        while(rs.next()) {
        	customerID = String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	movieID= String.format("%-30s", "|"+Integer.toString(rs.getInt(2)));
            rate = String.format("%-30s", "|"+Float.toString(rs.getFloat(3)));
            System.out.println(customerID+movieID+rate);
        }
        System.out.println("\n");
        rs=stat.executeQuery("SELECT movieID, movieName, avgRate FROM movie ORDER BY movieID");
        System.out.println("movie table");
        System.out.println("+------------------------------------------------------------------------------------------------------");
        movieID = String.format("%-30s", "|movieID");
        movieName= String.format("%-30s", "|movieName");
        avgRate = String.format("%-30s", "|avgRate");
        System.out.println(movieID+movieName+avgRate);
        while(rs.next()) {
        	movieID = String.format("%-30s", "|"+Integer.toString(rs.getInt(1)));
        	movieName= String.format("%-30s", "|"+rs.getString(2));
            avgRate = String.format("%-30s", "|"+Float.toString(rs.getFloat(3)));
            System.out.println(movieID+movieName+avgRate);
        }
        
        try {
        	stat.executeUpdate("DROP TABLE actorObtain");
        	stat.executeUpdate("DROP TABLE movieObtain");
        	stat.executeUpdate("DROP TABLE directorObtain");
        	stat.executeUpdate("DROP TABLE movieGenre");
        	stat.executeUpdate("DROP TABLE genre");
        	stat.executeUpdate("DROP TABLE make");
        	stat.executeUpdate("DROP TABLE customerRate");
        	stat.executeUpdate("DROP TABLE casting");
        	stat.executeUpdate("DROP TABLE award");
        	stat.executeUpdate("DROP TABLE movie");
        	stat.executeUpdate("DROP TABLE actor");
        	stat.executeUpdate("DROP TABLE director");
        	stat.executeUpdate("DROP TABLE customer");
        	
        	System.out.println("\n");
            System.out.println("All tables are deleted successfully");
        }
        catch(SQLException e) {
        	System.out.println("Some tables are not deleted");
        	e.printStackTrace();
        	return;
        }
        

        rs.close();
        stat.close();
        connection.close();
    } 
}