<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*"
    import="com.beans.UserBean"
    import="com.beans.VideoBean"
    import="com.dao.Authentication"
    import="com.dao.Admin"
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Insert Video Data</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
        	#outerbox{
            	margin-left: 30%;
                width: 40%;				        	
        	}
            #innerbox{
            	margin-left: 30%;
                width: 40%;
                height: 80px;
                margin-bottom: 30px;
                text-align: center;
                padding-top: 5px;
                background-color: lightgray;
            }
            .form-group{
                padding-left: 10px;
                padding-right: 10px;
            }
            #submit{
                margin-left: 42%;
            }
        </style>
    </head>
    
    <body>
        <nav>
            <img src="logo-login.png" alt="Logo" style="width:300px; height:100px; margin-left: 38%; margin-top:20px;">
            <a href="logout.jsp" class="btn btn-lg btn-default" id="logout" style="margin-left:90%;margin-top:-40px;">Logout</a>            
        </nav>
        <section>
            
                <div id="innerbox">
                    <h2>Insert Data</h2>
                </div>
                <div id="outerbox">
                <form>
                    <div class="form-group">
                        <label for="category">Category:</label>
                        <select name="category" class="form-control">
                        	<option value="disabled">SELECT</option>
  							<option value="C">C</option>
  							<option value="C++">C++</option>
  							<option value="Java">Java</option>
 							<option value="Python">Python</option>
 							<option value="Data Structures and Algorithms">Data Structures and Algorithms</option>
 							<option value="Databases">Databases</option>
						</select>
                    </div><br>
                    <div class="form-group">
                        <label for="text">Description:</label>
                        <input type="text" name="description" class="form-control">
                    </div><br>
                    <div class="form-group">
                        <label for="likes">Likes:</label>
                        <input type="number" name="likes" class="form-control">
                    </div><br>
                    <div class="form-group">
                        <label for="url">URL:</label>
                        <input type="text" name="url" class="form-control">
                    </div><br>
                                        
                    <input type="submit" name="submit" id="submit" value="Insert" class="btn btn-success btn-lg">
                </form>
            </div>
        </section>
       <%
       		String submitstatus = request.getParameter("submit");
       		if(submitstatus != null && submitstatus.equals("Insert"))
       		{
       			String category = request.getParameter("category");
       			String description = request.getParameter("description");
       			int likes = Integer.parseInt(request.getParameter("likes"));
       			String url = request.getParameter("url");
       			VideoBean video = new VideoBean(description,category,likes,url);
       			int result = Admin.insertValues(video);
       			if(result == 1)
       			{
       				out.print("Inserted");
       			}
       			else
       			{
       				out.print("Error");
       			}
       		}
       %>
    </body>
</html>