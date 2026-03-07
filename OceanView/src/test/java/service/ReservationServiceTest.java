package service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import java.util.LinkedHashMap;
import java.util.Map;

class ReservationServiceTest {

    private final ReservationService reservationService = new ReservationService();

    @Test
    void testValidateDatesValid() {
        String result = reservationService.validateDates("2026-11-10", "2026-11-12");
        assertNull(result);
    }

    @Test
    void testValidateDatesPastDates() {
        String result = reservationService.validateDates("2024-01-01", "2024-01-05");
        assertEquals("Dates cannot be in the past", result);
    }

    @Test
    void testValidateDatesCheckInAfterCheckOut() {
        String result = reservationService.validateDates("2026-11-12", "2026-11-10");
        assertEquals("Check-in date must be same or before the check-out date", result);
    }

    @Test
    void testValidateDatesSameDay() {
        String result = reservationService.validateDates("2026-11-10", "2026-11-10");
        assertNull(result);
    }

    @Test
    void testValidateDatesEmptyCheckIn() {
        String result = reservationService.validateDates("", "2026-11-10");
        assertEquals("Dates cannot be empty.", result);
    }

    @Test
    void testValidateDatesEmptyCheckOut() {
        String result = reservationService.validateDates("2026-11-10", "");
        assertEquals("Dates cannot be empty.", result);
    }

    @Test
    void testValidateDatesNullDates() {
        String result = reservationService.validateDates(null, null);
        assertEquals("Dates cannot be empty.", result);
    }

    @Test
    void testValidateDatesInvalidFormat() {
        String result = reservationService.validateDates("not-a-date", "2026-11-10");
        assertEquals("Invalid date format", result);
    }

    @Test
    void testValidateFieldsAllValid() {
        Map<String, String> fields = new LinkedHashMap<>();
        fields.put("guestName", "John Doe");
        fields.put("address",   "123 Main St");
        fields.put("contact",   "09123456789");
        fields.put("roomType",  "Standard");
        fields.put("checkIn",   "2026-11-10");
        fields.put("checkOut",  "2026-11-12");
        assertNull(reservationService.validateFields(fields));
    }

    @Test
    void testValidateFieldsEmptyField() {
        Map<String, String> fields = new LinkedHashMap<>();
        fields.put("guestName", "");
        fields.put("address",   "123 Main St");
        fields.put("contact",   "09123456789");
        fields.put("roomType",  "Standard");
        fields.put("checkIn",   "2026-11-10");
        fields.put("checkOut",  "2026-11-12");
        assertEquals("Please fill all required fields.", reservationService.validateFields(fields));
    }

    @Test
    void testValidateFieldsNullField() {
        Map<String, String> fields = new LinkedHashMap<>();
        fields.put("guestName", null);
        fields.put("contact",   "09123456789");
        assertEquals("Please fill all required fields.", reservationService.validateFields(fields));
    }
}