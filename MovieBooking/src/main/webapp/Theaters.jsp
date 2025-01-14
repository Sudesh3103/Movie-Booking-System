<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Theaters</title>
    <link rel="stylesheet" href="css/style.css"/>
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
    
    <section>
        <div class="container-fluid mb-2">
            <div class="row border">
                <div class="col-12  p-3">
                    <div>
                        <h2><a href="" class="text-decoration-none text-dark">Available Theaters</a></h2>
                    </div>
                </div>
               
            </div>
        </div>
      </section>
        
    
    <%
        String location = request.getParameter("location");
        String language = request.getParameter("language");
        String format = request.getParameter("format");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");

            // SQL query
            String sql = "SELECT theater_name,location FROM Theaters WHERE location = ? AND language = ? AND format = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, location);
            stmt.setString(2, language);
            stmt.setString(3, format);

            ResultSet rs = stmt.executeQuery();

            if (!rs.isBeforeFirst()) {
                out.println("<p>No theaters available for the selected criteria.</p>");
            } else {
                while (rs.next()) {
                    String theaterName = rs.getString("theater_name");
                    String Location = rs.getString("location");
    %>
    

     <section>
        <div class="container-fluid">
            <div class="row">
            
                <div class="col-12 col-md-7 col-lg-6">
                    <div class="d-flex p-md-2">
                        <div class="pb-3 pe-2 pt-1">
                            <i class="bi bi-heart"></i>
                        </div>
                        <div class="ps-3">
                            <h5><%= theaterName %>, <%= Location %></h5>
                            <div class="d-md-flex justify-content-evenly align-items-center">
                                <div>
                                    <i class="bi bi-phone pe-1 fs-5 text-primary"></i> M-Ticket
                                </div>
                                <div>
                                    <i class="bi bi-cup-straw pe-2 ps-md-3 fs-5 text-primary"></i>Food & Drink
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>

                <div class="col-12 col-md-5 col-lg-6 p-2">
                    <div>
                        <span class="fw-bold">Timings</span>
                    </div>
                    <div class="pt-3 flex-wrap wrap">
                        <button class="btn border-dark  text-success mt-2 ps-4 pe-4" onclick="seat()">9.00 AM</button>
                        <button class="btn border-dark  text-success mt-2 ps-3 pe-4" onclick="seat()">12.00 PM</button>
                        <button class="btn border-dark  text-success mt-2 ps-4 pe-4" onclick="seat()">3.00 PM</button>
                        <button class="btn border-dark  text-success mt-2 ps-4 pe-4" onclick="seat()">6.00 PM</button>
                        <button class="btn border-dark  text-success mt-2 ps-4 pe-4" onclick="seat()">9.00 PM</button>
                        <button class="btn border-dark  text-success mt-2" onclick="seat()">12.00 AM</button>
                    </div>
                </div>
             </div>
           </div>
         </section>
          <hr>
  
    <%
                }
            }

            // Close resources
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    %>
    
    
    
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
