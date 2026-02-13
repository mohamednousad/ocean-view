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
                RequestDispatcher rd = request.getRequestDispatcher("ViewReservation.jsp");
                rd.forward(request, response);
            }

            con.close();

        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
