package com.dao;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;
import com.beans.VideoBean;
public class WatchVideos {
	
	public static Map<Integer,VideoBean> viewVideos()
	{
		Connection con = null;		
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT video_id,(details).description,(details).category,likes,url FROM VIDEO ORDER BY RANDOM() LIMIT 10";
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				int likes = rs.getInt(4);
				String url = rs.getString(5);
				String description = rs.getString(2);
				String category = rs.getString(3);
				video.put(videoid,new VideoBean(description,category,likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;
	}
	
	public static Map<Integer,VideoBean> getLiked(String username)
	{
		Connection con = null;
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();			
			
			String query = "SELECT video_id,(details).description,(details).category,likes,url FROM video JOIN userliked ON video.video_id = ANY(video_list) WHERE (userlogin).username = '"+username+"';";
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				int likes = rs.getInt(4);
				String url = rs.getString(5);
				String description = rs.getString(2);
				String category = rs.getString(3);
				video.put(videoid,new VideoBean(description,category,likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;		
	}
	
	public static Map<Integer,VideoBean> getPreviouslyViewed(int userid)
	{
		Connection con = null;
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT video_id,details,likes,url FROM video JOIN user_viewed ON video.video_id = ANY(video_list) WHERE user_id = "+userid;
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				Struct details = (Struct)rs.getObject(2);
				Object videodetails[] = details.getAttributes();
				int likes = rs.getInt(3);
				String url = rs.getString(4);
				video.put(videoid,new VideoBean((String)videodetails[0],(String)videodetails[1],likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;		
	}
	public static Map<Integer,VideoBean> getCategory(String category)
	{
		Connection con = null;
		Map<Integer,VideoBean> video = new HashMap<Integer,VideoBean>();
		try{
			con = DB.getCon();
			Statement st = con.createStatement();
			String query = "SELECT video_id,(details).description,(details).category,likes,url FROM video WHERE (details).category = '"+category+"'";
			ResultSet rs = st.executeQuery(query);
			while(rs.next())
			{
				int videoid = rs.getInt(1);
				int likes = rs.getInt(4);
				String url = rs.getString(5);
				String description = rs.getString(2);
				String category2 = rs.getString(3);
				video.put(videoid,new VideoBean(description,category2,likes,url));				
			}			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return video;		
	}
}
