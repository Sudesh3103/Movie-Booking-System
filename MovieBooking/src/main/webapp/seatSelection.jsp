<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Seat Selection</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"/>
    <style>
        .seat {
            width: 40px;
            height: 40px;
            margin: 5px;
            text-align: center;
            line-height: 40px;
            border: 1px solid #000;
            border-radius: 5px;
            cursor: pointer;
        }
        .available {
            background-color: white;
            color: black;
        }
        .selected {
            background-color: green;
            color: white;
        }
        .sold {
            background-color: red;
            color: white;
            cursor: not-allowed;
        }
        #seat-container {
            display: grid;
            grid-template-columns: repeat(20, 1fr);
            margin: auto;
        }
        #summary {
            text-align: center;
            margin-top: 20px;
        }
        .theaterpng{
            height:100px;
            width:100px;
        }
    </style>
    <script>
        let selectedSeats = [];

        function toggleSeat(seat) {
            if (seat.classList.contains("available")) {
                seat.classList.toggle("selected");
                const seatNumber = seat.dataset.seatNumber;
                if (seat.classList.contains("selected")) {
                    selectedSeats.push(seatNumber);
                } else {
                    selectedSeats = selectedSeats.filter(s => s !== seatNumber);
                }
                updateSummary();
            }
        }

        function updateSummary() {
            const totalPrice = selectedSeats.length * 100;
            document.getElementById("selected-seats").textContent = selectedSeats.join(", ");
            document.getElementById("total-price").textContent = totalPrice;
        }

        function bookSeats() {
            if (selectedSeats.length === 0) {
                alert("Please select at least one seat.");
                return;
            }
            const form = document.getElementById("seatForm");
            document.getElementById("selectedSeatsInput").value = selectedSeats.join(",");
            document.getElementById("totalPriceInput").value = selectedSeats.length * 100;
            form.submit();
        }
    </script>
</head>
<body>

    <div class="col-6 m-auto d-block mt-2 text-center">
       <img src="images/foreground/theater.png" class="theaterpng"/>
    </div>
    
    <h2 style="text-align: center;">Select Your Seats</h2>
    <div id="seat-container">
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MovieBookingProject", "root", "root");
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT seat_number, status FROM seats");

                while (rs.next()) {
                    int seatNumber = rs.getInt("seat_number");
                    String status = rs.getString("status");

                    String cssClass = "available";
                    if ("sold".equals(status)) {
                        cssClass = "sold";
                    }
        %>
                    <div 
                        class="seat <%= cssClass %>" 
                        data-seat-number="<%= seatNumber %>" 
                        onclick="toggleSeat(this)"
                        <% if ("sold".equals(status)) { %> style="pointer-events: none;" <% } %>
                    >
                        <%= seatNumber %>
                    </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
    
       <div class="text-center mt-3 mb-3">
            <div>
                <span class="ps-3 pe-3 bg-white border border-primary rounded"></span><span class="ms-2">Available</span>
                <span class="ps-3 pe-3 ms-2 bg-success rounded"></span><span class="ms-2">Selected</span>
                <span class="ps-3 pe-3 ms-2 bg-danger rounded"></span><span class="ms-2">Sold</span>
            </div>
        </div>

    <div id="summary">
        <h4>Selected Seats: <span id="selected-seats"></span></h4>
        <h4>Total Price: ₹<span id="total-price">0</span></h4>
    </div>

    <form id="seatForm" action="BookingConfirmation.jsp" method="POST">
        <input type="hidden" id="selectedSeatsInput" name="selectedSeats" value="">
        <input type="hidden" id="totalPriceInput" name="totalPrice" value="">
        <button type="button" class="btn btn-primary mb-2 m-auto d-block" onclick="bookSeats()">Book Selected Seats</button>
    </form>
</body>
</html>
