<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Calculate Bill</title>
<style>
body {
    font-family: Arial, sans-seri;
     display: flex;
     justify-content: center;
     align-items: center;
     height: 100vh;
     margin: 0;
}
.card{
    width:420px;
    background:#fff;
    padding:30px;
    border-radius:10px;
}
h2{
    text-align:center;
    color:#007bff;
    margin-bottom:20px;
}
select,button{
    width:100%;
    padding:10px;
    margin-top:12px;
    border-radius:6px;
    font-size:14px;
}
select{
    border:1px solid #ccc;
}
button{
    background:#007bff;
    border:none;
    color:#fff;
    cursor:pointer;
}
button:hover{
    background:#0056b3;
}
.error{
    color:red;
    text-align:center;
    margin-top:15px;
}
</style>
</head>
<body>

<div class="card">
<h2>Calculate Bill</h2>

<form action="BillServlet" method="post">
<select name="reservationNo" required>
<option value="">Select Reservation</option>

<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/oceanview","root","");
    ps=con.prepareStatement("SELECT reservation_no FROM reservations");
    rs=ps.executeQuery();

    while(rs.next()){
%>
<option value="<%=rs.getString("reservation_no")%>">
<%=rs.getString("reservation_no")%>
</option>
<%
    }
}catch(Exception e){}
finally{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

</select>

<button type="submit">Calculate Bill</button>
</form>

<div class="error">
<%=request.getAttribute("error")!=null?request.getAttribute("error"):""%>
</div>

</div>

</body>
</html>
