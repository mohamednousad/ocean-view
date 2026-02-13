import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reservationNo = request.getParameter("reservationNo");
        String guestName = request.getParameter("guestName");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String roomType = request.getParameter("roomType");
        String checkIn = request.getParameter("checkIn");
        String checkOut = request.getParameter("checkOut");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/oceanview", "root", "");
            String sql = "INSERT INTO reservations VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, reservationNo);
            ps.setString(2, guestName);
            ps.setString(3, address);
            ps.setString(4, contact);
            ps.setString(5, roomType);
            ps.setString(6, checkIn);
            ps.setString(7, checkOut);
            ps.executeUpdate();

            request.setAttribute("msg", "Reservation Added Successfully");
            RequestDispatcher rd = request.getRequestDispatcher("AddReservation.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
