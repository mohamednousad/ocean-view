package controller;

import dao.ReservationDAO;
import model.Reservation;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    private ReservationDAO dao = new ReservationDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Reservation reservation = new Reservation();
        reservation.setGuestName(request.getParameter("guestName"));
        reservation.setAddress(request.getParameter("address"));
        reservation.setContact(request.getParameter("contact"));
        reservation.setRoomType(request.getParameter("roomType"));
        reservation.setCheckIn(request.getParameter("checkIn"));
        reservation.setCheckOut(request.getParameter("checkOut"));

        String newID = dao.create(reservation);

        if (newID != null) {
            request.setAttribute("msg", "Added Successfully!: " + newID);
        } else {
            request.setAttribute("msg", "Error adding reservation.");
        }
        request.getRequestDispatcher("ViewReservationServlet").forward(request, response);
    }
}