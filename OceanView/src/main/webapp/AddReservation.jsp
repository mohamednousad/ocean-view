<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation</title>
    <style>
      body {
          font-family: Arial, sans-serif;
          background: #f8f9fa;
      }
      .container {
          background: #fff;
          padding: 40px;
          border-radius: 8px;
          width: 1000px;
          margin: 50px auto;
      }
      h2 {
          color: #007bff;
          margin-bottom: 25px;
      }
      form {
          display: flex;
          flex-direction: column;
          gap: 20px;
      }
      .row {
          display: flex;
          gap: 20px;
      }
      .row input, .row select {
          flex: 1;
          padding: 12px;
          border: 1px solid #ccc;
          border-radius: 5px;
          font-size: 14px;
      }
      textarea {
          width: 100%;
          height: 80px;
          padding: 12px;
          border: 1px solid #ccc;
          border-radius: 5px;
          font-size: 14px;
          resize: none;
      }
      button {
          padding: 12px 30px;
          background: #007bff;
          color: #fff;
          border: none;
          border-radius: 5px;
          cursor: pointer;
          font-size: 16px;
      }
      button:hover {
          background: #0056b3;
      }
      .full {
          width: 100%;
      }
      .msg {
          color: green;
          margin-bottom: 20px;
      }
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
                <option value="">Select Type</option>
                <option value="Standard">Standard</option>
                <option value="Deluxe">Deluxe</option>
                <option value="Suite">Suite</option>
            </select>
        </div>
        <div class="row">
            <input type="date" name="checkIn" required>
            <input type="date" name="checkOut" required>
        </div>
         <textarea name="address" placeholder="Enter Address" required></textarea>
        <div class="full">
            <button type="submit">Save Reservation</button>
        </div>
    </form>
</div>
</body>
</html>
