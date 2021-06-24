/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.logging.Level;
import java.util.logging.Logger;


public class BaseDAO {
    protected Connection connection;
    
    public BaseDAO()
    {
        try {

            String user = "root";

            String pass = "123456";
            String url = "jdbc:mysql://localhost:3306/swp?autoReconnect=true&useSSL=false&allowPublicKeyRetrieval=true";


            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url, user, pass);            
        } catch (Exception ex) {
            Logger.getLogger(BaseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
}
