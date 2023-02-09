package com.tech.book.dao;

import com.tech.book.entities.User;
import java.sql.*;

import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
@SuppressWarnings("deprecation")
public class UserDao {
	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}

	public boolean saveUser(User user) {
		boolean f = false;
		try {
			//User database
			String query = "insert into users(name,email,password,gender,about) values(?,?,?,?,?)";
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
	public User getUserByEmailAndPassword(String email,String password) {
		User user = null;
		try {
			//Getting user
			String query = "select * from users where email=? and password=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				//set values to user object
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate").toLocaleString());
				user.setProfile(rs.getString("profile"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	public boolean updateUser(User user) {
		boolean isUpdated = false;
		try {
			String query = "update users set name=?, email=?, password=?, gender=?,about=?, profile=? where id=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());
			
			pstmt.executeUpdate();
			isUpdated = true;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return isUpdated;
	}
	

	@SuppressWarnings("null")
	public User getUserByUserId(int userId) {
		User user = null;
		try {
			
			String query = "select * from users where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new User();
				user.setId(userId);
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate").toLocaleString());
				user.setProfile(rs.getString("profile"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user;
	}
}
