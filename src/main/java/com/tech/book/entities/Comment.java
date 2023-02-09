package com.tech.book.entities;

public class Comment {
	private int cmntId;
	private String cmntContent;
	private String cmntDate;
	private int pId;
	private int uId;
	public Comment(int cmntId, String cmntContent, String cmntDate, int pId, int uId) {
		super();
		this.cmntId = cmntId;
		this.cmntContent = cmntContent;
		this.cmntDate = cmntDate;
		this.pId = pId;
		this.uId = uId;
	}
	public Comment(String cmntContent, String cmntDate, int pId, int uId) {
		super();
		this.cmntContent = cmntContent;
		this.cmntDate = cmntDate;
		this.pId = pId;
		this.uId = uId;
	}
	public int getCmntId() {
		return cmntId;
	}
	public void setCmntId(int cmntId) {
		this.cmntId = cmntId;
	}
	public String getCmntContent() {
		return cmntContent;
	}
	public void setCmntContent(String cmntContent) {
		this.cmntContent = cmntContent;
	}
	public String getCmntDate() {
		return cmntDate;
	}
	public void setCmntDate(String cmntDate) {
		this.cmntDate = cmntDate;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	
}
