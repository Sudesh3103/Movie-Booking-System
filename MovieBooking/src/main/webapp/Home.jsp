<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link  rel="stylesheet" href="css/style.css"/>
<link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
<link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
</head>
<body>

<!--Navbar-->
    <nav class="bg-dark text-white">
      <div class="container">
        <div class="row">
          <div class="d-flex justify-content-between align-items-center p-4">
            <div class="logo">
              <img src="images/foreground/brand_logo_lg.40253d4c.avif" alt="" class="img-fluid">
            </div>
            <div class="w-75 d-none d-lg-block">
              <input type="text" name="" id="" placeholder="Search Movie" class="w-100 p-2"  />
            </div>
            
            <div class="d-flex align-items-center">
             <a href="index.html"> <button class="btn bg-danger text-white" onclick="loginpopup()">Sign in</button></a>

              <!-- offcanvas -->

              <button class="btn text-white d-lg-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasTop" aria-controls="offcanvasTop">
                <i class="bi bi-list fs-3"></i>
              </button>

              <div class="offcanvas offcanvas-top bg-dark text-white" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
                <div class="offcanvas-header">
                  <h5 class="offcanvas-title text-center" id="offcanvasTopLabel">
                    Ticket New
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                  <ul class="list-unstyled">
                  <li> <a href="Home.jsp" class="text-decoration-none">Home Page</a></li> <hr/>
                  <li> <a href="AllMovies.jsp" class="text-decoration-none">Latest Movies</a></li> <hr/>
                  <li> <a href="AllUpcomingMovies.jsp" class="text-decoration-none">Upcoming Movies</a> </li> <hr/>
                  <li> <a href="feedback.jsp" class="text-decoration-none">Give Feedback</a> </li> <hr/>
                  <li> <a href="Contact.html" class="text-decoration-none">Contact</a> </li>
                  </ul>
                </div>
              </div>
              
               <div class="user text-center ms-md-2">
                  <a href=""> <img src="images/foreground/user (1).png" class="img-fluid text-center ms-2"/> </a>
                  <p>Welcome</p>
               </div>   
            </div>
           
          </div>
        </div>
      </div>
    </nav>

 <Section >

  <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  
  <div class="carousel-inner Hero-Section">
  
  <% 
            // Fetch movies from the database
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM movies");
                
                while (rs.next()) {
        %>
        
    <a href="carousel.jsp?id=<%= rs.getInt("id") %>" class="text-decoration-none text-white">
    <div class="carousel-item active hero">
      <img src="<%= rs.getString("background_image_path") %>" alt="<%= rs.getString("title") %>" class="d-block w-100" alt="..."/>
      <div class="carousel-caption d-none d-md-block">
        <h2><%= rs.getString("title") %></h2>
        <h6>Genre: <%= rs.getString("genre") %></h6>
      </div>
    </div>
    </a>
    
     <% 
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>


    </Section>
    
    
    
    <!-- Latest Release Movie Section  -->

    <section>
      <div class="container mb-3">
        <div class="d-flex justify-content-between align-items-center p-2">
          <div>
            <h3 class="mb-2 mt-3">Latest Movies</h3>
          </div>
          <div>
           <a href="AllMovies.jsp" class="text-decoration-none"><button class="btn btn-primary w-100">View All</button></a> 
          </div>
        </div>
        
        <div class="row g-4">
        
        <% 
            // Fetch movies from the database
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM latestmovies");
                
                while (rs.next()) {
        %>
        
        
            <div class="col-12 col-md-6 col-lg-3">
                <div class="card movie-card">
                    <img src="<%= rs.getString("front_image_path") %>" alt="<%= rs.getString("title") %>" class="card-img-top" alt="Movie 1"/>
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString("title") %></h5>
                        <p class="card-text">Genre: <%= rs.getString("genre") %> </p>
                        <p class="card-text mt-lg-3 pb-1">Language: <%= rs.getString("language") %></p>
                       <button class="btn btn-primary m-auto d-block"> <a href="latestmovies.jsp?id=<%= rs.getInt("id") %>" class="text-decoration-none text-white">View</a></button>
                    </div>
                </div>
            </div>
            
                 <% 
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
            
      </div>
    </section>
    
    
    
    
     <!-- Movie banner image  -->

    <div class="container banner">
      <div class="row">

      </div>
    </div>
    
    
    
     <!-- Upcoming Movies  -->

    <section>
      <div class="container mb-3">
        <div class="d-flex justify-content-between align-items-center p-2">
          <div>
            <h3 class="mb-2 mt-3">Upcoming Movies</h3>
          </div>
          <div>
            <a href="AllUpcomingMovies.jsp" class="text-decoration-none"><button class="btn btn-primary w-100">View All</button></a> 
          </div>
        </div>
        
        
        <div class="row g-4">
        
        
        <% 
            // Fetch movies from the database
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM upcomingmovies");
                
                while (rs.next()) {
        %>
            <div class="col-12 col-md-6 col-lg-3">
                <div class="card movie-card">
                    <img  src="<%= rs.getString("front_image_path") %>" alt="<%= rs.getString("title") %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= rs.getString("title") %></h5>
                        <p class="card-text">Genre: <%= rs.getString("genre") %></p>
                        <p class="card-text">Language: <%= rs.getString("language") %></p>
                        <button class="btn btn-primary m-auto d-block"> <a href="upcomingmovies.jsp?id=<%= rs.getInt("id") %>" class="text-decoration-none text-white">View</a></button>
                    </div>
                </div>
            </div>
            
               <% 
                }
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
            
      </div>
    </section>
    
    
     <!-- Footer  -->

    <footer class="bg-dark text-white">
      <div class="container p-4">
        <div class="row pt-3">
            <div class="col-12 col-md-6 col-lg-3">
                <h5 class="fw-bold">Browse All</h5>
                <ul class="list-unstyled">
                 <li><a href="AllMovies.jsp" class="text-decoration-none ">Now Showing</a></li>
                 <li><a href="AllUpcomingMovies.jsp" class="text-decoration-none ">Coming Soon</a></li>
                 <li><a href="Home.jsp" class="text-decoration-none ">Movies</a></li> 
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <h5 class="fw-bold">Links</h5>
                <ul class="list-unstyled">
                  <li><a href="Home.jsp" class="text-decoration-none ">Home</a></li>
                  <li><a href="index.html" class="text-decoration-none ">Register</a></li>
                  <li><a href="index.html" class="text-decoration-none ">Login</a></li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-3">
                <h5 class="fw-bold">City Theaters</h5>
                <ul class="list-unstyled">
                  <li><a href="" class="text-decoration-none ">Pune</a></li>
                  <li><a href="" class="text-decoration-none ">Mumbai</a></li>
                  <li><a href="" class="text-decoration-none ">Kolhapur</a></li>
                </ul>
            </div>
            <div class="col-12 col-md-6 col-lg-3" >
                <h5 class="fw-bold">Enquiry</h5>
                <a href="Contact.html" class="text-decoration-none">Support Service (24x7)</a>
                
                <h5 class="fw-bold mt-3">Give Feedback</h5>
                <a href="feedback.jsp" class="text-decoration-none">Feedback Form</a>
                
            </div>
          </div>
          <hr>
          <div class="text-center">
            <i class="bi bi-twitter fs-2 p-2"></i>
            <i class="bi bi-facebook fs-2 p-2"></i>
            <i class="bi bi-instagram fs-2 p-2"></i>
            <p class="pt-2">Copyright 2024 © Ticket New Entertainment Pvt. Ltd. All Rights Reserved.</p>
          </div>
      </div>
    </footer>



    <script src="js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
   
</body>
</html>