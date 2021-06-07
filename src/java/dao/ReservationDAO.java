/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import bean.User;
import bean.Reservation;
import bean.Service;

/**
 *
 * @author HP
 */
public class ReservationDAO extends BaseDAO {
    public void addReservation(Reservation r) {
        try {
            String sql = "insert into reservation(customer_id, reservation_date, checkup_time, status,\n"
                    + "            staff_id, number_of_person)\n"
                    + "            values(?, ?, ?, ?, ?, ?)";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getCustomer().getId());
            stm.setDate(2, r.getReservation_date());
            stm.setDate(3, r.getCheckup_time());
            stm.setString(4, r.getStatus());
            stm.setInt(5, r.getStaff().getId());
            stm.setInt(6, r.getNumber_of_person());
            
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
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
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
    
//    public void sendMail(String msgRecipient, String msgSubject, String msgTxt) throws Exception {
//        try {
//            InitialContext ic = new InitialContext();
//            String snName = "java:comp/env/mail/MyMailSession";
//            Session session = (Session)ic.lookup(snName);
//            Properties props = session.getProperties();
//            props.put("mail.from", "minhhnhe151181@fpt.edu.vn");
//            Message msg = new MimeMessage(session);
//            msg.setSubject(msgSubject);
//            msg.setSentDate(new Date());
//            msg.setFrom();
//            msg.setRecipients(Message.RecipientType.TO, 
//               InternetAddress.parse(msgRecipient, false));
//            msg.setText(msgTxt);
//        } catch (NamingException ex) {
//            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    
}
