<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*"
    import="com.beans.VideoBean"
    import="com.dao.WatchVideos"
    import="com.dao.Video"
    %>


<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Watch Videos</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .navbar{
                border-color: black;
            }
            .navbar-default{
                height: 90px;
                background-color: black;
                font-size: 20px;                
                color: white;                
            }
            #sidebar{                       
                position: fixed;
                float: left;
                max-width: 250px;
                min-width: 250px;
                height: 70vh;
                background-color: lightgray;
                color: #fff;
            }
            #submenu{                	        
                background-color: white;
                color: white;
            }
            #sidebar ul li a{
                text-decoration: none;
                padding: 10px;
                font-size: 1.1em;
                display: block;
                color: black;
            }
            section{          
                padding-top: 20px;
                display: block;
                float: right;                
                width: 80%;                
            }            
            .video{
                margin-left: 10%;
            }
            #logout{            	            
            	color: white;
            	background-color: black;
            }
        </style>
    </head>
    
    <body> 
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header" style="padding-left: 10px;">
                    <a class="navbar-brand" href="#"><img src = "logo1.png" alt="Logo" style="width:220px;height:65px;"></a>
                </div>
            </div>
            <a href="logout.jsp" class="btn btn-lg btn-default" id="logout" style="margin-left:90%;margin-top:-40px;">Logout</a>
        </nav>
        <aside>
            <nav id="sidebar">                
                <ul class="list-unstyled nav nav-pills nav-stacked">
                    <li><a href="view.jsp">Home</a></li>
                    <li class="active">
                        <a href="#submenu" data-toggle="collapse" aria-expanded="false">Browse by Topic <span class="caret"></span></a>
                        <ul id="submenu" class="collapse list-unstyled nav nav-pills nav-stacked">
                            <li class="active"><a href="#">C</a></li>
                            <li><a href="watchC++.jsp">C++</a></li>
                            <li><a href="watchJava.jsp">Java</a></li>
                            <li><a href="watchPython.jsp">Python</a></li>
                            <li><a href="watchDS.jsp">Datastructures</a></li>
                            <li><a href="watchDB.jsp">Databases</a></li>
                        </ul>
                    </li>
                    <li><a href="watchLiked.jsp">Liked Videos</a></li>
                    <li><a href="#history">Watch Previously Viewed</a></li>
                </ul><hr>
            </nav>                        
        </aside>
		<%! 
        	Map<Integer,VideoBean> videos;         	
        	VideoBean bean;
        %>
        <%                 	        
        	videos = WatchVideos.getCategory("C");
        %>
        <section>           
        
            <div class="row">
            <% 
        		for(Map.Entry<Integer,VideoBean> pair: videos.entrySet())
        		{
        			int id = pair.getKey();
        			bean = pair.getValue();
        			String url = bean.getUrl();
        			String description = bean.getDescription();
        			String category2 = bean.getCategory();
        			
        	%>
                <div class="col-md-5">
                    <div class="thumbnail">
                    <iframe width="420" height="250" src="<%=url %>" allowfullscreen></iframe>                
                    <div class="caption">                    
                        <h4>Title:<%=description%></h4><p> </p>
                        <h4>Topic:<%=category2 %></h4><p> </p>
                    </div>
                    <form>
                    <input type="submit" class="btn btn-success btn-md" name="like" style="margin-left: 85%;" value="Like">
                    <input type="hidden" value="<%=id %>" name="id">
                    </form>
                    </div>                    
                </div>
                              
       
            <% } %>
            <% 
            	String value = request.getParameter("like");
            	if(value != null && value.equals("Like"))
            	{
            		int id = Integer.parseInt(request.getParameter("id"));
            		
            		String username = (String)session.getAttribute("username");
            		int result = Video.like(id,username);
            		}
            %>  
                 </div>                    
               </section>
    </body>
</html>