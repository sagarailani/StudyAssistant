package com.dao;

import java.sql.*;

public class DB {
	public static Connection getCon()
	{
		Connection con = null;
		
		try{
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection("jdbc:postgresql://localhost:5434/StudyAssistant","postgres","postgres");
			System.out.println("Database Opened Successfully");
		}
		catch(Exception e)
		{
			System.out.println("Problem");
			System.out.println(e);
		}
		return con;
	}
}
