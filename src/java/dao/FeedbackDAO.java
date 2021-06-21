/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
public class FeedbackDAO extends BaseDAO{
    public int getRatingStar(Service s){
        try {
            String sql = "SELECT sum(rated_star) as total from feedback where service_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
        
    }
    
    public int getService(Service s){
         try {
            String sql = "SELECT count(service_id) as total from feedback where service_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
        
    }
}
