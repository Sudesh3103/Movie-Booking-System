<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<link rel="stylesheet" href="css/style.css"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
                  <p>Sudesh</p>
               </div>   
            </div>
           
          </div>
        </div>
      </div>
    </nav>
     
     
     
     <div class="container-fluid bg-dark text-white">
        <div class="row">
            <!-- Sidebar -->
            <nav class="col-12 col-md-2  sidebar text-white">
                <h3 class="text-center py-3">Admin Panel</h3>
                <ul class="nav nav-pills mb-3 flex-column" id="pills-tab" role="tablist">
                  <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="pills-dashboard-tab" data-bs-toggle="pill" data-bs-target="#pills-dashboard" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Dashboard</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-users-tab" data-bs-toggle="pill" data-bs-target="#pills-users" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">View Users</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-movie-tab" data-bs-toggle="pill" data-bs-target="#pills-movie" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Movie Management</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-theater-tab" data-bs-toggle="pill" data-bs-target="#pills-theater" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Theater Management</button>
                  </li>
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-booking-tab" data-bs-toggle="pill" data-bs-target="#pills-booking" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">View Bookings</button>
                  </li>  
                  <li class="nav-item" role="presentation">
                    <button class="nav-link" id="pills-feedback-tab" data-bs-toggle="pill" data-bs-target="#pills-feedback" type="button" role="tab" aria-controls="pills-feedback" aria-selected="false">View Feedbacks</button>
                  </li> 
                </ul>
            </nav>

            <!-- Main Content -->
            <main class="col-md-10 ms-sm-auto px-md-4">
                <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <div>
                       <h1 class="h2">Dashboard</h1>
                    </div>
                    <div>
                        <a href="Home.jsp" class="h5 text-primary text-decoration-none"> Go to Home Page</a>
                    </div>
                    
                </div>

                <!-- Dashboard Content  -->
                
                <%
        int totalBookings = 0;
        int totalRevenue = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
            Statement stmt = conn.createStatement();

            // Execute the query
            ResultSet rs = stmt.executeQuery("SELECT COUNT(paymentid) AS totalBookings, SUM(amount) AS totalRevenue FROM paymentdetails");

            // Fetch the results
            if (rs.next()) {
                totalBookings = rs.getInt("totalBookings");
                totalRevenue = rs.getInt("totalRevenue");
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
                
                    <div class="tab-content" id="pills-tabContent">
                      <div class="tab-pane fade show active" id="pills-dashboard" role="tabpanel" aria-labelledby="pills-dashboard-tab" tabindex="0">
                        <div class="row">
                          <!-- Total Bookings  -->
                          <div class="col-md-4">
                              <div class="card text-center">
                                  <div class="card-body">
                                      <h5 class="card-title">Total Bookings</h5>
                                      <h2 class="card-text"><%= totalBookings %></h2>
                                  </div>
                              </div>
                          </div>
      
                          <!-- Revenue Overview -->
                          <div class="col-md-4">
                              <div class="card text-center">
                                  <div class="card-body">
                                      <h5 class="card-title">Revenue</h5>
                                      <h2 class="card-text">₹<%= totalRevenue %></h2>
                                  </div>
                              </div>
                          </div>
      
                          <!-- Upcoming Movies -->
                          <div class="col-md-4">
                              <div class="card text-center">
                                  <div class="card-body">
                                      <h5 class="card-title">Upcoming Movies</h5>
                                      <h2 class="card-text">16</h2>
                                  </div>
                              </div>
                          </div>
                        </div>
                      </div>

                      <!-- View Users Content  -->
                      
 <div class="tab-pane fade" id="pills-users" role="tabpanel" aria-labelledby="pills-users-tab" tabindex="0">
      <div class="col-12 p-2">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM users");

                out.println("<table class='table table-bordered table-hover text-center'> <thead class='thead-dark'><tr> <th>ID</th><th>First Name</th><th>Last Name</th><th>Email ID</th><th>Password</th></tr></thead><tbody>");


                while (rs.next()) {
                    int id = rs.getInt(1);
                    String firstname = rs.getString(2);
                    String lastname = rs.getString(3);
                    String emailid = rs.getString(4);
                    String password = rs.getString(5);

                    out.println("<tr> <td>" + id + "</td> <td>" + firstname + "</td> <td>" + lastname + "</td> <td>" + emailid + "</td> <td>" + password + "</td>");

                }


                out.println("</tbody> </table>");

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</div>


        <!-- Movie Management section  -->
                      <div class="tab-pane fade" id="pills-movie" role="tabpanel" aria-labelledby="pills-movie-tab" tabindex="0">
                        <div class="row">
                        <div class="col-12  p-2">
                          <div class="border border-white">
                          
                            <form method="post" action="AddLatestMovie.jsp">
                              <div class="p-2">
                                <label>Enter Title of The Movie</label>
                                <input type="text" name="title" id="" placeholder="Title of Movie" class="form-control" required>
                              </div>
                              <div class="p-2">
                                <label for="date" > Enter a date (YYYY-MM-DD):</label>
                                <input type="text" name="date" id="date" placeholder="YYYY-MM-DD" class="form-control" required ">
                              </div>
                              <div class="p-2">
                                <label>Enter available languages of Movie</label>
                                <input type="text" name="language" id="" placeholder="languages Hindi or English" class="form-control" required>
                              </div>
                              <div class="p-2">
                                <label>Enter Genre of Movie</label>
                                <input type="text" name="genre" id="" placeholder="Genre" class="form-control" required>
                              </div>
                              <div class="p-2">
                                <label>Select Movie background image</label>
                                <input type="file" name="bgimage" id="imageUpload" accept="images/background/" placeholder="Background image path" class="form-control">
                              </div>
                              
                              <div class="p-2">
                                <label>Select Movie foreground image</label>
                                <input type="file" name="fgimage" id="imageUpload1" accept="images/foreground/" placeholder="foreground image path" class="form-control">
                              </div>

                              <div >
                                <button class="btn btn-primary text-white m-auto d-block mt-2 mb-2" onclick="movieadded()" type="submit">Add Movie</button>
                              </div>	
                            </form>
                          </div>
                        </div>

                       
                       </div>
                      </div>

                      

           <!-- Theater Management Section  -->
                      <div class="tab-pane fade" id="pills-theater" role="tabpanel" aria-labelledby="pills-theater-tab" tabindex="0">
                        <div class="col-12  p-2">
                          <div class="border border-white">
 
                            <form method="post" action="AddTheater.jsp">
                              <div class="p-2">
                                <label>Enter Theater Name</label>
                                <input type="text" name="theatername" id="" placeholder="Enter Theater Name" class="form-control" required>
                              </div><hr class="m-0">
                              <div class="p-2">
                                <label>Enter Theater City</label>
                                <input type="text" name="theatercity" id="" placeholder="Enter Theater City Pune, Mumbai or Kolhapur" class="form-control" required>
                              </div>
                              <div class="p-2">
                                <label>Language Available</label>
                                <input type="text" name="language" id="" placeholder="Enter language for movie" class="form-control" required>
                              </div>
                              <div class="p-2">
                                <label>Screen Format</label>
                                <input type="text" name="format" id="" placeholder="Enter Theater Screen format 2D, 3D or IMAX 2D" class="form-control" required>
                              </div>
                              <div >
                                <button class="btn btn-primary text-white m-auto d-block mt-2 mb-2" type="submit" onclick="theateradded()">Add Theater</button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>

                      <!-- View Booking Section  -->
                      <div class="tab-pane fade" id="pills-booking" role="tabpanel" aria-labelledby="pills-booking-tab" tabindex="0">
                        <div class="col-12 p-2">
         <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM paymentdetails");

                out.println("<table class='table table-bordered table-hover text-center'> <thead class='thead-dark'><tr> <th>Payment Id</th><th>Card Number</th><th>Card Holder Name</th><th>Expiry Date</th><th>CVV</th> <th>Amount</th> <th>Payment Date</th> </tr></thead><tbody>");


                while (rs.next()) {
                    int id = rs.getInt(1);
                    String cardnumber = rs.getString(2);
                    String holdername = rs.getString(3);
                    String expiraydate = rs.getString(4);
                    int cvv = rs.getInt(5);
                    int amount = rs.getInt(6);
                    String date = rs.getString(7); 

                    out.println("<tr> <td>" + id + "</td> <td>" + cardnumber + "</td> <td>" + holdername + "</td> <td>" + expiraydate + "</td> <td>" + cvv + "</td> <td>" + amount + "</td> <td>" + date + "</td> </tr>");
                }


                out.println("</tbody> </table>");

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
                              
                        </div>
                      
                      </div>
                      
                      
                                   <!-- View feedback Section  -->
                      <div class="tab-pane fade" id="pills-feedback" role="tabpanel" aria-labelledby="pills-booking-tab" tabindex="0">
                        <div class="col-12 p-2">
         <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviebookingproject", "root", "root");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM feedback");

                out.println("<table class='table table-bordered table-hover text-center'> <thead class='thead-dark'><tr> <th> Id</th><th>User Name</th><th>Email Id</th><th>Rating</th><th>Comment</th> <th>Feedback Date</th>  </tr></thead><tbody>");


                while (rs.next()) {
                    int id = rs.getInt(1);
                    String name = rs.getString(2);
                    String email = rs.getString(3);
                    String rating = rs.getString(4);
                    String comment = rs.getString(5);
                    String date = rs.getString(6); 

                    out.println("<tr> <td>" + id + "</td> <td>" + name + "</td> <td>" + email + "</td> <td>" + rating + "</td> <td>" + comment + "</td> <td>" + date + "</td>  </tr>");
                }


                out.println("</tbody> </table>");

                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            }
        %>
                              
                        </div>
                      
                      </div>
                      
                      
                      
                      
                    </div>

                </div>
                </div>
            </main>
        </div>
    </div><hr class="m-0 ">

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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
     
     
    
</body>
</html>