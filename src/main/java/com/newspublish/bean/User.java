package com.newspublish.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private String id;
	private String userName;
	private String userAccount;
	private String userPsw;
	private String role = "0";
	
	public User(String userName, String userAccount, String userPsw) {
		super();
		this.userName = userName;
		this.userAccount = userAccount;
		this.userPsw = userPsw;
	}
}

	
