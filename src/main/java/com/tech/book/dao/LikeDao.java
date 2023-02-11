package com.tech.book.dao;

import java.sql.*;

public class LikeDao {
	private Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean isLiked = false;

		try {

			String query = "insert into liked(userId,postId) values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, pid);

			pstmt.executeUpdate();

			isLiked = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isLiked;
	}
	
	public boolean deleteLike(int pid, int uid) {
		boolean isDislikeLiked = false;

		try {

			String query = "delete from liked where postId=? and userId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);

			pstmt.executeUpdate();

			isDislikeLiked = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDislikeLiked;
	}
	
	public int getLikeOnPost(int pid) {
		int lcount = 0;

		try {
			String query = "select count(*) from liked where postId=?";

			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				lcount = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return lcount;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean isLiked = false;

		try {
			PreparedStatement pstmt = con.prepareStatement("select * from liked where postId=? and userId=?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				isLiked = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isLiked;

	}
}
