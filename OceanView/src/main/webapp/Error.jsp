!DOCTYPE html>
<html>
<head>
<title>Error</title>
<style>
body{
    font-family:Arial;
    background:#f8d7da;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
    margin:0;
}
.box{
    background:white;
    padding:30px;
    border-radius:6px;
    width:400px;
    text-align:center;
}
h2{
    color:#dc3545;
}
a{
    display:inline-block;
    margin-top:15px;
    text-decoration:none;
    background:#007bff;
    color:white;
    padding:8px 15px;
    border-radius:4px;
}
</style>
</head>
<body>

<div class="box">
    <h2>System Error</h2>
    <p>${error}</p>
    <a href="Dashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>
