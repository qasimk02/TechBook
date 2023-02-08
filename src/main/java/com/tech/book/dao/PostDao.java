package com.tech.book.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.book.entities.Category;
import com.tech.book.entities.Post;

@SuppressWarnings("deprecation")
public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	@SuppressWarnings("null")
	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {

			String query = "select * from categories";

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				int cId = rs.getInt("cId");
				String cName = rs.getString("cName");
				String cDescription = rs.getString("cDescription");

				Category c = new Category(cId, cName, cDescription);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post post) {
		boolean isPostUploaded = false;

		try {
			String query = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getpTitle());
			pstmt.setString(2, post.getpContent());
			pstmt.setString(3, post.getpCode());
			pstmt.setString(4, post.getpPic());
			pstmt.setInt(5, post.getCatId());
			pstmt.setInt(6, post.getUserId());

			pstmt.executeUpdate();
			isPostUploaded = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isPostUploaded;
	}

	
	public List<Post> getAllPost() {
		List<Post> list = new ArrayList<>();

		try {

			String query = "select * from posts order by pId desc";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int pId = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				String pDate = rs.getTimestamp("pDate").toLocaleString();
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");

				Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

				// adding every post to list
				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Post> getAllPostByCatId(int catId) {
		List<Post> list = new ArrayList<>();

		try {

			String query = "select * from posts where catId=? order by pId desc";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, catId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int pId = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				String pDate = rs.getTimestamp("pDate").toLocaleString();
				int userId = rs.getInt("userId");

				Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

				// adding every post to list
				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Post> getAllPostByUserId(int userId) {
		List<Post> list = new ArrayList<>();

		try {

			String query = "select * from posts where userId=? order by pId desc";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userId);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int pId = rs.getInt("pId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				String pDate = rs.getTimestamp("pDate").toLocaleString();
				int catId = rs.getInt("catId");

				Post post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);

				// adding every post to list
				list.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public Post getPostByPostId(int pId) {
		Post post = null;

		try {

			String query = "select * from posts where pId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("pPic");
				String pDate = rs.getTimestamp("pDate").toLocaleString();
				int catId = rs.getInt("catId");
				int userId = rs.getInt("userId");
				post = new Post(pId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;
	}
}
