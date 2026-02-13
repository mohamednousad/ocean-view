<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Reservations</title>
    <style>
     	body {
            font-family: Arial, sans-seri;
        }
        .container {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            width: 1200px;
            margin: auto;
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
        .delete {
            background: #dc3545;
        }
        .msg {
            margin-bottom: 15px;
            color: green;
        }
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
            <td>
                <form action="ViewReservationServlet" method="post" style="display:inline;">
                    <input type="hidden" name="reservationNo" value="<%= rs.getString("reservation_no") %>">
                    <input type="hidden" name="action" value="delete">
                    <button class="btn delete">Delete</button>
                </form>
            </td>
        </tr>
        <%
            }
            con.close();
        %>
    </table>
</div>
</body>
</html>
