package com.beans;

public class VideoBean{
	
	private int likes;
	private String description, category, url;
	
	public VideoBean(){}
	
	public VideoBean(String description, String category, int likes, String url)
	{
		super();
		this.description = description;
		this.category = category;
		this.likes = likes;
		this.url = url;
	}
	
	public int getLikes()
	{
		return likes;
	}
	
	public String getDescription()
	{
		return description;			
	}
	
	public String getCategory()
	{
		return category;
	}
	
	public String getUrl()
	{
		return url;
	}
	
}