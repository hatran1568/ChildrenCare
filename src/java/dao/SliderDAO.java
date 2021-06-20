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
public class SliderDAO extends BaseDAO {
    
    public void updateSlider(Slider r){
        try {
            String sql = "Update slider set title =? , image_link=?,backlink = ? , status = ? ,notes = ? where id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, r.getTitle());
            stm.setString(2, r.getImageLink());
            stm.setString(3,r.getBacklink());
            stm.setBoolean(4, r.isStatus());
            stm.setString(5,r.getNotes());
            stm.setInt(6, r.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ArrayList<Slider> getActiveSliders() {
        ArrayList<Slider> slider = new ArrayList<>();
        try {
            String sql = "Select id, title, image_link, backlink, status, notes from slider where status = 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Slider s = new Slider();
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

    public ArrayList<Slider> getSliderPagination(int pageindex, int pagesize) {
        try {
            ArrayList<Slider> list = new ArrayList<Slider>();
            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid,\n"
                    + "                    id,title,image_link,backlink,status,notes\n"
                    + "                    from slider ) a\n"
                    + "                    where rid >= (?-1)*?+1 and rid <= ?*?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Slider s = new Slider();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImageLink(rs.getString("image_link"));
                s.setStatus(rs.getBoolean("status"));
                s.setBacklink(rs.getString("backlink"));
                s.setNotes(rs.getString("notes"));
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int count() {
        try {
            String sql = "SELECT COUNT(*) as total FROM slider";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int count(String search, boolean status) {
        try {
            String sql = "SELECT COUNT(*) as total FROM slider\n"
                    + "  where (title like '%" + search + "%' or backlink like '%" + search + "%') and status =? ";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setBoolean(1, status);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int count(String search) {
        try {
            String sql = "SELECT COUNT(*) as total FROM slider\n"
                    + "  where (title like '%" + search + "%' or backlink like '%" + search + "%') ";
            PreparedStatement stm = connection.prepareStatement(sql);

            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public void setStatus(boolean status, Slider s) {
        try {
            String sql = "Update slider set status =? where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, status);
            stm.setInt(2, s.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Slider getSliderByID(int id) {
        try {
            Slider s = new Slider();
            String sql = "Select * from slider where id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImageLink(rs.getString("image_link"));
                s.setStatus(rs.getBoolean("status"));
                s.setBacklink(rs.getString("backlink"));
                s.setNotes(rs.getString("notes"));
            }
            return s;
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ArrayList<Slider> searchSliderPagination(int pageindex, int pagesize, String search, boolean status) {
        try {
            ArrayList<Slider> list = new ArrayList<Slider>();
            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid,\n"
                    + "                                       id,title,image_link,backlink,status,notes\n"
                    + "                                      from slider ) a where (title like '%" + search + "%' or backlink like '%" + search + "%') and\n"
                    + "                                     rid >= (?-1)*?+1 and rid <= ?*? and status =? ";

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setBoolean(5, status);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Slider s = new Slider();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImageLink(rs.getString("image_link"));
                s.setStatus(rs.getBoolean("status"));
                s.setBacklink(rs.getString("backlink"));
                s.setNotes(rs.getString("notes"));
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Slider> searchSliderPagination(int pageindex, int pagesize, String search) {
        try {
            ArrayList<Slider> list = new ArrayList<Slider>();
            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid,\n"
                    + "                                       id,title,image_link,backlink,status,notes\n"
                    + "                                      from slider ) a where (title like '%" + search + "%' or backlink like '%" + search + "%') and\n"
                    + "                                     rid >= (?-1)*?+1 and rid <= ?*? ";

            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Slider s = new Slider();
                s.setId(rs.getInt("id"));
                s.setTitle(rs.getString("title"));
                s.setImageLink(rs.getString("image_link"));
                s.setStatus(rs.getBoolean("status"));
                s.setBacklink(rs.getString("backlink"));
                s.setNotes(rs.getString("notes"));
                list.add(s);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insert(Slider s) {
        try {
            String sql = "INSERT INTO\n"
                    + "slider(title,image_link,backlink,status,notes)\n"
                    + "VALUES(?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, s.getTitle());
            stm.setBoolean(4, s.isStatus());
            stm.setString(2, s.getImageLink());
            stm.setString(3, s.getBacklink());
            stm.setString(5, s.getNotes());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SliderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
