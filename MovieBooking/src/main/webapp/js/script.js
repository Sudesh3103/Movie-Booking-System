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


  function openPop() {
    const popDialog =
        document.getElementById(
            "popupDialog"
        );
    popDialog.style.visibility =
        popDialog.style.visibility ===
            "visible"
            ? "hidden"
            : "visible";
}

function signuptab(){
	const signup = new bootstrap.Tab(document.querySelector('#profile-tab'));
	signup.show();
}

function loginpage(){
	window.location = "index.html";
}

function movieDetails(){
  window.location = "MovieDetails.html";
}

function contact(){
  window.location = "Contact.html";
}

function loginpopup(){
  window.location = "index.html"
}

function openPop1(){
  window.location = "Theators.html";
}

function seat(){
  window.location = "seatSelection.jsp";
}

function booking(){
	window.location = "BookingConfirmation.html";
}

function theateradded(){
	alert("Theater Added Successfully");
}

function movieadded(){
	alert("Movie Added Successfully");
}

const fileInput = document.getElementById("imageUpload");

fileInput.addEventListener("change", function(event) {

    const file = event.target.files[0]; 

    console.log(file.name); // Will display the file name

    // You can access other file properties like file.size, file.type etc.

});

const fileInput1 = document.getElementById("imageUpload1");

fileInput1.addEventListener("change", function(event) {

    const file = event.target.files[0]; 

    console.log(file.name); // Will display the file name

    // You can access other file properties like file.size, file.type etc.

});


