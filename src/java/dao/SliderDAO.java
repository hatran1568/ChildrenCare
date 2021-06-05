/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Slider;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class SliderDAO extends BaseDAO{
    public ArrayList<Slider> getActiveSliders(){
        ArrayList<Slider> slider = new ArrayList<>();
        try {
            String sql = "Select id, title, image_link, backlink, status, notes from slider where status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            Slider s = new Slider();
            while(rs.next()){
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImageLink(rs.getString("image_link"));
                s.setBacklink(rs.getString("backlink"));
                s.setStatus(rs.getBoolean("status"));
                s.setNotes(rs.getString("notes"));
                slider.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return slider;
    }
}
