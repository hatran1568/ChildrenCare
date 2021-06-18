/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Receiver;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import bean.User;
import bean.Reservation;
import bean.ReservationService;
import bean.Service;

/**
 *
 * @author HP
 */
public class ReservationDAO extends BaseDAO {

    public ArrayList<Reservation> getReservation(User u) {
        try {
            ArrayList<Reservation> list = new ArrayList<Reservation>();
            String sql = "SELECT\n"
                    + "reservation.id,\n"
                    + "reservation.customer_id,\n"
                    + "reservation.reservation_date,\n"
                    + "reservation.`status`,\n"
                    + "reservation.staff_id,\n"
                    + "reservation.number_of_person\n"
                    + "FROM\n"
                    + "reservation\n"
                    + "where customer_id =? ";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getId());
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Reservation r = new Reservation();
                r.setId(rs.getInt("id"));
                r.setCustomer(u);
                r.setReservation_date(rs.getDate("reservation_date"));
                User staff = new User();
                staff.setId(rs.getInt("staff_id"));
                r.setStaff(staff);
                r.setStatus(rs.getString("status"));
                list.add(r);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addReservation(Reservation r) {
        try {
            String sql = "insert into reservation(customer_id, reservation_date, status,\n"
                    + "            staff_id, number_of_person)\n"
                    + "            values(?, ?, ?, ?, ?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getCustomer().getId());
            stm.setDate(2, r.getReservation_date());
            stm.setString(3, r.getStatus());
            stm.setInt(4, r.getStaff().getId());
            stm.setInt(5, r.getNumber_of_person());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Reservation getReservationById(int id) {
        Reservation r = new Reservation();
        try {
            String sql = "select reservation.id, reservation.customer_id, reservation.reservation_date,\n"
                    + "            reservation.status, reservation.number_of_person,\n"
                    + "            user.email, user.full_name, user.mobile, user.image_link  \n"
                    + "            from reservation left join user\n"
                    + "            on reservation.staff_id = user.id\n"
                    + "where reservation.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                r.setId(rs.getInt("id"));
                User customer = new User();
                customer.setId(rs.getInt("customer_id"));
                r.setCustomer(customer);
                r.setReservation_date(rs.getDate("reservation_date"));
                r.setStatus(rs.getString("status"));
                r.setNumber_of_person(rs.getInt("number_of_person"));

                User staff = new User();
                staff.setEmail(rs.getString("email"));
                staff.setFullName(rs.getString("full_name"));
                staff.setMobile(rs.getString("mobile"));
                staff.setImageLink(rs.getString("image_link"));
                r.setStaff(staff);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public ArrayList<Service> getReservationServices(int reservation_id) {
        ArrayList<Service> services = new ArrayList<>();

        try {
            String sql = "select service.fullname, service.sale_price\n"
                    + "            from service left join reservation_service\n"
                    + "            on service.id = reservation_service.service_id\n"
                    + "   where reservation_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, reservation_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service s = new Service();
                s.setFullname(rs.getString("fullname"));
                s.setSalePrice(rs.getInt("sale_price"));
                services.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return services;
    }

    public void submitReservation(int reservation_id) {
        try {
            String sql = "update reservation set reservation.status = 'submitted'\n"
                    + "where reservation.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, reservation_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void changeStaffReservation(int reservation_id, int staff_id) {
        try {
            String sql = "update reservation set reservation.staff_id = ?\n"
                    + "where reservation.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, staff_id);
            stm.setInt(2, reservation_id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addReservationService(Reservation r, Service s, Receiver rc) {
        try {
            String sql = "insert into reservation_service(reservation_id, service_id, prescription_id, receiver_id,\n"
                    + "            datetime, unit_price)\n"
                    + "            values(?, ?, ?, ?, ?, ?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            stm.setInt(2, s.getId());
            stm.setInt(3, 1);
            stm.setInt(4, rc.getId());
            stm.setDate(5, r.getReservation_date());
            stm.setFloat(6, s.getSalePrice());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int countReservations(User staff) {
        try {
            String sql = "SELECT COUNT(*) as total FROM reservation WHERE staff_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, staff.getId());
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int returnNewestReservation() {
        try {
            int n = 0;
            String sql = "SELECT MAX(id) AS 'Maximum'\n"
                    + "FROM reservation";

            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                n = rs.getInt("Maximum");
            }
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public float getTotalCost(Reservation r){
        try {
            String sql ="select sum(unit_price) as sum FROM reservation_service where reservation_id =  ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return rs.getFloat("sum");
            }
          
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
          return 0;
    }
    
    public ReservationService getReservationServiceById(Reservation r){
       return null;
        
    }
}
