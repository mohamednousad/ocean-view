package controller;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class ReservationServletTest {

	 @Test
	    void testCreateValidDates() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("add", null, "2026-11-20", "2026-11-20",
	                "John Doe", "09123456789", "Standard", "123 Main St");
	        assertTrue(result.contains("Added Successfully"));
	    }

	    @Test
	    void testCreatePastDates() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("add", null, "2026-03-01", "2026-03-06",
	                "John Doe", "09123456789", "Standard", "123 Main St");
	        assertEquals("Dates cannot be in the past", result);
	    }

	    @Test
	    void testCreateCheckInAfterCheckOut() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("add", null, "2026-10-21", "2026-10-20",
	                "John Doe", "09123456789", "Standard", "123 Main St");
	        assertEquals("Check-in date must be same or before the check-out date", result);
	    }

	    @Test
	    void testCreateEmptyFields() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("add", null, "2026-10-20", "2026-10-20",
	                "", "09123456789", "Standard", "123 Main St");
	        assertEquals("Please fill all required fields.", result);
	    }

	    @Test
	    void testCreateSameCheckInAndCheckOut() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("add", null, "2026-03-10", "2026-03-10",
	                "Jane Doe", "09987654321", "Deluxe", "456 Oak Ave");
	        assertTrue(result.contains("Added Successfully"));
	    }

	    @Test
	    void testUpdateValidDates() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("update", "ST-20260307-001", "2026-03-22", "2026-03-22",
	                "John Doe", "09123456789", "Standard", "123 Main St");
	        assertEquals("Updated Successfully", result);
	    }

	    @Test
	    void testUpdateInvalidDates() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("update", "ST-20260307-001", "2026-03-12", "2026-03-10",
	                "John Doe", "09123456789", "Standard", "123 Main St");
	        assertEquals("Check-in date must be same or before the check-out date", result);
	    }

	    @Test
	    void testUpdatePastDates() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("update", "ST-20260307-001", "2024-01-01", "2024-01-05",
	                "John Doe", "09123456789", "Standard", "123 Main St");
	        assertEquals("Dates cannot be in the past", result);
	    }

	    @Test
	    void testDeleteValidId() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("delete", "ST-20260307-001", null, null, null, null, null, null);
	        assertEquals("Deleted Successfully", result);
	    }

	    @Test
	    void testDeleteEmptyId() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("delete", "", null, null, null, null, null, null);
	        assertEquals("Delete Failed", result);
	    }

	    @Test
	    void testInvalidAction() {
	        ReservationServlet servlet = new ReservationServlet();
	        String result = servlet.processReservation("unknown", null, null, null, null, null, null, null);
	        assertEquals("Invalid Action", result);
	    }

}
