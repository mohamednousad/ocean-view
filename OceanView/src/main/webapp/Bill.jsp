<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill</title>
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <style>
        body { background: transparent; padding: 0; margin: 0; }
        #reservationSelect {
            height: 180px; 
            overflow-y: auto;
        }
    </style>
</head>
<body>

<div class="bill-wrapper">
    <div class="bill-card">
        <h2 class="bill-title">Calculate Bill</h2>
        
        <form action="BillServlet" method="post">
            <div class="input-group">
                <label class="modal-label">Search Reservations</label>
                <div class="search-wrapper">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" id="searchInput" onkeyup="filterReservations()" class="search-input" placeholder="Search by value...">
                </div>
            </div>

            <div class="input-group">
                <label class="modal-label">Select Reservation</label>
                <select name="reservationNo" id="reservationSelect" class="form-select" required size="5">
                    <%
                    Connection con=null;
                    PreparedStatement ps=null;
                    ResultSet rs=null;

                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oceanview","root","");
                        ps=con.prepareStatement("SELECT reservation_no, guest_name FROM reservations ORDER BY reservation_no DESC");
                        rs=ps.executeQuery();

                        while(rs.next()){
                    %>
                    <option value="<%=rs.getString("reservation_no")%>">
                        #<%=rs.getString("reservation_no")%> - <%=rs.getString("guest_name")%>
                    </option>
                    <%
                        }
                    }catch(Exception e){
                    }finally{
                        if(rs!=null) rs.close();
                        if(ps!=null) ps.close();
                        if(con!=null) con.close();
                    }
                    %>
                </select>
            </div>

            <button type="submit" class="btn primary" style="width: 100%; margin-top: 10px;">
                Calculate
            </button>
        </form>

        <div class="error" style="margin-top: 10px;">
            <%=request.getAttribute("error")!=null ? request.getAttribute("error") : ""%>
        </div>
    </div>
</div>

<script src="./js/script.js"></script>
</body>
</html>