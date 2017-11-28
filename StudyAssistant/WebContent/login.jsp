<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*"
    import="com.beans.UserBean"
    import="com.dao.Authentication"
%>

<%! String errUN = "", errPassword=""; %>

<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <style>
            #loginbox{
                margin-top: 20px;
                margin-left: 30%;                
                border: 1px solid #CCCCCC;
                width: 40%;
                height:400px;
            }
            #innerbox{
                width: 100%;
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
            #loginbox a{
                margin-left: 75%;                
            }
            #submit{
                margin-left: 42%;
            }
        </style>
    </head>
    
    <body>
        <nav>
            <img src="logo-login.png" alt="Logo" style="width:300px; height:100px; margin-left: 38%; margin-top:20px;">            
        </nav>
        <section>
            <div id="loginbox">
                <div id="innerbox">
                    <h2>Login</h2>
                </div>
                <form>
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" name="username" class="form-control"><%=errUN %>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" name="password" class="form-control"><%=errPassword %>
                    </div><br>
                    <a href="#">Forgot Password?</a><br><br>
                    <input type="submit" name="submit" id="submit" value="Login" class="btn btn-success btn-lg">
                </form>
            </div>
        </section>
        <%
        	String submitStatus = request.getParameter("submit");
        	int flag = 1;
        if(submitStatus != null && submitStatus.equals("Login"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(username.length() == 0)
			{
				flag = 0;
				errUN = "User Name cannot be empty";
			}
			if(password.length() == 0)
			{
				flag = 0;
				errPassword = "Password cannot be empty";
			}
			if(flag == 1)
			{
				UserBean user = new UserBean(username,password);
				int status = Authentication.login(user);
				out.print(status);
				if(status == 1)
				{
					session.setAttribute("username",username);				
					response.sendRedirect("view.jsp");
				}
				if(status == 2)
				{
					session.setAttribute("username",username);
					response.sendRedirect("adminHome.jsp");
				}
			}
		}
        %>
    </body>
</html>