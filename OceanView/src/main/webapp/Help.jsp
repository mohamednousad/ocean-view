<!DOCTYPE html>
<html>
<head>
    <title>User Guide - Ocean View Resort</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
            background-color: #f4f7f9;
            margin: 0;
            padding: 40px;
            display: flex;
            justify-content: center;
        }
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            max-width: 900px;
            width: 100%;
        }
        h1 {
            color: #075cb8;
            text-align: center;
            border-bottom: 2px solid #075cb8;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }
        .section {
            margin-bottom: 50px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        .section:last-child {
            border-bottom: none;
        }
        .section h2 {
            color: #007bff;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        .section p {
            margin: 10px 0;
            line-height: 1.6;
            color: #333;
        }
        .section ul {
            margin-top: 10px;
            padding-left: 25px;
        }
        .section li {
            margin-bottom: 8px;
            color: #555;
        }
        .img-container {
            text-align: center;
            margin-top: 20px;
        }
        img {
            width: 100%;
            max-width: 750px;
            border-radius: 8px;
            border: 1px solid #ddd;
            transition: transform 0.3s ease;
        }
        .alert {
            background-color: #fff3cd;
            border-left: 5px solid #ffc107;
            padding: 15px;
            margin: 15px 0;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Ocean View Resort - User Guide</h1>

    <div class="section">
        <h2>1. System Login</h2>
        <p>Access the management dashboard by entering authorized credentials.</p>
        <ul>
            <li>Enter your unique <strong>Username</strong>.</li>
            <li>Enter your <strong>Password</strong>.</li>
            <li>Click <strong>Login</strong> to proceed.</li>
        </ul>
        <div class="alert">
            <strong>Note:</strong> If you enter incorrect credentials, you will see an error message as shown in the validation screenshots.
        </div>
        <div class="img-container">
            <img src="images/loginPage.jpeg" alt="Login Page View">
        </div>
    </div>

    <div class="section">
        <h2>2. Register a New Reservation</h2>
        <p>Follow these steps to book a room for a new guest.</p>
        <ul>
            <li>Navigate to the <strong>Add Reservation</strong> section.</li>
            <li>The <strong>Reservation Number</strong> is generated automatically by the system.</li>
            <li>Input the Guest Name, Address, and Contact Number.</li>
            <li>Select the preferred <strong>Room Type</strong> (Standard, Deluxe, or Suite).</li>
            <li>Select the Check-in and Check-out dates.</li>
            <li>Click <strong>Submit</strong> to save the booking to the database.</li>
        </ul>
        <div class="img-container">
            <img src="images/addReservation.jpeg" alt="Reservation Entry Form">
        </div>
    </div>

    <div class="section">
        <h2>3. Manage & Update Reservations</h2>
        <p>Review or modify existing guest information.</p>
        <ul>
            <li>Go to <strong>View Reservations</strong> to see the complete list.</li>
            <li>Use the <strong>Edit</strong> button to open the update form.</li>
            <li>Modify necessary fields and click <strong>Update</strong> to apply changes.</li>
            <li>Use the <strong>Delete</strong> button to remove a cancelled booking.</li>
        </ul>
        <div class="img-container">
            <img src="images/viewReservation.jpeg" alt="View List">
            <img src="images/updateReservation.jpeg" alt="Update Form" style="margin-top:10px;">
        </div>
    </div>

    <div class="section">
        <h2>4. Billing and Invoices</h2>
        <p>Calculate stay costs and provide guests with a printed bill.</p>
        <ul>
            <li>Select <strong>Calculate Bill</strong> from the menu.</li>
            <li>Choose the <strong>Reservation No</strong> from the dropdown menu.</li>
            <li>The system will calculate the total based on room rates and duration.</li>
            <li>Click <strong>Print</strong> to generate a physical copy for the guest.</li>
        </ul>
        <div class="img-container">
            <img src="images/calculateBill.jpeg" alt="Calculation Interface">
            <img src="images/printBill.jpeg" alt="Invoice Preview" style="margin-top:10px;">
        </div>
    </div>
</div>

</body>
</html>