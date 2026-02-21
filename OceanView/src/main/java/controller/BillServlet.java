package controller;

import dao.ReservationDAO;
import model.Reservation;
import service.BillingService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {
    private ReservationDAO rDao = new ReservationDAO();
    private BillingService bService = new BillingService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("reservationNo");
        Reservation r = rDao.get(id);

        if (r != null) {
            long total = bService.calculateTotal(r.getCheckIn(), r.getCheckOut(), r.getRoomType());
            long days = bService.getDays(r.getCheckIn(), r.getCheckOut());
            int rate = bService.getRate(r.getRoomType());

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
            request.setAttribute("error", "Reservation Not Found");
            request.getRequestDispatcher("Bill.jsp").forward(request, response);
        }
    }
}