package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.time.LocalDate;
import util.DBConnection;
import model.Reservation;

public class ReservationService {

    public String generateReservationId(String roomType) throws Exception {
        String datePart = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String prefix = roomType.substring(0, 2).toUpperCase() + "-" + datePart;
        String sql = "SELECT COUNT(*) FROM reservations WHERE reservation_no LIKE ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, prefix + "%");
            ResultSet rs = ps.executeQuery();
            int sequence = rs.next() ? rs.getInt(1) + 1 : 1;
            return String.format("%s-%03d", prefix, sequence);
        }
    }

    public String validateDates(String checkInDate, String checkOutDate) {
        if (checkInDate == null || checkInDate.trim().isEmpty() ||
            checkOutDate == null || checkOutDate.trim().isEmpty()) {
            return "Dates cannot be empty.";
        }
        try {
            LocalDate checkIn  = LocalDate.parse(checkInDate);
            LocalDate checkOut = LocalDate.parse(checkOutDate);
            LocalDate today    = LocalDate.now();

            if (checkIn.isBefore(today) || checkOut.isBefore(today)) {
                return "Dates cannot be in the past";
            }
            if (checkIn.isAfter(checkOut)) {
                return "Check-in date must be same or before the check-out date";
            }
            return null;
        } catch (Exception e) {
            return "Invalid date format";
        }
    }

    public String validateFields(Map<String, String> fields) {
        for (Map.Entry<String, String> entry : fields.entrySet()) {
            if (entry.getValue() == null || entry.getValue().trim().isEmpty()) {
                return "Please fill all required fields.";
            }
        }
        return null;
    }
}