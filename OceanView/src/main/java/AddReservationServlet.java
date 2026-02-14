import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

            Date today = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
            String datePart = sdf.format(today);
            String roomChar = roomType.substring(0, 2).toUpperCase();

            String seqSql = "SELECT COUNT(*) FROM reservations WHERE reservation_no LIKE ?";
            PreparedStatement seqPs = con.prepareStatement(seqSql);
            seqPs.setString(1, roomChar + "-" + datePart + "%");
            ResultSet rs = seqPs.executeQuery();

            int seq = 1;
            if (rs.next()) {
                seq += rs.getInt(1);
            }
            String sequence = String.format("%03d", seq);
            String reservationNo = roomChar + "-" + datePart + "-" + sequence;

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

            request.setAttribute("msg", "Reservation Added Successfully: " + reservationNo);
            RequestDispatcher rd = request.getRequestDispatcher("AddReservation.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}