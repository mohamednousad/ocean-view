//package controller;
//
//import static org.junit.jupiter.api.Assertions.*;
//
//import org.junit.jupiter.api.Test;
//
//class AddReservationServletTest {
//
//    @Test
//    void testValidDates() {
//        AddReservationServlet servlet = new AddReservationServlet();
//        String result = servlet.processReservation(
//            "2026-03-04", "2026-03-04",
//            "John Doe", "123 Main St", "09123456789", "Standard"
//        );
//        assertTrue(result.contains("Added Successfully"));
//    }
//    
//    @Test
//    void testWithPastDates() {
//        AddReservationServlet servlet = new AddReservationServlet();
//        String result = servlet.processReservation(
//            "2026-03-01", "2026-03-01",
//            "John Doe", "123 Main St", "09123456789", "Standard"
//        );
//        assertEquals("Dates cannot be in the past", result);
//    }
//    
//    @Test
//    void testCheckInAfterCheckOut() {
//        AddReservationServlet servlet = new AddReservationServlet();
//        String result = servlet.processReservation(
//            "2026-03-05", "2026-03-04",
//            "John Doe", "123 Main St", "09123456789", "Standard"
//        );
//        assertEquals("Check-in date must be same or before the check-out date", result);
//    }
//
//}