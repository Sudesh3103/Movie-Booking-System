<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login</title>
</head>
<body>

<% 
   String username = request.getParameter("Emailid");
   String password = request.getParameter("Password");
   boolean isValidUser = false;
   
   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieBookingProject","root", "root");
   Statement stmt = conn.createStatement();
   ResultSet rs = stmt.executeQuery("select * from users");
   
   while(rs.next()){
	  String user = rs.getString(4);
	  String pass = rs.getString(5);
	   
	   if(username.equals(user) && password.equals(pass)){
		   response.sendRedirect("Home.jsp");
	   }
	  
   }
   
   if (!isValidUser) {
	   %>
	          <script>
	              alert("Invalid username or password");
	              window.location.href = "index.html";
	          </script>
	   <%
	      }
   
  
   
   %>
</body>
</html>