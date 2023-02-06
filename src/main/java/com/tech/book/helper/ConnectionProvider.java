package com.tech.book.helper;

import java.sql.*;

public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			
			if(con==null) {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techbook","root","Mdqasim@786k");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
