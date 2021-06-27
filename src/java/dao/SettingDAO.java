/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import bean.Setting;

public class SettingDAO extends BaseDAO {

    public ArrayList<Setting> getSettings() {
        ArrayList<Setting> settings = new ArrayList<>();
        try {

            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid,\n"
                        + "s.id, s.type, s.name, s.value, s.description, s.status\n"
                        + "from setting s ) as tbl\n";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setId(rs.getInt("id"));
                s.setType(rs.getString("type"));
                s.setName(rs.getString("name"));
                s.setDescription(rs.getString("description"));
                s.setStatus(rs.getString("status"));
                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settings;
    }

    public int count() {
        try {
            String sql = "SELECT COUNT(*) as total FROM setting";
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

    public void addSetting(Setting s) {
        try {
            String sql = "INSERT INTO `swp`.`setting` (`type`, `name`, `value`, `description`, `status`) \n"
                    + "VALUES (?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, s.getType());
            stm.setString(2, s.getName());
            stm.setInt(3, 1);
            stm.setString(4, s.getDescription());
            stm.setString(5, s.getStatus());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Setting getSetting(int sid) {
        Setting s = new Setting();
        try {

            String sql = "select s.id, s.type, s.name, s.value, s.description, s.status\n"
                    + "                    from setting s\n"
                    + "                    where s.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, sid);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                s.setId(rs.getInt("id"));
                s.setType(rs.getString("type"));
                s.setName(rs.getString("name"));
                s.setDescription(rs.getString("description"));
                s.setStatus(rs.getString("status"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(Setting s) {
        try {
            String sql = "update setting set type=?, name=?, value=?, description=?, status=?\n"
                    + "where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, s.getType());
            stm.setString(2, s.getName());
            stm.setInt(3, 1);
            stm.setString(4, s.getDescription());
            stm.setString(5, s.getStatus());
            stm.setInt(6, s.getId());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStatus(Setting s, String status) {
        try {
            String sql = "update setting set status=?\n"
                    + "where sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, status);
            stm.setInt(2, s.getId());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int sid) {
        try {
            String sql = "DELETE FROM setting WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public ArrayList<Setting> getSetting(String type){
        ArrayList<Setting> settings = new ArrayList<>();
        try{
            String sql = "SELECT id, name from setting where type = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, type);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Setting s = new Setting();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                settings.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return settings;
    }
    
    public Setting getSettingById(int id){
        try {
            String sql ="SELECT id ,`name` FROM setting where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Setting s = new Setting();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("Name"));
                return s;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SettingDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
}
