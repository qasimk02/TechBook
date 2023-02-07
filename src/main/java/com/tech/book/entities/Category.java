package com.tech.book.entities;

public class Category {
	private int cId;
	private String cName;
	private String cDescription;
	public Category() {
		super();
	}
	public Category(int cId, String cName, String cDescription) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.cDescription = cDescription;
	}
	public Category(String cName, String cDescription) {
		super();
		this.cName = cName;
		this.cDescription = cDescription;
	}
	public int getcId() {
		return cId;
	}
	public void setcId(int cId) {
		this.cId = cId;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getcDescription() {
		return cDescription;
	}
	public void setcDescription(String cDescription) {
		this.cDescription = cDescription;
	}
	
}
