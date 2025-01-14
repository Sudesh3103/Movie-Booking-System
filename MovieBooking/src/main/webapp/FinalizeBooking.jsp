<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Finalize Booking</title>
    <link  rel="stylesheet" href="css/style.css"/>
    <link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>

</head>
<body>
    <%
        String cardnumber = request.getParameter("cardnumber");
        String holdername = request.getParameter("cardholdername");
        String expiraydate = request.getParameter("expirydate");
        int cvv = Integer.parseInt(request.getParameter("cvv"));
        // Get the amount parameter
        String amountParam = request.getParameter("amount");

        // Remove currency symbol (₹) and any extra spaces
        amountParam = amountParam.replaceAll("[₹\\s]", "");

        // Parse the sanitized amount as an integer
        int amount = (amountParam != null && !amountParam.isEmpty()) ? Integer.parseInt(amountParam) : 0;

        String selectedSeats = request.getParameter("selectedSeats");
        String totalPrice = request.getParameter("totalPrice");

        if (selectedSeats != null && !selectedSeats.isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieBookingProject", "root", "root");
                
                Statement stmt = conn.createStatement();
                
                stmt.executeUpdate("insert into paymentdetails(CardNumber,CardHolderName,ExpiryDate,CVV,Amount) values('"+cardnumber+"','"+holdername+"','"+expiraydate+"',"+cvv+","+amount+")");

                // Finalize the booking by marking seats as "sold"
                String[] seatNumbers = selectedSeats.split(",");
                for (String seatNumber : seatNumbers) {
                    pstmt = conn.prepareStatement("UPDATE seats SET status = 'sold' WHERE seat_number = ?");
                    pstmt.setInt(1, Integer.parseInt(seatNumber));
                    pstmt.executeUpdate();
                }

                // Show success message to the user
    %>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 offset-md-3">
                            <div class="card">
                                <div class="card-header text-center">
                                   <i class="bi bi-check-circle fs-1 text-success"></i> <h4>Booking Finalized</h4>
                                </div>
                                <div class="card-body text-center">
                                    <p><strong>Your selected seats:</strong> <%= selectedSeats %></p>
                                    <p><strong>Total Price Paid:</strong> ₹<%= totalPrice %></p>
                                    <p>Thank you for booking with us!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        } else {
    %>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="alert alert-danger text-center">
                            <h4>Error: No seats were selected!</h4>
                        </div>
                    </div>
                </div>
            </div>
    <%
        }
    %>
</body>
</html>
