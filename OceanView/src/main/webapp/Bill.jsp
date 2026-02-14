<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculate Bill</title>
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <style>
        body { padding: 0; background: transparent; }
    </style>
</head>
<body>

<div class="bill-wrapper">
    <div class="bill-card">
        <h2 style="text-align: center;">Calculate Bill</h2>
        
        <form action="BillServlet" method="post">
            <label style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 8px; display: block;">Search Reservations</label>
            
            <div class="search-wrapper">
                <i class="fas fa-search search-icon"></i>
                <input type="text" id="searchInput" onkeyup="filterReservations()" class="search-input" placeholder="Type ID to search...">
            </div>

            <select name="reservationNo" id="reservationSelect" class="form-select" required size="5">
                <option value="" disabled selected>Select from list below</option>
                <%
                Connection con=null;
                PreparedStatement ps=null;
                ResultSet rs=null;

                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oceanview","root","");
                    ps=con.prepareStatement("SELECT reservation_no FROM reservations ORDER BY reservation_no DESC");
                    rs=ps.executeQuery();

                    while(rs.next()){
                %>
                <option value="<%=rs.getString("reservation_no")%>">
                    <%=rs.getString("reservation_no")%>
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

            <button type="submit" class="btn update" style="width: 100%; padding: 14px; font-size: 1rem;">Calculate</button>
        </form>

        <div class="error">
            <%=request.getAttribute("error")!=null ? request.getAttribute("error") : ""%>
        </div>
    </div>
</div>

<script>
    function filterReservations() {
        var input = document.getElementById("searchInput");
        var filter = input.value.toUpperCase();
        
        var select = document.getElementById("reservationSelect");
        var options = select.getElementsByTagName("option");

        for (var i = 0; i < options.length; i++) {
            var txtValue = options[i].textContent || options[i].innerText;
            
            if (options[i].disabled) continue;

            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                options[i].style.display = "";
            } else {
                options[i].style.display = "none";
            }
        }
    }
</script>

</body>
</html>