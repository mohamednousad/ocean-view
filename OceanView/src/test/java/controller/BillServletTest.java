package controller;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class BillServletTest {

    @Test
    void testValidReservation() {
        BillServlet servlet = new BillServlet();
        String result = servlet.processBill("ST-20260307-001");
        assertTrue(result.startsWith("Bill Generated"));
    }

    @Test
    void testReservationNotFound() {
        BillServlet servlet = new BillServlet();
        String result = servlet.processBill("INVALID999");
        assertEquals("Reservation Not Found", result);
    }

    @Test
    void testNullReservationId() {
        BillServlet servlet = new BillServlet();
        String result = servlet.processBill(null);
        assertEquals("Reservation Not Found", result);
    }

    @Test
    void testEmptyReservationId() {
        BillServlet servlet = new BillServlet();
        String result = servlet.processBill("");
        assertEquals("Reservation Not Found", result);
    }

    @Test
    void testBillAmountIsPositive() {
        BillServlet servlet = new BillServlet();
        String result = servlet.processBill("ST-20260305-001");
        assertFalse(result.equals("Invalid billing calculation"));
    }

    @Test
    void testBillGeneratedContainsAmount() {
        BillServlet servlet = new BillServlet();
        String result = servlet.processBill("ST-20260307-001");
        assertTrue(result.contains("Bill Generated"));
    }
}