package controller;

import dao.ReservationDAO;
import model.Reservation;
import service.ReservationService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddReservationServlet")
public class AddReservationServlet extends HttpServlet {
    private ReservationDAO dao = new ReservationDAO();
    private ReservationService service = new ReservationService();

    String processReservation(String checkIn, String checkOut, String guestName, String address, String contact, String roomType) {
        String dateError = service.validateDates(checkIn, checkOut);
        if (dateError != null) {
            return dateError;
        }

        Reservation reservation = new Reservation();
        reservation.setGuestName(guestName);
        reservation.setAddress(address);
        reservation.setContact(contact);
        reservation.setRoomType(roomType);
        reservation.setCheckIn(checkIn);
        reservation.setCheckOut(checkOut);

        String newID = dao.create(reservation);
        return newID != null ? "Added Successfully: " + newID : "Error adding reservation.";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String result = processReservation(
            request.getParameter("checkIn"),
            request.getParameter("checkOut"),
            request.getParameter("guestName"),
            request.getParameter("address"),
            request.getParameter("contact"),
            request.getParameter("roomType")
        );

        if (result.startsWith("Added Successfully")) {
            request.setAttribute("msg", result);
        } else {
            request.setAttribute("error", result);
        }

        request.getRequestDispatcher("ViewReservationServlet").forward(request, response);
    }
}