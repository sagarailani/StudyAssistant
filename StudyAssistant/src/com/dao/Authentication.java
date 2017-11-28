package com.dao;

import java.sql.*;
import com.beans.UserBean;

public class Authentication {

	public static int register(UserBean bean)
	{
		int status = 0;
		try{
			Connection con = DB.getCon();
			Statement st = con.createStatement();
			String insertQuery = "INSERT INTO user_details (name,email_id,userlogin) VALUES('"+bean.getName()+"','"+bean.getEmail()+"','("+bean.getUserName()+","+bean.getPassword()+")')";
			status = st.executeUpdate(insertQuery);
		}
		catch(SQLException e)
		{
			status = e.getErrorCode();
		}
		return status;
	}	
	
	
	public static int login(UserBean bean)
	{
		int status = 0;
		if(bean.getUserName().equals("admin") && bean.getPassword().equals("sagarailani"))
		{
			status = 2;
			return status;
		}
		try{
			Connection con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT (userlogin).username,(userlogin).password FROM user_details WHERE (userlogin).username='"+bean.getUserName()+"';";
			ResultSet rs = st.executeQuery(query);
			String dbUserName="",dbPassword="";
			while(rs.next())				
			{
				dbUserName = rs.getString(1);
				dbPassword = rs.getString(2);
			}			
			if(dbUserName.equals(bean.getUserName()) && dbPassword.equals(bean.getPassword()))
			{
				status = 1;
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
	
	public static int checkUserName(String username)
	{
		int status = 0;
		try{
			Connection con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT * FROM user_details WHERE (userlogin).username='"+username+"';";
			ResultSet rs = st.executeQuery(query);
			if(!rs.next())
			{
				status = 1;				
			}			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return status;
	}
	public static int checkEmail(String email)
	{
		int status = 0;
		try{
			Connection con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT * FROM user_details WHERE email_id='"+email+"';";
			ResultSet rs = st.executeQuery(query);
			if(!rs.next())
			{
				status = 1;				
			}			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return status;
	}
}
