<%@ page import="java.util.List, model.Reservation, java.text.SimpleDateFormat, java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body { background: transparent; padding: 20px; font-family: sans-serif; }
        .header-flex { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .table-responsive { overflow-x: auto; }
    </style>
</head>
<body>
    <div class="container">
        <div class="header-flex">
            <h2 style="margin:0;">Reservations</h2>
            <button class="btn primary" onclick="openModal('add')"><i class="fa-solid fa-plus"></i> Add</button>
        </div>
        
        <div class="search-container">
            <input type="text" id="searchInput" class="search-input" placeholder="Search reservations (ID, Name, Contact, Room, Date)...">
        </div>

        <div class="msg"><%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %></div>
        <div class="error"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %></div>
        
        <div class="table-responsive">
           <table id="reservationTable">
			    <thead>
			        <tr>
			            <th>ID</th>
			            <th>Guest Name</th>
			            <th>Contact</th>
			            <th>Room</th>
			            <th>Check In</th>
			            <th>Check Out</th>
			            <th>Days</th>
			            <th style="text-align: center;">Actions</th>
			        </tr>
			    </thead>
			    <tbody>
        		<%
            List<Reservation> list = (List<Reservation>) request.getAttribute("reservationList");
            if (list != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                for (Reservation r : list) {
                    long days = 1;
                    try {
                        long diff = sdf.parse(r.getCheckOut()).getTime() - sdf.parse(r.getCheckIn()).getTime();
                        days = Math.max(1, diff / (1000 * 60 * 60 * 24));
                    } catch(Exception e) {}
			        %>
			        <tr>
			            <td><strong>#<%= r.getReservationNo() %></strong></td>
			            <td><%= r.getGuestName() %></td>
			            <td><%= r.getContact() %></td>
			            <td><%= r.getRoomType() %></td>
			            <td><%= r.getCheckIn() %></td>
			            <td><%= r.getCheckOut() %></td>
			            <td><%= days %> Days</td>
			             <td class="text-center">
                            <button class="btn secondary" onclick="openModal('edit', '<%= r.getReservationNo() %>', '<%= r.getGuestName() %>', '<%= r.getContact() %>', '<%= r.getRoomType() %>', '<%= r.getCheckIn() %>', '<%= r.getCheckOut() %>', '<%= r.getAddress() %>')">
                                <i class="fa-solid fa-pen-to-square"></i> Edit
                            </button>
                            <button class="btn delete" onclick="openDeleteModal('<%= r.getReservationNo() %>')">
                                <i class="fa-solid fa-trash"></i> Delete
                            </button>
                        </td>
			        </tr>
			        <% 
			                } 
			            } else { 
			        %>
			        <tr><td colspan="8" style="text-align:center;">No data found.</td></tr>
			        <% } %>
			    </tbody>
			</table>
        </div>
    </div>

    <div class="modal" id="reservationModal">
        <div class="modal-content">
            <h3 id="modalTitle">Reservation Details</h3>
            <form id="reservationForm" method="post" class="modal-form-grid">
                <input type="hidden" name="reservationNo" id="modalReservationNo">
                <input type="hidden" name="action" id="modalAction">

                <div class="input-group">
                    <label class="modal-label">Guest Name</label>
                    <input type="text" name="guestName" id="modalGuestName" class="modal-input" placeholder="Enter Guest Name" required>
                </div>
                
                <div class="input-group">
                    <label class="modal-label">Contact</label>
                    <input type="text" name="contact" id="modalContact" class="modal-input" placeholder="Enter Contact Number" required>
                </div>
                
                <div class="input-group">
                    <label class="modal-label">Room Type</label>
                    <select name="roomType" id="modalRoomType" class="modal-select" required>
                        <option value="">Select Room Type</option>
                        <option value="Standard">Standard</option>
                        <option value="Deluxe">Deluxe</option>
                        <option value="Suite">Suite</option>
                    </select>
                </div>
				<div class="date-row">
				    <div class="input-group">
				        <label class="modal-label">Check In</label>
				        <input type="date" name="checkIn" id="modalCheckIn" class="modal-input" required style="margin-bottom: 2px;">
				        <span id="checkInError" class="error" style="color: #d93025; font-size: 0.7rem; margin-top: 2px; min-height: 16px; display: flex; align-items: center; gap: 4px;"></span>
				    </div>
				    <div class="input-group">
				        <label class="modal-label">Check Out</label>
				        <input type="date" name="checkOut" id="modalCheckOut" class="modal-input" required style="margin-bottom: 2px;">
				        <span id="checkOutError" class="error" style="color: #d93025; font-size: 0.7rem; margin-top: 2px; min-height: 16px; display: flex; align-items: center; gap: 4px;"></span>
				    </div>
				</div>
				 <div class="input-group full-width">
                    <label class="modal-label">Residential Address</label>
                    <textarea name="address" id="modalAddress" class="modal-textarea" placeholder="Enter Residential Address" required></textarea>
                </div>
                
                <div class="modal-actions full-width">
                    <button type="button" class="btn cancel" onclick="closeModal()">Cancel</button>              
                    <button type="submit" class="btn primary" id="modalSubmitBtn"><i class="fa-solid fa-floppy-disk"></i> Save</button>
                </div>
            </form>
        </div>
    </div>
    
    <div class="modal" id="deleteModal">
        <div class="modal-content delete-modal-content">
            <h3>Delete Reservation</h3>            
            <p>Are you sure you want to delete reservation <strong id="deleteDisplayId"></strong>?</p>
            <form action="ViewReservationServlet" method="post">
                <input type="hidden" name="reservationNo" id="deleteReservationNo">
                <input type="hidden" name="action" value="delete">
                <div class="modal-actions center-actions">
                    <button type="button" class="btn cancel" onclick="closeDeleteModal()">Cancel</button>
                    <button type="submit" class="btn delete">Yes, Delete</button>
                </div>
            </form>
        </div>
    </div>

<script>
function validateDates() {
    let checkInInput = document.getElementById("modalCheckIn").value;
    let checkOutInput = document.getElementById("modalCheckOut").value;
    let checkInError = document.getElementById("checkInError");
    let checkOutError = document.getElementById("checkOutError");
    let errorIcon = '<i class="fa-solid fa-circle-exclamation"></i> ';

    checkInError.innerHTML = "";
    checkOutError.innerHTML = "";
    let isValid = true;

    let today = new Date();
    today.setHours(0, 0, 0, 0);

    if (checkInInput) {
        let checkInDate = new Date(checkInInput);
        checkInDate.setHours(0, 0, 0, 0);
        if (checkInDate < today) {
            checkInError.innerHTML = errorIcon + "Date cannot be in the past.";
            isValid = false;
        }
    }

    if (checkOutInput) {
        let checkOutDate = new Date(checkOutInput);
        checkOutDate.setHours(0, 0, 0, 0);
        if (checkOutDate < today) {
            checkOutError.innerHTML = errorIcon + "Date cannot be in the past.";
            isValid = false;
        }
    }

    if (checkInInput && checkOutInput && isValid) {
        let checkInDate = new Date(checkInInput);
        checkInDate.setHours(0, 0, 0, 0);
        let checkOutDate = new Date(checkOutInput);
        checkOutDate.setHours(0, 0, 0, 0);

        if (checkInDate > checkOutDate) {
            checkOutError.innerHTML = errorIcon + "Must be after check-in date.";
            isValid = false;
        }
    }

    if (!isValid) {
        setTimeout(() => {
            checkInError.innerHTML = "";
            checkOutError.innerHTML = "";
        }, 2500);
    }

    return isValid;
}

document.getElementById("modalCheckIn").addEventListener("change", validateDates);
document.getElementById("modalCheckOut").addEventListener("change", validateDates);

document.getElementById("reservationForm").addEventListener("submit", function(event) {
    if (!validateDates()) {
        event.preventDefault();
    }
});
</script>
<script src="./js/script.js"></script>
</body>
</html>