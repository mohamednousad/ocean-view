<!DOCTYPE html>
<html>
<head>
<title>Dashboard - Ocean View Resort</title>
<style>
 body {
   font-family: Arial, sans-serif;
   margin: 0;
   display: flex;
   height: 100vh;
   background: #f8f9fa;
        }
.sidebar{
    width:230px;
    background:#075cb8;
    display:flex;
    flex-direction:column;
    padding:25px 0;
}
.sidebar h2{
    color:#fff;
    text-align:center;
    margin:0 0 30px 0;
    font-size:18px;
}
.sidebar a{
    color:#fff;
    padding:12px 25px;
    text-decoration:none;
    font-size:15px;
    display:block;
    transition:0.2s;
}
.sidebar a:hover{
    background:#ffffff;
    color:#000;
}
.logoutBtn{
    margin-top:auto;
    display:block;
    text-align:center;
    padding:10px 0;
    background:#fff;
    color:#000 !important;
    font-weight:600;
    border-radius:6px;
    text-decoration:none;
    transition:0.2s;
}

.main{
    flex:1;
    display:flex;
    flex-direction:column;
}
.content{
    flex:1;
    padding:25px;
}
iframe{
    width:100%;
    height:100%;
    border:none;
    border-radius:8px;
}
.footer{
    height:50px;
    background:#ffffff;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:14px;
    color:#666;
}
</style>
</head>
<body>

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
        © 2026 Ocean View Resort. All Rights Reserved.
    </div>
</div>

</body>
</html>