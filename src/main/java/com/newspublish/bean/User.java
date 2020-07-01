package com.newspublish.bean;
public class User {
	private String id;
	private String userName;
	private String userAccount;
	private String userPsw;
	private String role = "0";
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAccount() {
		return userAccount;
	}
	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}
	public String getUserPsw() {
		return userPsw;
	}
	public void setUserPsw(String userPsw) {
		this.userPsw = userPsw;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", userAccount=" + userAccount + ", userPsw=" + userPsw
				+ ", role=" + role + "]";
	}
	public User(String id, String userName, String userAccount, String userPsw, String role) {
		super();
		this.id = id;
		this.userName = userName;
		this.userAccount = userAccount;
		this.userPsw = userPsw;
		this.role = role;
	}
	
	public User(String userName, String userAccount, String userPsw) {
		super();
		this.userName = userName;
		this.userAccount = userAccount;
		this.userPsw = userPsw;
	}
	
	public User() {
		super();
	}
		
}

	
