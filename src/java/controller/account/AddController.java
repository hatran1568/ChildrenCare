/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.account;

import dao.RoleDAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import bean.Role;
import bean.User;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class AddController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RoleDAO roleDB = new RoleDAO();
        ArrayList<Role> roles = roleDB.getRoles();
        request.setAttribute("roles", roles);
        
        request.getRequestDispatcher("../../view/account/add.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User u = new User();
        u.setId(Integer.parseInt(request.getParameter("id")));
        u.setEmail(request.getParameter("email"));
        u.setAddress(request.getParameter("address"));
        u.setGender(request.getParameter("gender").equals("male"));
        u.setFullName(request.getParameter("full-name"));
        u.setImageLink(request.getParameter("image-link"));
        u.setPassword("admin");
        u.setMobile(request.getParameter("mobile"));
        Role r = new Role();
        r.setId(Integer.parseInt(request.getParameter("role")));
        u.setRole(r);
        
        UserDAO userDB = new UserDAO();
        userDB.addUser(u);
        
        response.sendRedirect("../list");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
