<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.util.*"
	import="com.dao.Authentication"
	import="com.beans.UserBean" 
%>
<%!
String errUN = "",errEmail="",errPassword="",errName="",errPassword2="";
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Register</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>        
        <style>
            #headingbox{                
                margin-left: 30%;
                margin-top: 5px;
                width: 40%;
                height: 80px;                
                border: 1px solid lightgray;
                border-radius: 5px;
                background-color: lightgray;                
                text-align: center;
            }
            #registerbox{
                margin-left: 30%;
                width: 40%;                
                border: 1px solid lightgray;
                border-radius: 5px;
                height: 460px;
                padding: 10px;
            }
            #submit{
                margin-left: 33%;
            }
        </style>
    </head>
    
    <body>
        <nav>
            <img src="logo-login.png" alt="Logo" style="width:300px; height:100px; margin-left: 38%; margin-top: 10px;">
        </nav>
        <div id="headingbox">
            <h2>Register</h2>
        </div>
        <div id="registerbox">
            <form>
                <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" name="name" value="" class="form-control"><%=errName %>
            </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" name="email" class="form-control"><%=errEmail %>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" name="username" class="form-control"><%=errUN %>
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" name="password" class="form-control"><%=errPassword %>
                </div>
                <div class="form-group">
                    <label for="password">Confirm Password:</label>
                    <input type="password" name="confirmpassword" class="form-control"><%=errPassword2 %>
                </div><br>                
                <input type="submit" name="submit" value="Create an Account" id="submit" class="btn btn-success btn-lg">
            </form>
        </div>                
        <%
			String submitStatus = request.getParameter("submit");
			if(submitStatus != null && submitStatus.equals("Create an Account"))
			{
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String cmpassword = request.getParameter("confirmpassword");
				int validationStatus = 1,passStatus=0;							
				
				String nameRegex = "^[a-zA-Z ]*$";
				String usernameRegex = "^[a-zA-Z.#$%*]{6,12}$";
				//String passwordRegex = "^((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})$";
				
				if(name.matches(nameRegex))
					validationStatus = 1;
				else
				{
					validationStatus = 0;
					errName = "Invalid Format";
				}
				
				if(username.matches(usernameRegex))
					validationStatus = 1;
				else
				{
					errUN = "Invalid Format(Min 6, Max 12, Upper Case,Small Case, Numbers, Special Chars)";
					validationStatus = 0;
				}
				
				if(email.length()== 0)
				{
					validationStatus = 0;
					errEmail = "Cannot be empty";
				
				}
				
				if(password.length() > 6)	
				{
					validationStatus = 1;
					passStatus = 1;
				}
				else
				{
					validationStatus = 0;
					errPassword = "Invalid Format";
				}
				
				if(passStatus == 1 && password.equals(cmpassword))
				{
					validationStatus = 1;
					passStatus = 0;
				}
				else if(passStatus == 1 )					
				{
					if(password.equals(cmpassword))
					{
						validationStatus = 1;
					}
					else
					{
						validationStatus = 0;
						errPassword2 = "Passwords do not Match";	
					}					
				}
				if(validationStatus == 1)
				{
					int status1= 0,status2=0;
					status1 = Authentication.checkUserName(username);
					if(status1 == 0)
					{
						errUN = "Username already exists";
						validationStatus = 0;
					}
					status2 = Authentication.checkEmail(email);
					if(status2 == 0)
					{
						errEmail = "Email ID already exists";
						validationStatus = 0;
					}
				}
				
				if(validationStatus == 1)
				{
					UserBean user = new UserBean(name,username,email,password);					
					int status = Authentication.register(user);
					out.print(status);
					if(status == 1)
						response.sendRedirect("login.jsp");											
				}
			}
		%>
    </body>
</html> 