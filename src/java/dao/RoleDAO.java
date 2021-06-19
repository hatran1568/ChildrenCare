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
import bean.Role;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class RoleDAO extends BaseDAO{
    public ArrayList<Role> getRoles(){
        ArrayList<Role> list = new ArrayList<>();
        try {
            String sql = "SELECT id, `name` FROM Setting WHERE type = 'Role'";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Role r = new Role();
                r.setId( rs.getInt("id") );
                r.setName(rs.getString("name"));
                list.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
//    public static void main(String[] args) {
//        RoleDAO roleDB = new RoleDAO();
//        ArrayList<Role> list = roleDB.getRoles();
//        System.out.println(list.get(0).getId()+list.get(0).getName());
//    }
}
