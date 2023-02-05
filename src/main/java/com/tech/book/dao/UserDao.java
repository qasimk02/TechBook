package com.tech.book.dao;

import com.tech.book.entities.User;
import java.sql.*;

public class UserDao {
	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;
		try {
			//User database
			String query = "insert into user(name,emailId,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.executeUpdate();
			f = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
}
