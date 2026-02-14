import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/ViewReservationServlet")
public class ViewReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reservationNo = request.getParameter("reservationNo");
        String action = request.getParameter("action");
        String guestName = request.getParameter("guestName");
        String contact = request.getParameter("contact");
        String roomType = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/oceanview", "root", "");

            if ("delete".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                        "DELETE FROM reservations WHERE reservation_no=?");
                ps.setString(1, reservationNo);
                ps.executeUpdate();
                request.setAttribute("msg", "Reservation Deleted Successfully");
            }

            if ("update".equals(action)) {
                PreparedStatement ps = con.prepareStatement(
                        "UPDATE reservations SET guest_name=?, contact=?, room_type=?, check_in=?, check_out=?, address=? WHERE reservation_no=?");
                ps.setString(1, guestName);
                ps.setString(2, contact);
                ps.setString(3, roomType);
                ps.setString(4, checkIn);
                ps.setString(5, checkOut);
                ps.setString(6, address);
                ps.setString(7, reservationNo);
                ps.executeUpdate();
                request.setAttribute("msg", "Reservation Updated Successfully");
            }

            RequestDispatcher rd = request.getRequestDispatcher("ViewReservation.jsp");
            rd.forward(request, response);

            con.close();

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
