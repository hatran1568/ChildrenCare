/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.User;
import com.google.gson.Gson;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tran Thi Nguyet Ha
 */
public class ManagerCustomerController extends HttpServlet {

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
        String action = request.getServletPath();
        switch(action){
            case "/manager/customer/list":
                getCustomerList(request,response);
                break;
            case "/manager/customer/filter/status":
                getCustomerByStatus(request,response);
                break;
            default:
                getCustomerList(request,response);
                break;
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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

    private void getCustomerList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        UserDAO userDB = new UserDAO();
        ArrayList<User> customers = userDB.getCustomers();
        request.setAttribute("customers", customers);
        request.getRequestDispatcher("../../view/manager/customer/list.jsp").forward(request, response);
    }

    private void getCustomerByStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean status = Integer.parseInt(request.getParameter("status")) == 1;
        UserDAO userDB = new UserDAO();
        ArrayList<User> customers = userDB.getCustomers();
        ArrayList<User> filtered = new ArrayList<>();
        for (User u:customers){
            if (u.isStatus())
                filtered.add(u);
        }  
        String json = new Gson().toJson(filtered);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
//        request.setAttribute("customers", filtered);
//        request.getRequestDispatcher("../../../view/manager/customer/list.jsp").forward(request, response);
    }

}
