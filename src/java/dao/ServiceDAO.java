/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.Service;
import bean.ServiceCategory;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ServiceDAO extends BaseDAO{
    public ArrayList<Service> getServices(){
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "SELECT s.id, s.fullname, s.details, s.original_price, \n" +
"                    s.sale_price, s.thumbnail_link, s.description, s.category_id, c.name \n" +
"                    from service s left join (select id as category_id, name from setting where type=\"Service category\") as c\n" +
"                    on s.category_id = c.category_id";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
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
            if(cid != 0) a = "and s.category_id = " + String.valueOf(cid);
            if (search != null && search.length() != 0) {
                search = " and fullname like '%" + search + "%' ";
            }else search = " ";
            String sql = "select * from (select ROW_NUMBER() OVER (ORDER BY id ASC) as rid,\n"
                    + "s.id, fullname, description, details, original_price, sale_price, updated_date,  "
                    + "thumbnail_link, featured, status, "
                    + "category_id, sc.name as category_name\n"
                    + "from service s left join service_category sc\n"
                    + "on s.category_id = sc.id "
                    + "where (s.status is null or status = 1) " + a + search
                    + " order by featured desc) as tbl\n"
                    + "where rid >= (? - 1)*? + 1 and rid <= ? * ?";

            PreparedStatement stm = connection.prepareStatement(sql);

            //stm.setString(1, (category_id > 0)? "=" + category_id : "");
            stm.setInt(1, pageindex);
            stm.setInt(2, pagesize);
            stm.setInt(3, pageindex);
            stm.setInt(4, pagesize);

            ResultSet rs = stm.executeQuery();

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
                ServiceCategory category = new ServiceCategory();
                category.setId(rs.getInt("category_id"));
                category.setName(rs.getString("category_name"));
                s.setCategory(category);
                s.setFeatured(rs.getBoolean("featured"));
                s.setStatus(rs.getBoolean("status"));
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
            String sql = "select\n"
                    + "s.id, fullname, description, details, original_price, sale_price,  updated_date,\n"
                    + "featured, status, thumbnail_link, category_id, sc.name as category_name\n"
                    + "from service s left join service_category sc\n"
                    + "on s.category_id = sc.id\n"
                    + "where s.id = ?";
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
                category.setId(rs.getInt("category_id"));
                category.setName(rs.getString("category_name"));
                s.setCategory(category);
                s.setFeatured(rs.getBoolean("featured"));
                s.setStatus(rs.getBoolean("status"));
                
                
                return s;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(ServiceDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<ServiceCategory> getCategories(){
        ArrayList<ServiceCategory> categories = new ArrayList<>();
        try {
            String sql = "select id, name from service_category";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
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
}
