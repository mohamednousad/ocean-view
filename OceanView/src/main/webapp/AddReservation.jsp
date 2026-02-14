<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Reservation</title>
    <link rel="stylesheet" href="./css/style.css">
    <style>
        body { background: transparent; padding: 20px; }
        .container { margin: 0 auto; width: 100%; box-shadow: none; border: 1px solid #e5e7eb; }
    </style>
</head>
<body>
<div class="container">
    <h2>Add Reservation</h2>
    <div class="msg"><%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %></div>
    <form action="AddReservationServlet" method="post">
        <div class="row">
            <input type="text" name="guestName" placeholder="Enter Guest Name" required>
            <input type="text" name="contact" placeholder="Enter Contact Number" required>
            <select name="roomType" required>
                <option value="">Select Room Type</option>
                <option value="Standard">Standard</option>
                <option value="Deluxe">Deluxe</option>
                <option value="Suite">Suite</option>
            </select>
        </div>
        <div class="row">
            <div style="flex:1">
                <label style="font-size:0.8rem; color:#6b7280; margin-bottom:5px; display:block;">Check In</label>
                <input type="date" name="checkIn" required>
            </div>
            <div style="flex:1">
                <label style="font-size:0.8rem; color:#6b7280; margin-bottom:5px; display:block;">Check Out</label>
                <input type="date" name="checkOut" required>
            </div>
        </div>
         <textarea name="address" placeholder="Enter Residential Address" required></textarea>
        <div class="full">
            <button class="saveBtn" type="submit"><i class="fa-regular fa-floppy-disk"></i> Save</button>
        </div>
    </form>
</div>
</body>
</html>