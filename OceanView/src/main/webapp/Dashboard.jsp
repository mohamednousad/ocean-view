<%
    if(session.getAttribute("username") == null){
        response.sendRedirect("index.jsp");
        return; 
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Ocean View Resort</title>
    <link rel="stylesheet" href="./css/style.css">
     <link rel="icon" type="image/x-icon" href="logo.ico">
</head>
<body>

<div class="dashboard-wrapper">
    <div class="sidebar">
        <h2><img src="logo.ico" alt="Logo" style="width: 24px; height: 24px; vertical-align: middle; margin-right: 8px;"> Welcome, <%= session.getAttribute("username") %>!</h2>
        <a href="ViewReservationServlet" target="contentFrame" class="active" onclick="setActive(this)">
            <i class="fa-solid fa-list-check"></i> Reservations
        </a>
        
        <a href="Bill.jsp" target="contentFrame" onclick="setActive(this)">
            <i class="fa-solid fa-file-invoice-dollar"></i> Calculate Bill
        </a>
        
        <a href="Help.jsp" target="contentFrame" onclick="setActive(this)">
            <i class="fa-solid fa-circle-question"></i> Help
        </a>
        
        <a class="logoutBtn" href="Logout.jsp">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
    </div>

    <div class="main">
        <div class="content">
            <iframe name="contentFrame" src="ViewReservationServlet"></iframe>
        </div>
        <div class="footer">
            &copy; 2026 Ocean View Resort. All Rights Reserved.
        </div>
    </div>
</div>

<script src="./js/script.js"></script>
</body>
</html>