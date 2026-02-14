<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Ocean View Resort</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>

<div class="dashboard-wrapper">
    <div class="sidebar">
        <h2>Welcome, <%= request.getAttribute("username") %>!</h2>
        <a href="AddReservation.jsp" target="contentFrame">Add Reservation</a>
        <a href="ViewReservation.jsp" target="contentFrame">View Reservation</a>
        <a href="Bill.jsp" target="contentFrame">Calculate Bill</a>
        <a href="Help.jsp" target="contentFrame">Help</a>
        <a class="logoutBtn" href="LogoutServlet">Logout</a>
    </div>

    <div class="main">
        <div class="content">
            <iframe name="contentFrame" src="AddReservation.jsp"></iframe>
        </div>
        <div class="footer">
            &copy; 2026 Ocean View Resort. All Rights Reserved.
        </div>
    </div>
</div>

</body>
</html>