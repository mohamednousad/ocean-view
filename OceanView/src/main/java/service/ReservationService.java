package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.time.LocalDate;
import util.DBConnection;
import model.Reservation;

public class ReservationService {

    public String generateReservationId(String roomType) throws Exception {
        String datePart = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String roomChar = roomType.substring(0, 2).toUpperCase();
        String prefix = roomChar + "-" + datePart;
        
        String sql = "SELECT COUNT(*) FROM reservations WHERE reservation_no LIKE ?";
        
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setString(1, prefix + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            
            int sequence = 1;
            if (resultSet.next()) {
                sequence = resultSet.getInt(1) + 1;
            }
            
            return String.format("%s-%03d", prefix, sequence);
        }
    }
    
    public String validateDates(String checkInDate, String checkOutDate) {
        if (checkInDate == null || checkInDate.trim().isEmpty() || checkOutDate == null || checkOutDate.trim().isEmpty()) {
            return "Dates cannot be empty.";
        }
        
        try {
            LocalDate checkIn = LocalDate.parse(checkInDate);
            LocalDate checkOut = LocalDate.parse(checkOutDate);
            LocalDate today = LocalDate.now();

            if (checkIn.isBefore(today) || checkOut.isBefore(today)) {
                return "Dates cannot be in the past.";
            }

            if (!checkOut.isAfter(checkIn)) {
                return "Check-out date must be after the check-in date.";
            }
            
            return null;
        } catch (Exception e) {
            return "Invalid date format.";
        }
    }
}