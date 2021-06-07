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
import bean.Service;

/**
 *
 * @author HP
 */
public class ReceiverDAO extends BaseDAO {
    public void addReceiver(Receiver r) {
        try {
            String sql = "insert into receiver(id, user_id, full_name, gender,\n"
                    + "            mobile, address, email)\n"
                    + "            values(?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            stm.setInt(2, r.getUser().getId());
            stm.setString(3, r.getFull_name());
            stm.setBoolean(4, r.isGender());
            stm.setString(5, r.getMobile());
            stm.setString(6, r.getAddress());
            stm.setString(7, r.getEmail());
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Receiver> getReceiversByUser(User u) {
        ArrayList<Receiver> receivers = new ArrayList<>();
        try {
            String sql = "select * from receiver where user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Receiver r = new Receiver();
                r.setId(rs.getInt("id"));
                r.setUser(u);
                r.setFull_name(rs.getString("full_name"));
                r.setGender(rs.getBoolean("gender"));
                r.setMobile(rs.getString("mobile"));
                r.setAddress(rs.getString("address"));
                r.setEmail(rs.getString("email"));
                receivers.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return receivers;
    }
    
    public Receiver getReceiversById(int id) {
        Receiver r = new Receiver();
        try {
            String sql = "select * from receiver where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            r.setId(rs.getInt("id"));
            User u = new User();
            u.setId(rs.getInt("user_id"));
            r.setUser(u);
            r.setFull_name(rs.getString("full_name"));
            r.setGender(rs.getBoolean("gender"));
            r.setMobile(rs.getString("mobile"));
            r.setAddress(rs.getString("address"));
            r.setEmail(rs.getString("email"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
}
