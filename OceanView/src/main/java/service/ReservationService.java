package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import util.DBConnection;

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
}