<%@ page import="java.sql.*" %>
<%
    int movieId = Integer.parseInt(request.getParameter("id"));
    String title = "", releaseDate = "", language = "", backgroundImage = "", frontImage = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM latestmovies WHERE id = ?");
        ps.setInt(1, movieId);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()) {
            title = rs.getString("title");
            releaseDate = rs.getDate("release_date").toString();
            language = rs.getString("language");
            backgroundImage = rs.getString("background_image_path");
            frontImage = rs.getString("front_image_path");
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= title %> - Movie Details</title>
    <link rel="stylesheet" href="css/style.css"/>
    <link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <style>
        .bannerimage {
            background-image:  linear-gradient(90deg, rgb(26, 26, 26) 24.97%, rgb(26, 26, 26) 38.3%, rgba(26, 26, 26, 0.04) 97.47%, rgb(26, 26, 26) 100%), url('<%= backgroundImage %>');
            background-size: cover;
            background-repeat: no-repeat;
        }

    </style>
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

      <!-- Movie Details  -->
       <section class="bannerimage">
        <div class="container">
            <div class="row pt-4 pb-5">
                <div class="col-12 col-md-5 col-lg-4 text-center">
                        <div class="smallimage pt-5">
                            <img src="<%= frontImage %>" alt="<%= title %>" alt="" >
                        </div>
                </div>
                <div class="col-12 col-md-7 col-lg-8 pt-4">
                    <div class="text-white pt-5 text">
                        <h2 class="fw-bold mb-3"><%= title %></h2>
                        <div class="bg-dark text-white w-75 p-2 mb-3">
                            <h5> <i class="bi bi-star-fill text-warning"></i> 8.5/10 (34.2K Votes)</h5>
                        </div>
                        <div class="bg-white text-dark w-75">
                            <p class="p-1 ">2D , ICE , IMAX 2D , 4DX , 3D , IMAX 3D , 4DX 3D</p>
                        </div>
                        <div class="bg-white text-dark w-75">
                            <p class="p-1">Language: <%= language %></p>
                        </div>
                        <p>Release Date: <%= releaseDate %></p>
                        <p class="">Duration: 2h 40m </p>
                   



                        <button class="btn btn-danger text-white fs-5 ps-5 pe-5 " onclick="openPop()">Book Ticket</button>

                        <div id="popupDialog" class="col-10 col-md-6 col-lg-4 m-auto d-block">
                        
                           <form action="Theaters.jsp" method="post">
                         <div class="text-dark">
                            <div>
                               <h6><%= title %></h6>
                            </div>

                         <div>
                           <div>
                              <p class="bg-secondary text-white mt-3 mb-2 m-0 ps-1">Select Location</p>
                           </div>
                           <select name="location" id="location" class="w-100" required>
                              <option value="Pune">Pune</option>
                              <option value="Kolhapur">Kolhapur</option>
                              <option value="Mumbai">Mumbai</option>
                           </select>
                         </div>

                        <div class="mt-2">
                            <p class="bg-secondary text-white mt-3 mb-2 m-0 ps-1">Select Language</p>
                        </div>
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap gap-2">
                            <select name="language" id="language" class="w-100" required>
                                <option value="Hindi">Hindi</option>
                                <option value="English">English</option>
                            </select>
                        </div>

                        <div class="mt-2">
                            <p class="bg-secondary text-white mt-3 mb-2 m-0 ps-1">Select Format</p>
                        </div>
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap gap-2">
                            <select name="format" id="format" class="w-100" required>
                                <option value="2D">2D</option>
                                <option value="3D">3D</option>
                                <option value="IMAX 2D">IMAX 2D</option>
                            </select>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-danger text-white m-auto d-block mt-3">
                        Confirm
                    </button>
                </form>
                        </div>
                    </div>
                </div>
            </div>
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
