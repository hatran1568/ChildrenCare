/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.CartItem;
import bean.Service;
import bean.User;
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
public class CartDAO extends BaseDAO {

    public ArrayList<CartItem> getCartByUserId(User u) {

        try {
            ArrayList<CartItem> list = new ArrayList<CartItem>();

            String sql = "SELECT\n"
                    + "cart_item.user_id,\n"
                    + "cart_item.service_id,\n"
                    + "service.fullname,\n"
                    + "service.description,\n"
                    + "service.details,\n"
                    + "service.original_price,\n"
                    + "service.sale_price,\n"
                    + "service.thumbnail_link,\n"
                    + "cart_item.quantity\n"
                    + "FROM\n"
                    + "cart_item INNER JOIN service on cart_item.service_id = service.id\n"
                    + "WHERE user_id=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, u.getId());
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Service s = new Service();
                s.setId(rs.getInt("service_id"));
                s.setFullname(rs.getString("fullname"));
                s.setDetails(rs.getString("details"));
                s.setOriginalPrice(rs.getFloat("original_price"));
                s.setSalePrice(rs.getFloat("sale_price"));
                s.setThumbnailLink(rs.getString("thumbnail_link"));
                CartItem item = new CartItem(s, u, rs.getInt("quantity"));
                list.add(item);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateCart(User u, Service s, int quantity) {
        try {
            String sql = "update cart_item set quantity =? where user_id =? and service_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            stm.setInt(1, quantity);
            stm.setInt(2, u.getId());
            stm.setInt(3, s.getId());
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public void deleteCart(User u, Service s){
        try {
            String sql = "delete from cart_item  where user_id =? and service_id =?";
            PreparedStatement stm = connection.prepareStatement(sql);
            
            stm.setInt(1, u.getId());
            stm.setInt(2, s.getId());
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    public void addToCart(User user, Service service) {
        try {
            int quantity = checkExistence(user, service);
            String sql = "";
            if (quantity > 0) {
                sql = "update cart_item"
                        + " set quantity = ?"
                        + " where user_id = ? and service_id = ?";

                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(1, quantity + 1);
                stm.setInt(2, user.getId());
                stm.setInt(3, service.getId());

                stm.executeUpdate();
            } else {
                sql = "INSERT INTO `swp`.`cart_item` (`user_id`, `service_id`, `quantity`) VALUES (?, ?, ?)";
                PreparedStatement stm = connection.prepareStatement(sql);
                stm.setInt(3, 1);
                stm.setInt(1, user.getId());
                stm.setInt(2, service.getId());

                stm.executeUpdate();
            }

        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int checkExistence(User user, Service service) {
        try {
            String sql = "select user_id, service_id, quantity\n"
                    + " from cart_item\n"
                    + " where user_id = ? and service_id = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, user.getId());
            stm.setInt(2, service.getId());
            ResultSet rs = stm.executeQuery();

            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
