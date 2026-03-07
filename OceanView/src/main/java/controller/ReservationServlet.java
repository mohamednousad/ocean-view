package controller;

import dao.ReservationDAO;
import model.Reservation;
import service.ReservationService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.Map;
import java.util.LinkedHashMap;

@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {

    private final ReservationDAO dao = new ReservationDAO();
    private final ReservationService reservationService = new ReservationService();

    String processReservation(String action, String id, String checkIn, String checkOut,
            String guestName, String contact, String roomType, String address) {

        switch (action != null ? action : "") {
            case "add": {
                Map<String, String> fields = new LinkedHashMap<>();
                fields.put("guestName", guestName);
                fields.put("address",   address);
                fields.put("contact",   contact);
                fields.put("roomType",  roomType);
                fields.put("checkIn",   checkIn);
                fields.put("checkOut",  checkOut);

                String error = reservationService.validateFields(fields);
                if (error == null) error = reservationService.validateDates(checkIn, checkOut);
                if (error != null) return error;

                Reservation r = buildReservation(null, guestName, contact, roomType, checkIn, checkOut, address);
                String newID = dao.create(r);
                return newID != null ? "Added Successfully" + ": " + newID : "Error adding reservation";
            }
            case "update": {
                String dateError = reservationService.validateDates(checkIn, checkOut);
                if (dateError != null) return dateError;

                Reservation r = buildReservation(id, guestName, contact, roomType, checkIn, checkOut, address);
                boolean updated = dao.update(r);
                return updated ? "Updated Successfully" : "Update Failed";
            }
            case "delete": {
                if (id == null || id.trim().isEmpty()) return "Delete Failed";
                boolean deleted = dao.delete(id);
                return deleted ? "Deleted Successfully" : "Delete Failed";
            }
            default:
                return "Invalid Action";
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        loadReservations(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action    = request.getParameter("action");
        String id        = request.getParameter("reservationNo");
        String checkIn   = request.getParameter("checkIn");
        String checkOut  = request.getParameter("checkOut");
        String guestName = request.getParameter("guestName");
        String contact   = request.getParameter("contact");
        String roomType  = request.getParameter("roomType");
        String address   = request.getParameter("address");

        String result = processReservation(action, id, checkIn, checkOut, guestName, contact, roomType, address);

        if (result.startsWith("Added Successfully") || result.startsWith("Updated") || result.startsWith("Deleted")) {
            request.setAttribute("msg", result);
        } else if (!result.equals("Invalid Action")) {
            request.setAttribute("error", result);
        }

        loadReservations(request, response);
    }

    private Reservation buildReservation(String id, String guestName, String contact,
            String roomType, String checkIn, String checkOut, String address) {
        Reservation r = new Reservation();
        if (id != null) r.setReservationNo(id);
        r.setGuestName(guestName);
        r.setContact(contact);
        r.setRoomType(roomType);
        r.setCheckIn(checkIn);
        r.setCheckOut(checkOut);
        r.setAddress(address);
        return r;
    }

    private void loadReservations(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("reservationList", dao.getAll());
        request.getRequestDispatcher("Reservation.jsp").forward(request, response);
    }
}