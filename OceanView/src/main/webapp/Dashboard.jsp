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
        <h2><i class="fa-solid fa-hotel"></i> Welcome, <%= request.getAttribute("username") %>!</h2>
        
        <a href="AddReservation.jsp" target="contentFrame" class="active" onclick="setActive(this)">
            <i class="fa-solid fa-calendar-plus"></i> Add Reservation
        </a>
        
        <a href="ViewReservation.jsp" target="contentFrame" onclick="setActive(this)">
            <i class="fa-solid fa-list-check"></i> View Reservation
        </a>
        
        <a href="Bill.jsp" target="contentFrame" onclick="setActive(this)">
            <i class="fa-solid fa-file-invoice-dollar"></i> Calculate Bill
        </a>
        
        <a href="Help.jsp" target="contentFrame" onclick="setActive(this)">
            <i class="fa-solid fa-circle-question"></i> Help
        </a>
        
        <a class="logoutBtn" href="LogoutServlet">
            <i class="fa-solid fa-right-from-bracket"></i> Logout
        </a>
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

<script>
    function setActive(element) {
        const links = document.querySelectorAll('.sidebar a:not(.logoutBtn)');
        links.forEach(link => {
            link.classList.remove('active');
        });
        element.classList.add('active');
    }
</script>

</body>
</html>