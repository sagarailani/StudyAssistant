package com.beans;

public class UserBean{

	private String name,username,password,email;	
	
	public UserBean(){}
	
	public UserBean(String name, String username, String email, String password)
	{
		super();		
		this.name = name;
		this.username = username;
		this.email = email;
		this.password = password;
	}
	public UserBean(String username, String password)
	{
		super();
		this.username = username;
		this.password = password;
	}
	
	public String getName()
	{
		return name;		
	}
	
	public String getUserName()
	{
		return username;
	}
	
	public String getEmail()
	{
		return email;
	}
	
	public String getPassword()
	{
		return password;
	}
}
