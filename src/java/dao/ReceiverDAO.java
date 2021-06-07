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
                    + "            mobile, address)\n"
                    + "            values(?, ?, ?, ?, ?, ?)";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, r.getId());
            stm.setInt(2, r.getUser().getId());
            stm.setString(3, r.getFull_name());
            stm.setBoolean(4, r.isGender());
            stm.setString(5, r.getMobile());
            stm.setString(6, r.getAddress());
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ReservationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
