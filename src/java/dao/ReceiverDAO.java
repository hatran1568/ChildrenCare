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
            String sql = "insert into receiver(user_id, full_name, gender,\n"
                    + "            mobile, address, email)\n"
                    + "            values(?, ?, ?, ?, ?, ?)";

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, r.getUser().getId());
            stm.setString(2, r.getFullName());
            stm.setBoolean(3, r.isGender());
            stm.setString(4, r.getMobile());
            stm.setString(5, r.getAddress());
            stm.setString(6, r.getEmail());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Receiver> getReceivers(int userid) {
        ArrayList<Receiver> receiver = new ArrayList<>();
        try {

            String sql = "SELECT ROW_NUMBER() OVER (ORDER BY id ASC) as rid, r.user_id, r.full_name, r.gender, r.mobile, r.address, r.email "
                    + "FROM receiver r where r.user_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Receiver r = new Receiver();
                User u = new User();
                u.setId(rs.getInt("user_id"));
                r.setId(rs.getInt("rid") - 1);
                r.setUser(u);
                r.setFullName(rs.getString("full_name"));
                r.setGender(rs.getBoolean("gender"));
                r.setMobile(rs.getString("mobile"));
                r.setAddress(rs.getString("address"));
                r.setEmail(rs.getString("email"));
                receiver.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return receiver;
    }

    public Receiver getReceiversById(int id) {
        Receiver r = new Receiver();
        try {
            String sql = "select * from receiver where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                 r.setId(rs.getInt("id"));
            User u = new User();
            u.setId(rs.getInt("user_id"));
            r.setUser(u);
            r.setFullName(rs.getString("full_name"));
            r.setGender(rs.getBoolean("gender"));
            r.setMobile(rs.getString("mobile"));
            r.setAddress(rs.getString("address"));
            r.setEmail(rs.getString("email"));
            }
           
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;

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
                r.setFullName(rs.getString("full_name"));
                r.setGender(rs.getBoolean("gender"));
                r.setMobile(rs.getString("mobile"));
                r.setAddress(rs.getString("address"));
                r.setEmail(rs.getString("email"));

                receivers.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ReceiverDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return receivers;
    }

    public boolean checkExistingReceiver(String email) {
        Receiver r = new Receiver();
        try {
            String sql = "select * from receiver where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                r.setId(rs.getInt("id"));
                User u = new User();
                u.setId(rs.getInt("user_id"));
                r.setUser(u);
                r.setFullName(rs.getString("full_name"));
                r.setGender(rs.getBoolean("gender"));
                r.setMobile(rs.getString("mobile"));
                r.setAddress(rs.getString("address"));
                r.setEmail(rs.getString("email"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (r.getEmail() != null) {
            return true;
        }
        return false;
    }

    public Receiver getReceiverByEmail(String Emaill) {
        try {
            Receiver r = new Receiver();
            String sql = "select * from receiver where email=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, Emaill);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                r.setId(rs.getInt("id"));
                r.setEmail(Emaill);
                r.setFullName(rs.getString("full_name"));
                User u = new User();
                u.setId(rs.getInt("user_id"));
                r.setUser(u);
                r.setMobile(rs.getString("mobile"));
                r.setAddress(rs.getString("address"));

            }
            return r;
        } catch (SQLException ex) {
            Logger.getLogger(ReceiverDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateReceiverInfo(Receiver r){
        try {
            String sql = "UPDATE `swp`.`receiver`\n" +
                    "SET\n" +
                    "`full_name` = ?,\n" +
                    "`gender` = ?,\n" +
                    "`mobile` = ?,\n" +
                    "`address` = ?\n" +
                    "WHERE `id` = ?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, r.getFullName());
            stm.setBoolean(2, r.isGender());
            stm.setString(3, r.getMobile());
            stm.setString(4, r.getAddress());
            stm.setInt(5, r.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReceiverDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
