/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Service;
import bean.ServiceCategory;
import bean.Setting;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServiceDAO extends BaseDAO {

    SettingDAO settingDB = new SettingDAO();

    public ArrayList<Service> getServices() {
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "SELECT s.id, s.fullname, s.details, s.original_price, \n"
                    + "                    s.sale_price, s.thumbnail_link, s.description, s.category_id, c.name \n"
                    + "                    from service s left join (select id as category_id, name from setting where type=\"Service category\") as c\n"
                    + "                    on s.category_id = c.category_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service s = new Service();
                ServiceCategory category = new ServiceCategory();
                s.setId(rs.getInt("id"));
                s.setFullname(rs.getString("fullname"));
                s.setOriginalPrice(rs.getFloat("original_price"));
                s.setSalePrice(rs.getFloat("sale_price"));
                s.setThumbnailLink(rs.getString("thumbnail_link"));
                s.setDescription(rs.getString("description"));
                s.setDetails(rs.getString("details"));
                category.setId(rs.getInt("category_id"));
                category.setName(rs.getString("name"));
                s.setCategory(category);
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Service> getServices(int pageindex, int pagesize, int cid, String search) {
        ArrayList<Service> services = new ArrayList<>();
        try {
            String a = " ";
            if (cid != 0) {
                a = "and category_id = " + String.valueOf(cid);
            }
            if (search != null && search.length() != 0) {
                search = " and fullname like '%" + search + "%' ";
            } else {
                search = " ";
            }
            String sql = "select *\n"
                    + " from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid, \n"
                    + " id, fullname, original_price, sale_price, thumbnail_link, category_id, description, details, updated_date, featured, status, quantity\n"
                    + " from service \n"
                    + " where (status is null or status = 1) \n" + a + search
                    + " order by featured desc) as x\n"
                    + " where rid >= (? - 1)*? + 1 and rid <= ? * ?";

            PreparedStatement stm = connection.prepareStatement(sql);

            //stm.setString(1, (category_id > 0)? "=" + category_id : "");
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);

            ResultSet rs = stm.executeQuery();
            SettingDAO settingDB = new SettingDAO();
            while (rs.next()) {
                Service s = new Service();
                s.setId(rs.getInt("id"));
                s.setFullname(rs.getString("fullname"));
                s.setOriginalPrice(rs.getFloat("original_price"));
                s.setSalePrice(rs.getFloat("sale_price"));
                s.setThumbnailLink(rs.getString("thumbnail_link"));
                s.setDescription(rs.getString("description"));
                s.setDetails(rs.getString("details"));
                s.setUpdatedDate(rs.getDate("updated_date"));
                s.setFeatured(rs.getBoolean("featured"));
                s.setStatus(rs.getBoolean("status"));
                s.setQuantity(rs.getInt("quantity"));

                Setting category = settingDB.getSetting(rs.getInt("category_id"));
                ServiceCategory sc = new ServiceCategory(category.getId(), category.getName());
                s.setCategory(sc);
                services.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return services;
    }

    public int count() {
        try {
            String sql = "SELECT COUNT(*) as total FROM service\n";
            //+ "where category_id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            //stm.setString(1, (category_id > 0)? "=" + category_id : "");
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("total");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public Service getService(int sid) {
        try {

            String sql = "SELECT\n"
                    + "service.id,\n"
                    + "service.fullname,\n"
                    + "service.original_price,\n"
                    + "service.sale_price,\n"
                    + "service.thumbnail_link,\n"
                    + "service.category_id,\n"
                    + "service.description,\n"
                    + "service.details,\n"
                    + "service.updated_date,\n"
                    + "service.featured,\n"
                    + "service.`status`,\n"
                    + "service.quantity\n"
                    + "FROM\n"
                    + "service\n"
                    + "where id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                Service s = new Service();
                s.setId(rs.getInt("id"));
                s.setFullname(rs.getString("fullname"));
                s.setOriginalPrice(rs.getFloat("original_price"));
                s.setSalePrice(rs.getFloat("sale_price"));
                s.setThumbnailLink(rs.getString("thumbnail_link"));
                s.setDescription(rs.getString("description"));
                s.setDetails(rs.getString("details"));
                s.setUpdatedDate(rs.getDate("updated_date"));
                ServiceCategory category = new ServiceCategory();
                category.setId(settingDB.getSettingById(rs.getInt("category_id")).getId());
                category.setName(settingDB.getSettingById(rs.getInt("category_id")).getName());
                s.setCategory(category);
                s.setFeatured(rs.getBoolean("featured"));
                s.setStatus(rs.getBoolean("status"));
                s.setQuantity(rs.getInt("quantity"));

                return s;
            }

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<ServiceCategory> getCategories() {
        ArrayList<ServiceCategory> categories = new ArrayList<>();
        try {
            String sql = "select id, name from setting where type=\"Service category\"";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                ServiceCategory sc = new ServiceCategory();
                sc.setId(rs.getInt("id"));
                sc.setName((rs.getString("name")));

                categories.add(sc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categories;
    }

    public int count(int cid, String search) {

        try {
            String a = " ";
            if (cid != 0) {
                a = "and s.category_id = " + String.valueOf(cid);
            }
            if (search != null && search.length() != 0) {
                search = " and fullname like '%" + search + "%' ";
            } else {
                search = " ";
            }

            String sql = "SELECT COUNT(*) as total \n"
                    + "from service s left join (select id as category_id, name from setting where type=\"Service category\") as c\n"
                    + "on s.category_id = c.category_id\n"
                    + "where (s.status is null or status = 1 )\n"
                    + a + search
                    + " order by featured desc";

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

    public void insert(Service s) {
        try {
            String sql = "INSERT INTO `swp`.`service`\n"
                    + "(fullname,original_price,sale_price,thumbnail_link,category_id,description,details,updated_date,featured,status,quantity)\n"
                    + "VALUES(?,?,?,?,?,?,?,NOW(),?,?,?);";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, s.getFullname());
            stm.setFloat(2, s.getOriginalPrice());
            stm.setFloat(3, s.getSalePrice());
            stm.setString(4, s.getThumbnailLink());
            stm.setInt(5, s.getCategory().getId());
            stm.setString(6, s.getDescription());
            stm.setString(7, s.getDetails());

            stm.setBoolean(8, s.isFeatured());
            stm.setBoolean(9, s.isStatus());
            stm.setInt(10, s.getQuantity());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void update(Service s) {
        try {
            String sql = "UPDATE `swp`.`service`\n"
                    + "SET\n"
                    + "fullname = ?,\n"
                    + "original_price = ?,\n"
                    + "sale_price = ?,\n"
                    + "thumbnail_link = ?,\n"
                    + "category_id= ?,\n"
                    + "description = ?,\n"
                    + "details= ?,\n"
                    + "updated_date = now(),\n"
                    + "featured = ?,\n"
                    + "status = ?,\n"
                    + "quantity=?\n"
                    + "WHERE id = ?;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, s.getFullname());
            stm.setFloat(2, s.getOriginalPrice());
            stm.setFloat(3, s.getSalePrice());
            stm.setString(4, s.getThumbnailLink());
            stm.setInt(5, s.getCategory().getId());
            stm.setString(6, s.getDescription());
            stm.setString(7, s.getDetails());

            stm.setBoolean(8, s.isFeatured());
            stm.setBoolean(9, s.isStatus());
            stm.setInt(10, s.getQuantity());
            stm.setInt(11, s.getId());

            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void delete(int id) {
        try {
            String sql = "DELETE FROM service\n"
                    + "WHERE id= ?;";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Service> getAllServices() {
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "SELECT * \n"
                    + "FROM swp.service;";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service s = new Service();
                ServiceCategory category = new ServiceCategory();
                s.setId(rs.getInt("id"));
                s.setFullname(rs.getString("fullname"));
                s.setOriginalPrice(rs.getFloat("original_price"));
                s.setSalePrice(rs.getFloat("sale_price"));
                s.setThumbnailLink(rs.getString("thumbnail_link"));
                category.setId(rs.getInt("category_id"));
                s.setDescription(rs.getString("description"));
                s.setDetails(rs.getString("details"));
                s.setFeatured(rs.getBoolean("featured"));
                s.setStatus(rs.getBoolean("status"));
                s.setQuantity(rs.getInt("quantity"));

                s.setCategory(category);
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public void subtractServiceQuantity(int id, int quantity) {
        try {
            Service s = getService(id);
            String sql = "UPDATE `swp`.`service`\n"
                    + "SET\n"
                    + "`quantity` = ?\n"
                    + "WHERE `id` =?;";
            PreparedStatement stm = connection.prepareStatement(sql);
            int remaining = s.getQuantity() - quantity;
            stm.setInt(1, remaining);
            stm.setInt(2, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
