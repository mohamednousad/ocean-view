<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Reservations</title>
    <link rel="stylesheet" href="./css/style.css">
    <style>
        body { background: transparent; padding: 20px; }
        .container { margin: 0 auto; width: 100%; box-shadow: none; border: 1px solid #e5e7eb; }
        .table-responsive { overflow-x: auto; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Manage Reservations</h2>
        <div class="msg"><%= request.getAttribute("msg") != null ? request.getAttribute("msg") : "" %></div>
        <div class="table-responsive">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Guest Name</th>
                        <th>Contact</th>
                        <th>Room</th>
                        <th>Check In</th>
                        <th>Check Out</th>
                        <th>Address</th>
                        <th style="text-align: center;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/oceanview","root","");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM reservations");
                            while(rs.next()){
                    %>
                    <tr>
                        <td><strong>#<%= rs.getString("reservation_no") %></strong></td>
                        <td><%= rs.getString("guest_name") %></td>
                        <td><%= rs.getString("contact") %></td>
                        <td><span style="background:#e0e7ff; color:#4f46e5; padding:4px 8px; border-radius:4px; font-size:0.8rem; font-weight:600;"><%= rs.getString("room_type") %></span></td>
                        <td><%= rs.getString("check_in") %></td>
                        <td><%= rs.getString("check_out") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td style="text-align: center;">
                            <button class="btn update" onclick="openModal('<%= rs.getString("reservation_no") %>','<%= rs.getString("guest_name") %>','<%= rs.getString("contact") %>','<%= rs.getString("room_type") %>','<%= rs.getString("check_in") %>','<%= rs.getString("check_out") %>','<%= rs.getString("address") %>')">Edit</button>
                            <form action="ViewReservationServlet" method="post" style="display:inline;">
                                <input type="hidden" name="reservationNo" value="<%= rs.getString("reservation_no") %>">
                                <input type="hidden" name="action" value="delete">
                                <button class="btn delete" type="submit" onclick="return confirm('Are you sure you want to delete this?')">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                            } 
                            con.close(); 
                        } catch(Exception e) { out.print("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>"); }
                    %>
                </tbody>
            </table>
        </div>
    </div>

  <div class="modal" id="editModal">
    <div class="modal-content">
        <h3>Update Reservation</h3>
        
        <form method="post" action="ViewReservationServlet" class="modal-form-grid">
            <input type="hidden" name="reservationNo" id="modalReservationNo">
            
            <div class="input-group">
                <label class="modal-label">Guest Name</label>
                <input type="text" name="guestName" id="modalGuestName" class="modal-input" required>
            </div>
            
            <div class="input-group">
                <label class="modal-label">Contact</label>
                <input type="text" name="contact" id="modalContact" class="modal-input" required>
            </div>
            
            <div class="input-group">
                <label class="modal-label">Room Type</label>
                <select name="roomType" id="modalRoomType" class="modal-select" required>
                    <option value="Standard">Standard</option>
                    <option value="Deluxe">Deluxe</option>
                    <option value="Suite">Suite</option>
                </select>
            </div>
            
            <div class="date-row">
                <div class="input-group">
                    <label class="modal-label">Check In</label>
                    <input type="date" name="checkIn" id="modalCheckIn" class="modal-input" required>
                </div>
                <div class="input-group">
                    <label class="modal-label">Check Out</label>
                    <input type="date" name="checkOut" id="modalCheckOut" class="modal-input" required>
                </div>
            </div>
            
            <div class="input-group full-width">
                <label class="modal-label">Residential Address</label>
                <textarea name="address" id="modalAddress" class="modal-textarea" required></textarea>
            </div>
            
            <div class="modal-actions full-width">
                <button type="button" class="cancelBtn" onclick="closeModal()">Cancel</button>              
                <button type="submit" class="updateBtn" name="action" value="update">Save Changes</button>
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
        
        window.onclick = function(event) {
            var modal = document.getElementById("editModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</body>
</html>