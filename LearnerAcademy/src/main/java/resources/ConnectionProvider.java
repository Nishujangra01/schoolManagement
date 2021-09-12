package resources;

import java.sql.*;
public class ConnectionProvider {
public static Connection getCon() {
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql//localhost:3306/learnerAcademy" ,"root", "12345"  ); 
		return con;
	} catch (Exception e) {
		// TODO: handle exception
		System.out.println(e);
		return null;
	}
	
}
}
