import java.io.IOException;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException {

        String reservationNo=request.getParameter("reservationNo");

        try(
            Connection con=DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/oceanview","root",""
            );
            PreparedStatement ps=con.prepareStatement(
                "SELECT * FROM reservations WHERE reservation_no=?"
            )
        ){

            ps.setString(1,reservationNo);
            ResultSet rs=ps.executeQuery();

            if(rs.next()){

                LocalDate in=rs.getDate("check_in").toLocalDate();
                LocalDate out=rs.getDate("check_out").toLocalDate();

                long days=ChronoUnit.DAYS.between(in,out);

                String room=rs.getString("room_type");
                int rate;

                switch(room){
                    case "Standard": rate=5000; break;
                    case "Deluxe": rate=8000; break;
                    default: rate=12000;
                }

                long total=days*rate;

                request.setAttribute("resNo",reservationNo);
                request.setAttribute("guest",rs.getString("guest_name"));
                request.setAttribute("room",room);
                request.setAttribute("checkIn",in);
                request.setAttribute("checkOut",out);
                request.setAttribute("days",days);
                request.setAttribute("rate",rate);
                request.setAttribute("total",total);

                request.getRequestDispatcher("BillResult.jsp")
                       .forward(request,response);

            }else{
                request.setAttribute("error","Reservation Not Found");
                request.getRequestDispatcher("bill.jsp")
                       .forward(request,response);
            }

        }catch(Exception e){
            request.setAttribute("error","System Error");
            request.getRequestDispatcher("bill.jsp")
                   .forward(request,response);
        }
    }
}
