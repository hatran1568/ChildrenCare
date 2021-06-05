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
import bean.Role;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class UserDAO extends BaseDAO {

    public ArrayList<User> getUsers(int pageindex, int pagesize) {
        ArrayList<User> users = new ArrayList<>();
        try {

            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid, "
                    + "a.id, a.email, a.password, a.full_name,\n"
                    + "a.gender, a.mobile, a.address, a.image_link , r.name as role_name, a.id as role_id \n"
                    + "from user a left join Role r\n"
                    + "on a.role_id = r.id) as tbl\n"
                    + "where rid >= (? - 1)*? + 1 and rid <= ? * ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setFullName(rs.getString("full_name"));
                a.setGender(rs.getBoolean("gender"));
                a.setPassword(rs.getString("password"));
                a.setMobile(rs.getString("mobile"));
                a.setImageLink(rs.getString("image_link"));
                a.setAddress(rs.getString("address"));
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getNString("role_name"));
                a.setRole(r);
                users.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public int count() {
        try {
            String sql = "SELECT COUNT(*) as total FROM user";
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

    public void addUser(User u, boolean status) {
        try {
            String sql = "INSERT INTO `swp`.`user` (`status`,`email`, `password`, `full_name`, `gender`, `mobile`, `address`, `image_link`, `role_id`) \n"
                    + "VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setBoolean(1, status);
            stm.setString(2, u.getEmail());
            stm.setString(3, u.getPassword());
            stm.setString(4, u.getFullName());
            stm.setBoolean(5, u.isGender());
            stm.setString(6, u.getMobile());
            stm.setString(7, u.getAddress());
            stm.setString(8, u.getImageLink());
            stm.setInt(9, u.getRole().getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addCustomer(User u, boolean status) {
        try {
            String sql = "INSERT INTO `swp`.`user` (`status`,`email`, `password`, `full_name`, `gender`, `mobile`, `address`, `image_link`, `role_id`) \n"
                    + "VALUES (?,?,?,?,?,?,?,?,4)";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setBoolean(1, status);
            stm.setString(2, u.getEmail());
            stm.setString(3, u.getPassword());
            stm.setString(4, u.getFullName());
            stm.setBoolean(5, u.isGender());
            stm.setString(6, u.getMobile());
            stm.setString(7, u.getAddress());
            stm.setString(8, u.getImageLink());

            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public User getUser(int uid) {
        User a = new User();
        try {

            String sql = "select a.id, a.email, a.password, a.full_name,\n"
                    + "                    a.gender, a.mobile, a.address, a.image_link , r.name as role_name, a.id as role_id ,a.status\n"
                    + "                    from user a left join Role r \n"
                    + "                    on a.role_id = r.id\n"
                    + "                    where a.id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setInt(1, uid);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setFullName(rs.getString("full_name"));
                a.setGender(rs.getBoolean("gender"));
                a.setPassword(rs.getString("password"));
                a.setMobile(rs.getString("mobile"));
                a.setImageLink(rs.getString("image_link"));
                a.setAddress(rs.getString("address"));
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getNString("role_name"));
                a.setRole(r);
                a.setStatus(rs.getBoolean("status"));
                return a;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void update(User u) {
        try {
            String sql = "update user set email=?, password=?, full_name=?, gender=?, mobile=?, address=?, image_link=?, role_id=?,status=?\n"
                    + "where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, u.getEmail());
            stm.setString(2, u.getPassword());
            stm.setString(3, u.getFullName());
            stm.setBoolean(4, u.isGender());
            stm.setString(5, u.getMobile());
            stm.setString(6, u.getAddress());
            stm.setString(7, u.getImageLink());
            stm.setInt(8, u.getRole().getId());
            stm.setInt(10, u.getId());
            stm.setBoolean(9, u.isStatus());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStatus(User u, boolean status) {
        try {
            String sql = "update user set status=?\n"
                    + "where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setBoolean(1, status);
            stm.setString(2, u.getEmail());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int uid) {
        try {
            String sql = "DELETE FROM user WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<User> searchUserByEmailAndPass(String email, String pass) {
        try {
            ArrayList list = new ArrayList<User>();
            String sql = "select a.id, a.email, a.password, a.full_name,\n"
                    + "                    a.gender, a.mobile, a.address, a.image_link , r.name as role_name, a.id as role_id ,a.status\n"
                    + "                    from user a left join Role r \n"
                    + "                    on a.role_id = r.id\n"
                    + "                    where a.email = ? and a.password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setFullName(rs.getString("full_name"));
                a.setGender(rs.getBoolean("gender"));
                a.setPassword(rs.getString("password"));
                a.setMobile(rs.getString("mobile"));
                a.setImageLink(rs.getString("image_link"));
                a.setAddress(rs.getString("address"));
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getNString("role_name"));
                a.setRole(r);
                list.add(a);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<User> searchUserByEmail(String email) {
        try {
            ArrayList list = new ArrayList<User>();
            String sql = "select a.id, a.email, a.password, a.full_name,\n"
                    + "                    a.gender, a.mobile, a.address, a.image_link , r.name as role_name, a.id as role_id ,a.status\n"
                    + "                    from user a left join Role r \n"
                    + "                    on a.role_id = r.id\n"
                    + "                    where a.email = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
          
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                User a = new User();
                a.setId(rs.getInt("id"));
                a.setEmail(rs.getString("email"));
                a.setFullName(rs.getString("full_name"));
                a.setGender(rs.getBoolean("gender"));
                a.setPassword(rs.getString("password"));
                a.setMobile(rs.getString("mobile"));
                a.setImageLink(rs.getString("image_link"));
                a.setAddress(rs.getString("address"));
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getNString("role_name"));
                a.setRole(r);
                list.add(a);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
