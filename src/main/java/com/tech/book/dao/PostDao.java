package com.tech.book.dao;

import java.sql.*;
import java.util.ArrayList;

import com.tech.book.entities.Category;
import com.tech.book.entities.Post;

public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	@SuppressWarnings("null")
	public ArrayList<Category> getAllCategories(){
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			
			String query = "select * from categories";
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				int cId = rs.getInt("cId");
				String cName = rs.getString("cName");
				String cDescription = rs.getString("cDescription");
				
				Category c = new Category(cId,cName,cDescription);
				list.add(c);
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean savePost(Post post) {
		boolean isPostUploaded = false;
		
		try {
			String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1,post.getpTitle());
			pstmt.setString(2,post.getpContent());
			pstmt.setString(3,post.getpCode());
			pstmt.setString(4,post.getpPic());
			pstmt.setInt(5,post.getCatId());
			pstmt.setInt(6,post.getUserId());
			
			pstmt.executeUpdate();
			isPostUploaded = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isPostUploaded;
	}
}
