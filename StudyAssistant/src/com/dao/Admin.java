package com.dao;
import com.beans.VideoBean;
import java.sql.*;


import com.beans.VideoBean;

public class Admin {
	
	public static int insertValues(VideoBean bean)
	{
		Connection con = null;
		int result = 0;
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			
			String query = "INSERT INTO VIDEO (details,likes,url) VALUES (('"+bean.getDescription()+"','"+bean.getCategory()+"'),"+bean.getLikes()+",'"+bean.getUrl()+"');";
			result = st.executeUpdate(query);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
}
