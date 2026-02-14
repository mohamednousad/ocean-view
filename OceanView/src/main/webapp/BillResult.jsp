<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill</title>
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>

<div class="bill-wrapper">
    <div class="bill-container">
        
        <div class="bill-header">
            <h2>Ocean View Resort</h2>
            <p>Payment Invoice</p>
        </div>

        <div class="bill-section">
            <div class="bill-row">
                <span class="bill-label">Reservation No</span>
                <span class="bill-value">#${resNo}</span>
            </div>

            <div class="bill-row">
                <span class="bill-label">Guest Name</span>
                <span class="bill-value">${guest}</span>
            </div>

            <div class="bill-row">
                <span class="bill-label">Room Type</span>
                <span class="bill-value">${room}</span>
            </div>

            <div class="bill-row">
                <span class="bill-label">Check In</span>
                <span class="bill-value">${checkIn}</span>
            </div>

            <div class="bill-row">
                <span class="bill-label">Check Out</span>
                <span class="bill-value">${checkOut}</span>
            </div>

            <div class="bill-row">
                <span class="bill-label">Duration</span>
                <span class="bill-value">${days} Days</span>
            </div>

            <div class="bill-row">
                <span class="bill-label">Rate per Night</span>
                <span class="bill-value">Rs. ${rate}</span>
            </div>
        </div>

        <div class="bill-total">
            <span class="total-label">Total</span>
            <span class="total-amount">Rs. ${total}</span>
        </div>

        <div class="bill-actions">
            <button class="cancelBtn" onclick="window.location='Bill.jsp'">
                Back
            </button>
            <button class="updateBtn" onclick="window.print()">
                <i class="fas fa-print"></i> Print
            </button>
        </div>

    </div>
</div>

</body>
</html>