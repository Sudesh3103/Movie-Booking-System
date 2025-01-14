<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
<%
   String Firstname = request.getParameter("firstname");
   String Lastname = request.getParameter("lastname");
   String Emailid = request.getParameter("emailid");
   String Password = request.getParameter("epassword");
   boolean isValidUser = false;


   Class.forName("com.mysql.cj.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieBookingProject","root","root");
   
   Statement stmt = conn.createStatement();
   
   stmt.executeUpdate("insert into users (firstname,lastname,emailid,password) values('"+Firstname+"','"+Lastname+"','"+Emailid+"','"+Password+"')");
   response.sendRedirect("index.html");
   

%>
</body>
</html>