<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Reservations</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            width: 1200px;
        }
        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background: #007bff;
            color: #fff;
        }
        .btn {
            padding: 6px 12px;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            color: #fff;
        }
        .update {
            background: #007bff;
        }
        .update:hover {
            background: #0056b3;
        }
        .delete {
            background: #dc3545;
        }
        .delete:hover {
            background: #c82333;
        }
        .msg {
            margin-bottom: 15px;
            color: green;
        }
        .modal {
            display: none;
            position: fixed;
            top:0; left:0;
            width:100%; height:100%;
            background: rgba(0,0,0,0.5);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background:#fff;
            padding: 12px 35px;
            border-radius: 8px;
            width: 500px;
        }
        .modal-content input, 
        .modal-content select, 
        .modal-content textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
       .modal-content .modal-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
        }
        .updateBtn { 
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 12px;
            width: 48%;
            font-weight: bold;
         }
        .updateBtn:hover { background:#0056b3; }
        .cancelBtn { 
            background:#6c757d;
            color:#fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            padding: 12px;
            width: 48%;
            font-weight: bold;
         }
        .cancelBtn:hover { background:#5c636a; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Reservations</h2>
        <div class="msg"><%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %></div>
        <table>
            <tr>
                <th>Reservation No</th>
                <th>Name</th>
                <th>Contact</th>
                <th>Room</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            <%
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/oceanview","root","");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM reservations");
                while(rs.next()){
            %>
            <tr>
                <td><%= rs.getString("reservation_no") %></td>
                <td><%= rs.getString("guest_name") %></td>
                <td><%= rs.getString("contact") %></td>
                <td><%= rs.getString("room_type") %></td>
                <td><%= rs.getString("check_in") %></td>
                <td><%= rs.getString("check_out") %></td>
                <td><%= rs.getString("address") %></td>
                <td>
                    <button class="btn update" onclick="openModal('<%= rs.getString("reservation_no") %>','<%= rs.getString("guest_name") %>','<%= rs.getString("contact") %>','<%= rs.getString("room_type") %>','<%= rs.getString("check_in") %>','<%= rs.getString("check_out") %>','<%= rs.getString("address") %>')">Edit</button>
                    <form action="ViewReservationServlet" method="post" style="display:inline;">
                        <input type="hidden" name="reservationNo" value="<%= rs.getString("reservation_no") %>">
                        <input type="hidden" name="action" value="delete">
                        <button class="btn delete" type="submit">Delete</button>
                    </form>
                </td>
            </tr>
            <% } con.close(); %>
        </table>
    </div>

    <div class="modal" id="editModal">
        <div class="modal-content">
            <h3>Update Reservation</h3>
            <form method="post" action="ViewReservationServlet">
                <input type="hidden" name="reservationNo" id="modalReservationNo">
                <input type="text" name="guestName" id="modalGuestName" placeholder="Guest Name" required>
                <input type="text" name="contact" id="modalContact" placeholder="Contact Number" required>
                <select name="roomType" id="modalRoomType" required>
                    <option value="Standard">Standard</option>
                    <option value="Deluxe">Deluxe</option>
                    <option value="Suite">Suite</option>
                </select>
                <input type="date" name="checkIn" id="modalCheckIn" required>
                <input type="date" name="checkOut" id="modalCheckOut" required>
                <textarea name="address" id="modalAddress" placeholder="Address" required></textarea>
                <div class="modal-actions">
                    <button type="button" class="cancelBtn" onclick="closeModal()">Cancel</button>              
                    <button type="submit" class="updateBtn" name="action" value="update">Update</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openModal(no, name, contact, room, inDate, outDate, address){
            document.getElementById("modalReservationNo").value = no;
            document.getElementById("modalGuestName").value = name;
            document.getElementById("modalContact").value = contact;
            document.getElementById("modalRoomType").value = room;
            document.getElementById("modalCheckIn").value = inDate;
            document.getElementById("modalCheckOut").value = outDate;
            document.getElementById("modalAddress").value = address;
            document.getElementById("editModal").style.display = "flex";
        }
        function closeModal(){
            document.getElementById("editModal").style.display = "none";
        }
    </script>
</body>
</html>
