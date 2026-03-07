//package controller;
//
//import dao.ReservationDAO;
//import model.Reservation;
//import service.ReservationService;
//import service.ValidationService;
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//import java.util.Map;
//import java.util.LinkedHashMap;
//
//@WebServlet("/AddReservationServlet")
//public class AddReservationServlet extends HttpServlet {
//    private ReservationDAO dao = new ReservationDAO();
//    private ReservationService reservationService = new ReservationService();
//    private ValidationService validationService = new ValidationService();
//    
//
//    String processReservation(String checkIn, String checkOut, String guestName, String address, String contact, String roomType) {
//    	 Map<String, String> fields = new LinkedHashMap<>();
//    	    fields.put("guestName", guestName);
//    	    fields.put("address", address);
//    	    fields.put("contact", contact);
//    	    fields.put("roomType", roomType);
//    	    fields.put("checkIn", checkIn);
//    	    fields.put("checkOut", checkOut);
//
//    	    String validationError = validationService.validateFields(fields);
//    	    if (validationError != null) {
//    	        return validationError;
//    	    }
//
//    	    String dateError = reservationService.validateDates(checkIn, checkOut);
//    	    if (dateError != null) {
//    	        return dateError;
//    	    }
//
//    	    Reservation reservation = new Reservation();
//    	    reservation.setGuestName(guestName);
//    	    reservation.setAddress(address);
//    	    reservation.setContact(contact);
//    	    reservation.setRoomType(roomType);
//    	    reservation.setCheckIn(checkIn);
//    	    reservation.setCheckOut(checkOut);
//
//    	    String newID = dao.create(reservation);
//    	    return newID != null ? "Added Successfully " + newID : "Error adding reservation";
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        String result = processReservation(
//            request.getParameter("checkIn"),
//            request.getParameter("checkOut"),
//            request.getParameter("guestName"),
//            request.getParameter("address"),
//            request.getParameter("contact"),
//            request.getParameter("roomType")
//        );
//
//        if (result.startsWith("Added Successfully")) {
//            request.setAttribute("msg", result);
//        } else {
//            request.setAttribute("error", result);
//        }
//
//        request.getRequestDispatcher("ViewReservationServlet").forward(request, response);
//    }
//}