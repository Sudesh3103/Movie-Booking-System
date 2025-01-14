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
           String movieTitle = request.getParameter("title");
           String releaseDate = request.getParameter("date");
           String language = request.getParameter("language");
           String genre = request.getParameter("genre");
           String bgImage = request.getParameter("bgimage");
           String fgImage = request.getParameter("fgimage");

           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
           Statement stmt = conn.createStatement();
                          
           stmt.executeUpdate("insert into latestmovies (title,release_date,language,genre,background_image_path,front_image_path) values('"+movieTitle+"',+ '"+releaseDate+"',+'"+language+"',+'"+genre+"',+'"+bgImage+"',+'"+fgImage+"')");       
                           
           response.sendRedirect("AdminDashboard.jsp"); 
                          
           %>

</body>
</html>