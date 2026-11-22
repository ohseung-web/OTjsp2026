package DBPKG;

import java.sql.*;

public class Util {

	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "system", "1234");
		
		return con;
	}
}
