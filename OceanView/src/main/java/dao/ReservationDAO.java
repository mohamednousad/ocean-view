package dao;

import model.Reservation;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import service.ReservationService;

public class ReservationDAO {
  private ReservationService reservationService = new ReservationService();
     public String create(Reservation reservation) {
        String sql = "INSERT INTO reservations (reservation_no, guest_name, address, contact, room_type, check_in, check_out) VALUES (?,?,?,?,?,?,?)";
        
        try (Connection connection = DBConnection.getConnection()) {
            String roomType = reservation.getRoomType();
            String reservationNo = reservationService.generateReservationId(roomType);

            try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, reservationNo);
                preparedStatement.setString(2, reservation.getGuestName());
                preparedStatement.setString(3, reservation.getAddress());
                preparedStatement.setString(4, reservation.getContact());
                preparedStatement.setString(5, reservation.getRoomType());
                preparedStatement.setString(6, reservation.getCheckIn());
                preparedStatement.setString(7, reservation.getCheckOut());
                preparedStatement.executeUpdate();
                
                return reservationNo;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<Reservation> getAll() {
        List<Reservation> list = new ArrayList<>();
        String sql = "SELECT * FROM reservations ORDER BY created_at DESC";
        
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            
            while (rs.next()) {
                list.add(new Reservation(
                    rs.getString("reservation_no"),
                    rs.getString("guest_name"),
                    rs.getString("address"),
                    rs.getString("contact"),
                    rs.getString("room_type"),
                    rs.getString("check_in"),
                    rs.getString("check_out")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
    public Reservation get(String id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM reservations WHERE reservation_no=?")) {
            
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Reservation(
                    rs.getString("reservation_no"), rs.getString("guest_name"),
                    rs.getString("address"), rs.getString("contact"),
                    rs.getString("room_type"), rs.getString("check_in"), rs.getString("check_out")
                );
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }
    
    public boolean update(Reservation reservation) {
        String sql = "UPDATE reservations SET guest_name=?, contact=?, room_type=?, check_in=?, check_out=?, address=? WHERE reservation_no=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, reservation.getGuestName());
            ps.setString(2, reservation.getContact());
            ps.setString(3, reservation.getRoomType());
            ps.setString(4, reservation.getCheckIn());
            ps.setString(5, reservation.getCheckOut());
            ps.setString(6, reservation.getAddress());
            ps.setString(7, reservation.getReservationNo());
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) { e.printStackTrace(); return false; }
    }

    public boolean delete(String id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM reservations WHERE reservation_no=?")) {
            
            ps.setString(1, id);
            return ps.executeUpdate() > 0;
            
        } catch (Exception e) { e.printStackTrace(); return false; }
    }
}