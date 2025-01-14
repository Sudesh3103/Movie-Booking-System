<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String selectedSeats = request.getParameter("selectedSeats");
    String totalPrice = request.getParameter("totalPrice");

    if (selectedSeats == null || selectedSeats.isEmpty()) {
        response.sendRedirect("seatSelection.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
     <link rel="stylesheet" href="css/style.css"/>
    <link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <style>
       

.payment-container {
	        background-color: #f8f9fa;
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }
.btn-custom {
            background-color: #007bff;
            color: #fff;
        }
.btn-custom:hover {
            background-color: #0056b3;
        }
    </style>
    
        <script>
        var counter = 300;

        setInterval(function() {
          counter--;
          if (counter >= 0) {
            span = document.getElementById("timer");
            span.innerHTML = counter;
          }

          if (counter === 0) {
            alert('Payment Session is expired');
            clearInterval(counter);
            window.location = "Home.jsp";
            
          }

        }, 1000);
        
        
    </script>
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
                  <div class="col-12  pt-3">
                      <div>
                          <h2><a href="" class="text-decoration-none text-dark">Pushpa 2: The Rule - Hindi</a></h2>
                          <p>Cinepolis: Nexus WESTEND Mall Aundh, Pune | Today, 09 Dec, 10:40 PM</p>
                      </div>
                  </div>
              </div>
          </div>
      </section>
      
      
      
       <div class="container">
        <div class="payment-container">
            <h3 class="text-center mb-4">Payment Gateway</h3>
            <p><strong>Selected Seats:</strong> <%= selectedSeats %></p>
            <p><strong>Total Payable Amount:</strong> ₹<%= totalPrice %></p>
            <p><strong>Time Left in Seconds to Complete Payment:</strong> <span id="timer" class="text-danger">5:00</span></p>
            <hr/>
            <!-- Card Details -->
            
            
            <form action="FinalizeBooking.jsp" method="post">
                <div class="mb-3">
                    <label for="cardNumber" class="form-label">Card Number</label>
                    <input name="cardnumber" type="text" class="form-control" id="cardNumber" maxlength="16"  pattern="\d{16}"  placeholder="Enter 16 Digit Number" required>
                </div>

                <div class="mb-3">
                    <label for="cardHolderName" class="form-label">Card Holder Name</label>
                    <input name="cardholdername" type="text" class="form-control" id="cardHolderName" placeholder="Enter Name" required>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="expiryDate" class="form-label">Expiry Date</label>
                        <input name="expirydate" type="text" class="form-control" id="expiryDate" placeholder="MM/YY" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cvv" class="form-label">CVV</label>
                        <input name="cvv" type="password" class="form-control" id="cvv" placeholder="123" required>
                    </div>

                </div>

                <!-- Payment Amount -->
                <div class="mb-3">
                    <label for="amount" class="form-label">Payment Amount</label>
                    <input name="amount" type="text" class="form-control" id="amount" value="<%= totalPrice %>" readonly>
                </div>
                <div class="pt-2 pb-2">
                      <i class="bi bi-info-circle"></i><span class="ps-2">By proceeding, I express my consent to complete this transaction.</span>
                </div>

                <input type="hidden" name="selectedSeats" value="<%= selectedSeats %>">
                <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
                <button type="submit" class="btn btn-custom w-100">Proceed to Payment</button>

            </form>
        </div>
    </div>
    
    
    
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
