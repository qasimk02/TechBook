package com.tech.book.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tech.book.entities.Comment;

@SuppressWarnings("deprecation")
public class CommentDao {
	private Connection con;

	public CommentDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean insertComment(String cmntContent,int pid,int uid) {
		boolean isCommented = false;
		
		try {
			String query = "insert into comment(cmntContent,pId,uId) values(?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, cmntContent);
			pstmt.setInt(2, pid);
			pstmt.setInt(3, uid);
			pstmt.executeUpdate();
			
			isCommented = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isCommented;
	}
	
	public List<Comment> getAllCommentByPostId(int pid) {
		List<Comment> cmntList = new ArrayList<>();
		
		try {
			String query = "select * from comment where pId=? order by cmntId desc";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				int cmntId = rs.getInt("cmntId");
				String cmntContent = rs.getString("cmntContent");
				String cmntDate = rs.getTimestamp("cmntDate").toLocaleString();
				int uId = rs.getInt("uId");
				int pId = rs.getInt("pId");
				
				Comment cmnt = new Comment(cmntId,cmntContent,cmntDate,pId,uId);
				cmntList.add(cmnt);
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return cmntList;
	}
	
	public int getTotalCommentOnPost(int pid) {
		int totalCmnt = 0;
		
		try {
			String query = "select count(*) from comment where pId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				totalCmnt = rs.getInt("count(*)");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return totalCmnt;
	}

	public boolean deleteComment(int cmntId) {
		boolean isDeleted = false;
		
		try {
			PreparedStatement pstmt = con.prepareStatement("delete from comment where cmntId=?");
			pstmt.setInt(1, cmntId);
			pstmt.executeUpdate();
			isDeleted = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return isDeleted;
	}

}
