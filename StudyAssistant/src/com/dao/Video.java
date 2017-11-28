package com.dao;
import java.sql.*;
public class Video {
	
	public static int like(int id,String username)
	{
		Connection con;
		int result = 0;
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			/*String query = "SELECT video_id FROM video WHERE url = '"+url+"';";
			ResultSet rs = st.executeQuery(query);
			int videoid = 0;
			while(rs.next())
			{
				videoid = rs.getInt(1);				
			}*/
			String query2 = "UPDATE userliked SET video_list = video_list || "+id+" WHERE (userlogin).username = '"+username+"';";
			result = st.executeUpdate(query2);		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
	
}
