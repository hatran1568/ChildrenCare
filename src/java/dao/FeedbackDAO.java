/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Feedback;
import bean.Service;
import bean.Setting;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ACER
 */
public class FeedbackDAO extends BaseDAO {

    ServiceDAO serviceDB = new ServiceDAO();
    SettingDAO settingDB = new SettingDAO();

    public int getRatingStar(Service s) {
        try {
            String sql = "SELECT sum(rated_star) as total from feedback where service_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;

    }

    public int getService(Service s) {
        try {
            String sql = "SELECT count(service_id) as total from feedback where service_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;

    }

    public void insertFeedback(Feedback f) {
        try {
            String sql = "Insert into feedback(fullname,gender,email,mobile,rated_star,content,service_id,image_link,status_id) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, f.getFullName());
            stm.setBoolean(2, f.isGender());
            stm.setString(3, f.getEmail());
            stm.setString(4, f.getMobile());
            stm.setInt(5, f.getRatedStar());
            stm.setString(6, f.getContent());
            stm.setInt(7, f.getService().getId());
            stm.setString(8, f.getImageLink());
            stm.setInt(9, 28);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertGeneralFeedback(Feedback f) {
        try {
            String sql = "Insert into feedback(fullname,gender,email,mobile,rated_star,content,service_id,image_link,status_id) values(?,?,?,?,?,?,null,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, f.getFullName());
            stm.setBoolean(2, f.isGender());
            stm.setString(3, f.getEmail());
            stm.setString(4, f.getMobile());
            stm.setInt(5, f.getRatedStar());
            stm.setString(6, f.getContent());

            stm.setString(7, f.getImageLink());
            stm.setInt(8, 28);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Feedback getFeedbackById(int id) {
        try {
            String sql = "Select * from feedback where id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(id);
                f.setFullName(rs.getString("fullname"));
                f.setEmail(rs.getString("email"));
                f.setGender(rs.getBoolean("gender"));
                f.setMobile(rs.getString("mobile"));
                f.setRatedStar(rs.getInt("rated_star"));
                f.setService(serviceDB.getService(rs.getInt("service_id")));
                f.setContent(rs.getString("content"));
                f.setStatus(settingDB.getSettingById(rs.getInt("status_id")));
                f.setImageLink(rs.getString("image_link"));
                return f;
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public void updateStatus(int id, Setting s) {
        try {
            String sql = "Update feedback set status_id = ? where id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, s.getId());
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Feedback> getFeedbacks() {
        ArrayList<Feedback> list = new ArrayList<>();
        try {
            String sql = "select id, fullname, gender, email, mobile, rated_star, content, service_id, image_link, status_id from feedback";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Feedback f = new Feedback();
                f.setId(rs.getInt("id"));
                f.setFullName(rs.getString("fullname"));
                f.setGender(rs.getBoolean("gender"));
                f.setEmail(rs.getString("email"));
                f.setMobile(rs.getString("mobile"));
                f.setRatedStar(rs.getInt("rated_star"));
                f.setContent(rs.getString("content"));
                f.setService(serviceDB.getService(rs.getInt("service_id")));
                f.setImageLink(rs.getString("image_link"));
                f.setStatus(settingDB.getSetting(rs.getInt("status_id")));

                list.add(f);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
