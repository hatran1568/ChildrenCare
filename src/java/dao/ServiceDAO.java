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

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class ServiceDAO extends BaseDAO{
    public ArrayList<Service> getServices(){
        ArrayList<Service> list = new ArrayList<>();
        try {
            String sql = "SELECT s.id, s.fullname, s.details, s.original_price, "
                    + "s.sale_price, s.thumbnail_link, s.description, s.category_id, c.name "
                    + "from service s left join service_category c on s.category_id = c.id";
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
}
