/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.CartItem;
import bean.Service;
import bean.ServiceCategory;
import dao.ServiceDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class ServiceController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

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

        
        String action = request.getServletPath();

        switch (action) {
            
            case "/service/list":
                showListService(request, response);
                break;
            case "/login":
                break;
            case "/register":
                break;
            
            default:

                break;
        }
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

    
    protected void showListService(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String search = request.getParameter("search");
        if(search == null) search = " ";
        
        String r_pagesize = getServletContext().getInitParameter("pagesize");
        int pagesize = Integer.parseInt(r_pagesize);

        String r_pageindex = request.getParameter("page");
        if (r_pageindex == null) {
            r_pageindex = "1";//validation
        }
        int pageindex = Integer.parseInt(r_pageindex);
        
        String r_category = request.getParameter("category");
        if (r_category == null) {
            r_category = "0";//validation
        }
        int category = Integer.parseInt(r_category);

        
        ServiceDAO db = new ServiceDAO();
        int count = db.count();
        int totalpage = (count % pagesize == 0)
                ? count / pagesize
                : count / pagesize + 1;
        String url = "list";

        ArrayList<ServiceCategory> categories = db.getCategories();
        
        ArrayList<Service> services = db.getServices(pageindex, pagesize, category, search);
        request.setAttribute("search", search);
        request.setAttribute("categories", categories);
        request.setAttribute("services", services);
        request.setAttribute("totalpage", totalpage);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("paggerUrl", url);
        request.getRequestDispatcher("/view/service/list.jsp").forward(request, response);
    }
}