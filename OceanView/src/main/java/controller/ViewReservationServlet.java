package controller;

import dao.ReservationDAO;
import model.Reservation;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.List;


@WebServlet("/ViewReservationServlet")
public class ViewReservationServlet extends HttpServlet {
    private ReservationDAO dao = new ReservationDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        loadReservations(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String id = request.getParameter("reservationNo");

        if ("search".equals(action)) {
            Reservation r = dao.get(id);
            if (r != null) {
                request.setAttribute("reservation", r);
            } else {
                request.setAttribute("msg", "Reservation not found.");
            }
        } 
        else if ("delete".equals(action)) {
            if (dao.delete(id)) {
                request.setAttribute("msg", "Deleted Successfully");
            } else {
                request.setAttribute("msg", "Delete Failed");
            }
        } 
        else if ("update".equals(action)) {
            Reservation r = new Reservation();
            r.setReservationNo(id);
            r.setGuestName(request.getParameter("guestName"));
            r.setContact(request.getParameter("contact"));
            r.setRoomType(request.getParameter("roomType"));
            r.setCheckIn(request.getParameter("checkIn"));
            r.setCheckOut(request.getParameter("checkOut"));
            r.setAddress(request.getParameter("address"));
            
            if (dao.update(r)) {
                request.setAttribute("msg", "Updated Successfully");
                request.setAttribute("reservation", r); 
            } else {
                request.setAttribute("msg", "Update Failed");
            }
        }

        loadReservations(request, response);
    }

    private void loadReservations(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        List<Reservation> list = dao.getAll(); 
        request.setAttribute("reservationList", list);
        request.getRequestDispatcher("Reservation.jsp").forward(request, response);
    }
}