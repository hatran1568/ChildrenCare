/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Service;
import bean.ServiceCategory;
import bean.Setting;
import dao.ServiceDAO;
import dao.SettingDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Quynh Trang
 */
public class ManagerServiceController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ManagerServiceController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ManagerServiceController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String action = request.getServletPath();

        switch (action) {
            
            case "/manager/service/list":
                showServiceList(request, response);
                break;
            case "/manager/service/details":
                showServiceDetail(request, response);
                break;
            case "/manager/service/add":
                showFormAddService(request, response);
                break;
            case "/manager/service/edit":
                showFormEdit(request, response);
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
          String action = request.getServletPath();

        switch (action) {
            
            case "/manager/service/list":
                showServiceList(request, response);
                break;   
            case "/manager/service/add":
                addServiceList(request, response);
                break;
            case "/manager/service/edit":
                editServiceList(request, response);
                break; 
            default:
                break;
        }
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
    protected void showServiceList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServiceDAO serviceDB = new ServiceDAO();
        ArrayList<Service> services = serviceDB.getAllServices();
        ArrayList<ServiceCategory> categories = serviceDB.getCategories();
        request.setAttribute("categories", categories);
        request.setAttribute("services", services);
             
        
        request.getRequestDispatcher("../../view/manager/service/list.jsp").forward(request, response);
        
    }
    protected void showServiceDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        int sid = Integer.parseInt(request.getParameter("sid"));
        ServiceDAO serviceDB = new ServiceDAO();
        Service services = serviceDB.getService(sid);
        
        ArrayList<ServiceCategory> categories = serviceDB.getCategories();
        request.setAttribute("categories", categories);
        request.setAttribute("services", services);
        request.getRequestDispatcher("../../view/manager/service/details.jsp").forward(request, response);
        request.getRequestDispatcher("../../view/manager/service/details.jsp").forward(request, response);
    }
    private void showFormAddService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> categories = settingDB.getSetting("Service category");
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("../../view/manager/service/add.jsp").forward(request, response);
    }
    protected void addServiceList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullname= request.getParameter("fullname");
        int originalprice= Integer.parseInt(request.getParameter("originalprice")) ;
        int saleprice= Integer.parseInt(request.getParameter("saleprice")) ;
        String thumbnaillink= request.getParameter("thumbnaillink");
        int categoryid= Integer.parseInt(request.getParameter("categoryid")) ;
        String description= request.getParameter("description");
        String details= request.getParameter("details");
        Date updateddate= Date.valueOf(request.getParameter("updateddate"));
        boolean featured=Boolean.parseBoolean(request.getParameter("featured")) ;
        boolean status= Boolean.parseBoolean(request.getParameter("status")) ;
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        Service s= new Service();

        s.setDescription(description);
        s.setDetails(details);
        s.setFeatured(featured);
        s.setOriginalPrice(originalprice);
        s.setSalePrice(saleprice);
        s.setThumbnailLink(thumbnaillink);
        
        ServiceCategory sc= new ServiceCategory();
        sc.setId(categoryid);
        s.setUpdatedDate(updateddate);
        s.setStatus(status);
        s.setFullname(fullname);
        s.setQuantity(quantity);
        s.setCategory(sc);
        ServiceDAO serviceDB= new ServiceDAO();
        serviceDB.insert(s);
        response.sendRedirect("list");
      
    }
    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sid = Integer.parseInt(request.getParameter("sid"));
        ServiceDAO serviceDB = new ServiceDAO();
        Service s = serviceDB.getService(sid);
        request.setAttribute("service", s);
        SettingDAO settingDB = new SettingDAO();
        ArrayList<Setting> serviceCategories = settingDB.getSetting("Service category");
        request.setAttribute("categories", serviceCategories);
        request.getRequestDispatcher("../../view/manager/service/edit.jsp").forward(request, response);
    }
    protected void editServiceList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("sid"));
        String fullname= request.getParameter("fullname");
        float originalprice= Float.parseFloat(request.getParameter("originalprice")) ;
        float saleprice= Float.parseFloat(request.getParameter("saleprice")) ;
        String thumbnaillink= request.getParameter("thumbnaillink");
        int categoryid= Integer.parseInt(request.getParameter("categoryid")) ;
        String description= request.getParameter("description");
        String details= request.getParameter("details");
        boolean featured=Boolean.parseBoolean(request.getParameter("featured")) ;
        boolean status= Boolean.parseBoolean(request.getParameter("status")) ;
        int quantity= Integer.parseInt(request.getParameter("quantity"));
        Service s= new Service();
        s.setDescription(description);
        s.setDetails(details);
        s.setFeatured(featured);
        s.setOriginalPrice(originalprice);
        s.setSalePrice(saleprice);
        s.setThumbnailLink(thumbnaillink);
        s.setId(id);
        ServiceCategory sc= new ServiceCategory();
        sc.setId(categoryid);
        
        s.setStatus(status);
        s.setFullname(fullname);
        s.setQuantity(quantity);
        s.setCategory(sc);
        ServiceDAO serviceDB= new ServiceDAO();
        serviceDB.update(s);
        response.sendRedirect("list");

    }  
    public void delete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id= Integer.parseInt(request.getParameter("sid"));
        ServiceDAO serviceDB= new ServiceDAO();
        serviceDB.delete(id);
        response.sendRedirect("list");
    
    }
        
}