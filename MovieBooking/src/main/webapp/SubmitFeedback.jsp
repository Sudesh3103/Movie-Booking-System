<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <%
       String name = request.getParameter("userName");
       String email  = request.getParameter("email");
       String rating = request.getParameter("rating");
       String comment = request.getParameter("comments");
       
       Class.forName("com.mysql.cj.jdbc.Driver");
       Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieBookingProject","root","root");
      
       Statement stmt = conn.createStatement();
       
       stmt.executeUpdate("insert into feedback (user_name,email,rating,comments) values('"+name+"','"+email+"','"+rating+"','"+comment+"')");
        
       %>
       <script>
           alert("Thank you for your feedback!");
           window.location.href = "Home.jsp";
       </script>
<%
      
      
      
      
      
      %>
</body>
</html>