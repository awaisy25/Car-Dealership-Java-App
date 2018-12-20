//java file to create the sql connection
package Code;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLConn{
	//method to connect to mySQL. Used J connector my-sql-connector-java-5.1.47
	public Connection getConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Database is called Car Dealer ship in mysql 
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Car Dealership","root","");
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	}
	
