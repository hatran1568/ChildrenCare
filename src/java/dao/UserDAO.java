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
import java.sql.Statement;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class UserDAO extends BaseDAO {

    public ArrayList<User> getUsers(int pageindex, int pagesize) {
        ArrayList<User> users = new ArrayList<>();
        try {

            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid, \n" +
"                    a.id, a.email, a.password, a.full_name, \n" +
"                    a.gender, a.mobile, a.address, a.image_link , r.role_name, a.role_id \n" +
"                    from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r\n" +
"                    on a.role_id = r.role_id) as tbl"
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
    public ArrayList<User> getAllUsers() {
        ArrayList<User> users = new ArrayList<>();
        try {

            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid, \n" +
"                    a.id, a.email, a.password, a.full_name, \n" +
"                    a.gender, a.mobile, a.address, a.image_link , r.role_name, a.role_id \n" +
"                    from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r\n" +
"                    on a.role_id = r.role_id) as tbl";
            PreparedStatement stm = connection.prepareStatement(sql);
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
                a.setStatus(rs.getBoolean("status"));
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

    public void addUser(User u, boolean status, int updatedBy) {
        try {
            connection.setAutoCommit(false);
            // insert to user tbl
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
            
            // get newly inserted user
            User user = this.getUserByEmail(u.getEmail());
            // insert to history
            String new_sql = "INSERT INTO `swp`.`user_history`\n" +
                            "(`user_id`,`email`,`full_name`,`gender`,`mobile`,`address`,`status`,`updated_by`,`updated_date`,`role_id`)\n" +
                            "VALUES\n" +
                            "(?,?,?,?,?,?,?,?,now(),?);";
            PreparedStatement new_stm = connection.prepareStatement(new_sql);
            new_stm.setInt(1, user.getId());
            new_stm.setString(2, u.getEmail());
            new_stm.setString(3, u.getFullName());
            new_stm.setBoolean(4, u.isGender());
            new_stm.setString(5, u.getMobile());
            new_stm.setString(6, u.getAddress());
            new_stm.setBoolean(7, user.isStatus());
            new_stm.setInt(8, updatedBy);
            new_stm.setInt(9, user.getRole().getId());
            new_stm.executeUpdate();
            
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    public void addCustomer(User u, boolean status, int updatedBy){
        try {
            connection.setAutoCommit(false);
            
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
            
            // get newly inserted user
            User user = this.getUserByEmail(u.getEmail());
            
            // insert to history
            String new_sql = "INSERT INTO `swp`.`user_history`\n" +
                            "(`user_id`,`email`,`full_name`,`gender`,`mobile`,`address`,`status`,`updated_by`,`updated_date`,`role_id`)\n" +
                            "VALUES\n" +
                            "(?,?,?,?,?,?,?,?,now(),?);";
            PreparedStatement new_stm = connection.prepareStatement(new_sql);
            new_stm.setInt(1, user.getId());
            new_stm.setString(2, u.getEmail());
            new_stm.setString(3, u.getFullName());
            new_stm.setBoolean(4, u.isGender());
            new_stm.setString(5, u.getMobile());
            new_stm.setString(6, u.getAddress());
            new_stm.setBoolean(7, user.isStatus());
            new_stm.setInt(8, updatedBy);
            new_stm.setInt(9, user.getRole().getId());
            new_stm.executeUpdate();
            
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    public User getUser(int uid) {
        User a = new User();
        try {

            String sql = "select a.id, a.email, a.password, a.full_name,\n" +
"                   a.gender, a.mobile, a.address, a.image_link , r.role_name, a.role_id,a.status\n" +
"                    from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r\n" +
"                  on a.role_id = r.role_id\n" +
"                  where a.id = ?";
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

    public User getUserByEmail(String mail) {
        User a = new User();
        try {

            String sql = "select a.id, a.email, a.password, a.full_name,\n" +
"                   a.gender, a.mobile, a.address, a.image_link , r.role_name, a.role_id,a.status\n" +
"                    from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r\n" +
"                  on a.role_id = r.role_id\n" +
"                  where a.email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, mail);

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
    public void update(User u, int updatedBy){
        try {
            connection.setAutoCommit(false);
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

            // get newly inserted user
            User user = this.getUser(u.getId());
            // insert to history
            String new_sql = "INSERT INTO `swp`.`user_history`\n" +
                            "(`user_id`,`email`,`full_name`,`gender`,`mobile`,`address`,`status`,`updated_by`,`updated_date`,`role_id`)\n" +
                            "VALUES\n" +
                            "(?,?,?,?,?,?,?,?,now(),?);";
            PreparedStatement new_stm = connection.prepareStatement(new_sql);
            new_stm.setInt(1, user.getId());
            new_stm.setString(2, user.getEmail());
            new_stm.setString(3, user.getFullName());
            new_stm.setBoolean(4, user.isGender());
            new_stm.setString(5, user.getMobile());
            new_stm.setString(6, user.getAddress());
            new_stm.setBoolean(7, user.isStatus());
            new_stm.setInt(8, updatedBy);
            new_stm.setInt(9, user.getRole().getId());
            new_stm.executeUpdate();
            
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
    
    public void updateByAdmin(User u) {
        try {
            String sql = "update user set role_id=?,status=?\n"
                    + "where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getRole().getId());
            stm.setBoolean(2, u.isStatus());
            stm.setInt(3, u.getId());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateStatus(User u, boolean status) {
        try {
            
            connection.setAutoCommit(false);
            String sql = "update user set status=?\n"
                    + "where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setBoolean(1, status);
            stm.setString(2, u.getEmail());

            stm.executeUpdate();

            // get newly inserted user
            User user = this.getUserByEmail(u.getEmail());
            // insert to history
            String new_sql = "INSERT INTO `swp`.`user_history`\n" +
                            "(`user_id`,`email`,`full_name`,`gender`,`mobile`,`address`,`status`,`updated_by`,`updated_date`,`role_id`)\n" +
                            "VALUES\n" +
                            "(?,?,?,?,?,?,?,?,now(),?);";
            PreparedStatement new_stm = connection.prepareStatement(new_sql);
            new_stm.setInt(1, user.getId());
            new_stm.setString(2, u.getEmail());
            new_stm.setString(3, u.getFullName());
            new_stm.setBoolean(4, u.isGender());
            new_stm.setString(5, u.getMobile());
            new_stm.setString(6, u.getAddress());
            new_stm.setBoolean(7, user.isStatus());
            new_stm.setInt(8, 1);
            new_stm.setInt(9, user.getRole().getId());
            new_stm.executeUpdate();
            
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
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
                    + "                    a.gender, a.mobile, a.address, a.image_link , r.role_name, a.role_id ,a.status\n"
                    + "                    from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r \n"
                    + "                    on a.role_id = r.role_id\n"
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
                a.setStatus(rs.getBoolean("status"));
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
                    + "                    a.gender, a.mobile, a.address, a.image_link , r.role_name, a.role_id ,a.status\n"
                    + "                    from user a left join (select id as role_id, name as role_name from setting where type = \"Role\") as r \n"
                    + "                    on a.role_id = r.role_id\n"
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
                r.setName(rs.getString("role_name"));
                a.setRole(r);
                list.add(a);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public ArrayList<User> getStaff() {
        ArrayList<User> staff = new ArrayList<>();
        try {
            String sql = "select `user`.id,`user`.address,`user`.email,`user`.role_id,`user`.image_link,`user`.gender,`user`.full_name,`user`.mobile,`user`.`password`,`user`.`status`,r.`role_name`\n" +
"                   from user inner join (select id as role_id, `name` as role_name from setting where type = \"Role\") as r \n" +
"                   on `user`.role_id = r.role_id \n" +
"                   where r.role_name = \"Staff\"";
            PreparedStatement stm = connection.prepareStatement(sql);
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
                r.setName(rs.getString("role_name"));
                a.setRole(r);
                staff.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return staff;
    }
    
    public ArrayList<User> getCustomers(){
        ArrayList<User> customers = new ArrayList<>();
        try {
            String sql = "select `user`.id,`user`.address,`user`.email,`user`.role_id,`user`.image_link,`user`.gender,`user`.full_name,`user`.mobile,`user`.`password`,`user`.`status`,r.`role_name`\n" +
"                   from user inner join (select id as role_id, `name` as role_name from setting where type = \"Role\") as r \n" +
"                   on `user`.role_id = r.role_id \n" +
"                   where r.role_name = \"Customer\" and id!=-1";
            PreparedStatement stm = connection.prepareStatement(sql);
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
                a.setStatus(rs.getBoolean("status"));
                Role r = new Role();
                r.setId(rs.getInt("role_id"));
                r.setName(rs.getString("role_name"));
                a.setRole(r);
                customers.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }
    public void updateWithoutPassword(User u, int updatedBy){
        try {
            connection.setAutoCommit(false);
            String sql = "update user set email=?, password=?, full_name=?, gender=?, mobile=?, address=?, image_link=?, role_id=?,status=?\n"
                    + "where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);

            stm.setString(1, u.getEmail());
            stm.setString(2, u.getFullName());
            stm.setBoolean(3, u.isGender());
            stm.setString(4, u.getMobile());
            stm.setString(5, u.getAddress());
            stm.setString(6, u.getImageLink());
            stm.setInt(7, u.getRole().getId());
            stm.setInt(9, u.getId());
            stm.setBoolean(8, u.isStatus());
            stm.executeUpdate();

            // get newly inserted user
            User user = this.getUser(u.getId());
            // insert to history
            String new_sql = "INSERT INTO `swp`.`user_history`\n" +
                            "(`user_id`,`email`,`full_name`,`gender`,`mobile`,`address`,`status`,`updated_by`,`updated_date`,`role_id`)\n" +
                            "VALUES\n" +
                            "(?,?,?,?,?,?,?,?,now(),?);";
            PreparedStatement new_stm = connection.prepareStatement(new_sql);
            new_stm.setInt(1, user.getId());
            new_stm.setString(2, user.getEmail());
            new_stm.setString(3, user.getFullName());
            new_stm.setBoolean(4, user.isGender());
            new_stm.setString(5, user.getMobile());
            new_stm.setString(6, user.getAddress());
            new_stm.setBoolean(7, user.isStatus());
            new_stm.setInt(8, updatedBy);
            new_stm.setInt(9, user.getRole().getId());
            new_stm.executeUpdate();
            
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
    
    
}
