<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
    <style>
    	body {
            font-family: Arial, sans-seri;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            width: 1000px;
            margin: auto;
        }
        h2 {
            color: #007bff;
            margin-bottom: 25px;
        }
        form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }
        input, select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 31%;
        }
        button {
            padding: 10px 25px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background: #0056b3;
        }
        .full {
            width: 100%;
        }
        .msg {
            color: green;
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Add Reservation</h2>
    <form action="AddReservationServlet" method="post">
        <input type="text" name="reservationNo" placeholder="Reservation Number" required>
        <input type="text" name="guestName" placeholder="Guest Name" required>
        <input type="text" name="contact" placeholder="Contact Number" required>
        <input type="text" name="address" placeholder="Address" required>
        <select name="roomType" required>
            <option value="">Room Type</option>
            <option value="Standard">Standard</option>
            <option value="Deluxe">Deluxe</option>
            <option value="Suite">Suite</option>
        </select>
        <input type="date" name="checkIn" required>
        <input type="date" name="checkOut" required>
        <div class="full">
            <button type="submit">Save Reservation</button>
        </div>
    </form>
    <div class="msg"><%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %></div>
</div>
</body>
</html>
