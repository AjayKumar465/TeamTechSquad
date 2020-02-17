package com.teamtechsquad.dto;

import java.io.Serializable;

public class LoginDTO implements Serializable {
	private static final long serialVersionUID = -1055188933224107795L;

	private String userName;
	private String password;

	public LoginDTO() {
	}

	public LoginDTO(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassWord() {
		return password;
	}

	public void setPassWord(String passWord) {
		this.password = passWord;
	}

}
