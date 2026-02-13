<!DOCTYPE html>
<html>
<head>
<title>Bill Details</title>
<style>
body{
    font-family:Arial, sans-seri;
     display: flex;
     justify-content: center;
     align-items: center;
     height: 100vh;
     margin: 0;
}
.container{
    width:520px;
    background:#ffffff;
    padding:35px;
    border-radius:12px;
}
h2{
    text-align:center;
    color:#198754;
    margin-bottom:25px;
}
.section{
    margin-bottom:15px;
}
.row{
    display:flex;
    justify-content:space-between;
    padding:6px 0;
    border-bottom:1px solid #eee;
}
.label{
    font-weight:600;
    color:#555;
}
.value{
    color:#222;
}
.total{
    display:flex;
    justify-content:space-between;
    margin-top:20px;
    font-size:18px;
    font-weight:700;
    color:#000;
}
.actions{
    margin-top:25px;
    display:flex;
    gap:10px;
}
button{
    flex:1;
    padding:10px;
    border:none;
    border-radius:6px;
    cursor:pointer;
    font-size:14px;
}
.print{
    background:#0d6efd;
    color:#fff;
}
.print:hover{
    background:#0b5ed7;
}
.back{
    background:#6c757d;
    color:#fff;
}
.back:hover{
    background:#5c636a;
}
</style>
</head>
<body>

<div class="container">

<h2>Ocean View Resort Bill</h2>

<div class="section">
<div class="row">
<span class="label">Reservation No</span>
<span class="value">${resNo}</span>
</div>

<div class="row">
<span class="label">Guest Name</span>
<span class="value">${guest}</span>
</div>

<div class="row">
<span class="label">Room Type</span>
<span class="value">${room}</span>
</div>

<div class="row">
<span class="label">Check In</span>
<span class="value">${checkIn}</span>
</div>

<div class="row">
<span class="label">Check Out</span>
<span class="value">${checkOut}</span>
</div>

<div class="row">
<span class="label">Total Days</span>
<span class="value">${days}</span>
</div>

<div class="row">
<span class="label">Rate Per Day</span>
<span class="value">Rs. ${rate}</span>
</div>
</div>

<div class="total">
<span>Total Amount</span>
<span>Rs. ${total}</span>
</div>

<div class="actions">
<button class="print" onclick="window.print()">Print Bill</button>
<button class="back" onclick="window.location='Bill.jsp'">Back</button>
</div>

</div>

</body>
</html>
