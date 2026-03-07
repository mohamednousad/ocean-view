package controller;

import dao.ReservationDAO;
import model.Reservation;
import service.BillingService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.List;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {
    private ReservationDAO rDao = new ReservationDAO();
    private BillingService billService = new BillingService();

    String processBill(String id) {
        if (id == null || id.trim().isEmpty()) {
            return "Reservation Not Found";
        }
        Reservation r = rDao.get(id);
        if (r == null) {
            return "Reservation Not Found";
        }
        long total = billService.calculateTotal(r.getCheckIn(), r.getCheckOut(), r.getRoomType());
        if (total <= 0) {
            return "Invalid billing calculation";
        }
        return "Bill Generated: " + total;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        loadReservations(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("reservationNo");
        String result = processBill(id);

        if (result.startsWith("Bill Generated")) {
            Reservation r = rDao.get(id);
            long total = billService.calculateTotal(r.getCheckIn(), r.getCheckOut(), r.getRoomType());
            long days = billService.getDays(r.getCheckIn(), r.getCheckOut());
            int rate = billService.getRate(r.getRoomType());

            request.setAttribute("resNo", r.getReservationNo());
            request.setAttribute("guest", r.getGuestName());
            request.setAttribute("room", r.getRoomType());
            request.setAttribute("checkIn", r.getCheckIn());
            request.setAttribute("checkOut", r.getCheckOut());
            request.setAttribute("days", days);
            request.setAttribute("rate", rate);
            request.setAttribute("total", total);

            request.getRequestDispatcher("BillResult.jsp").forward(request, response);
        } else {
            request.setAttribute("error", result);
            loadReservations(request, response);
        }
    }

    private void loadReservations(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Reservation> list = rDao.getAll();
        request.setAttribute("reservations", list);
        request.getRequestDispatcher("Bill.jsp").forward(request, response);
    }
}