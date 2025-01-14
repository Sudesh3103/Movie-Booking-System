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
                          String theaterName = request.getParameter("theatername");
                          String theaterCity = request.getParameter("theatercity");
                          String location = request.getParameter("language");
                          String format = request.getParameter("format");

                          Class.forName("com.mysql.cj.jdbc.Driver");
                          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
                          Statement stmt = conn.createStatement();
                          
                          stmt.executeUpdate("insert into theaters (theater_name,location,language,format) values('"+theaterName+"',+ '"+theaterCity+"',+'"+location+"',+'"+format+"')");       
                           
            	          response.sendRedirect("AdminDashboard.jsp"); 
                          
                          %>
                          
</body>
</html>